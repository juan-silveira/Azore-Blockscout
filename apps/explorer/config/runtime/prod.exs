# config/runtime/prod.exs
import Config

config :explorer, Explorer.Repo,
  url: System.fetch_env!("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")

config :ethereum_jsonrpc,
  http_url: System.fetch_env!("ETHEREUM_JSONRPC_HTTP_URL")

# Optional: silence Tesla warning
config :tesla, disable_deprecated_builder_warning: true
