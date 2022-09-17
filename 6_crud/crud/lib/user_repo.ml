module Queries = struct
  let read_all =
    let open User in
    [%rapper
      get_many
        {sql|
          SELECT @string{id}, @string{name}, @string{username}, @string{email}
          FROM messages
        |sql}
        record_out]
      ()

  type user_create_input = { name : string; email : string; username : string }

  let create_one =
    [%rapper
      execute
        {sql|
          INSERT INTO users
          VALUES(%string{name}, %string{username}, %string{email})
        |sql}
        record_in]

  let update =
    [%rapper
      execute
        {sql|
          UPDATE users
          SET (username, email, name) = (%string?{username}, %string?{email}, %string?{name})
          WHERE id = %int{id}
          |sql}]

  let delete =
    [%rapper
      execute
        {sql|
            Delete from users
            WHERE id = %int{id}
            |sql}]
end

let create user = Db.dispatch (Queries.create_one user)
let read_all () = Db.dispatch Queries.read_all

let update ?username ?email ?name id =
  Db.dispatch (Queries.update ~username ~name ~email ~id)

let delete id = Db.dispatch (Queries.delete ~id)
