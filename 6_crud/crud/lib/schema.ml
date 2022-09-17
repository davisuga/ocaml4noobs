let create_tables =
  [%rapper
    execute
      {sql|
        CREATE TABLE IF NOT EXISTS users (
          id UUID PRIMARY KEY NOT NULL,
          name VARCHAR,
          email VARCHAR,
          username VARCHAR
        );
      |sql}]
    ()
