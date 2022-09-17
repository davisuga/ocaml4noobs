let _ = Dotenv.export ()
let db_url = Sys.getenv_opt "DB_URL" |> Option.value ~default:"pg"