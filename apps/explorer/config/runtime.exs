import Config

config :explorer, Explorer.Repo,
  username: System.get_env("PGUSER") || "postgres",
  password: System.get_env("PGPASSWORD") || "postgres",
  database: System.get_env("PGDATABASE") || "blockscout",
  hostname: System.get_env("PGHOST") || "localhost",
  port: String.to_integer(System.get_env("PGPORT") || "5432"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  ssl: false,
  show_sensitive_data_on_connection_error: true
