let start () =
  Dream.run
  (* Adiciona o middleware de logs *)
  @@ Dream.logger
  (* ...e o de rotas *)
  @@ Dream.router [ Dream.get "/" (fun _ -> Dream.html "Hello, world!") ]
