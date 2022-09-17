
let () =
  Dream.run
  @@ Dream.logger
  @@ Dream.router [
    Dream.get "/users" (fun _ ->
      Dream.html ("world"));
  ]