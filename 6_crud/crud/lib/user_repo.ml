module Queries = struct
  open User

  let read_all =
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
end

let list_users () = Db.dispatch Queries.read_all
let create user = Db.dispatch (Queries.create_one user)
