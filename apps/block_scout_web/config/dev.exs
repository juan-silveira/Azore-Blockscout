import Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with webpack to recompile .js and .css sources.

config :block_scout_web, BlockScoutWeb.Endpoint,
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    node: [
      "node_modules/webpack/bin/webpack.js",
      "--mode",
      "development",
      "--watch",
      cd: Path.expand("../assets", __DIR__)
    ]
  ]

# ## SSL Support
#
# In order to use HTTPS in development, a self-signed
# certificate can be generated by running the following
# command from your terminal:
#
#     openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com" -keyout priv/server.key -out priv/server.pem
#
# The `http:` config above can be replaced with:
#
#     https: [port: 4000, keyfile: "priv/server.key", certfile: "priv/server.pem"],
#
# If desired, both `http:` and `https:` keys can be
# configured to run both http and https servers on
# different ports.

# Watch static and templates for browser reloading.
config :block_scout_web, BlockScoutWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{lib/block_scout_web/views/.*(ex)$},
      ~r{lib/block_scout_web/templates/.*(eex)$}
    ]
  ]

config :block_scout_web, BlockScoutWeb.Tracer, env: "dev", disabled?: true

config :logger, :block_scout_web,
  level: :debug,
  path: Path.absname("logs/dev/block_scout_web.log")

config :logger, :api,
  level: :debug,
  path: Path.absname("logs/dev/api.log"),
  metadata_filter: [application: :api]

config :logger, :api_v2,
  level: :debug,
  path: Path.absname("logs/dev/api_v2.log"),
  metadata_filter: [application: :api_v2]

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.

config :phoenix, :stacktrace_depth, 20

 config :block_scout_web, BlockScoutWeb.Endpoint,
    http: [port: 4000],
    https: [
      port: 4001,
      cipher_suite: :strong,
      certfile: "priv/cert/selfsigned.pem",
      keyfile: "priv/cert/selfsigned_key.pem"
  ]
