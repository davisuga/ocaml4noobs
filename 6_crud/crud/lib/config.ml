(* Lê as variáveis do .env *)
let _ = Dotenv.export ()

(* Procura a variável DB_URL no ambiente, se não tiver retorna uma url local *)
let db_url =
  Sys.getenv_opt "DB_URL"
  |> Option.value ~default:"postgresql://postgres:password@localhost:5432"
