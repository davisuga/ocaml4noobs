exception Query_error of string
exception Db_connection_error of string

let pool =
  match Caqti_lwt.connect_pool ~max_size:10 (Uri.of_string Config.db_url) with
  | Ok pool -> pool
  | Error error -> raise (Db_connection_error (Caqti_error.show error))

open Lwt.Infix

let dispatch query =
  Caqti_lwt.Pool.use query pool >>= function
  | Ok data -> Lwt.return data
  | Error error -> Lwt.fail (Query_error (Caqti_error.show error))

let migrate () = Schema.create_tables |> dispatch |> Lwt_main.run
