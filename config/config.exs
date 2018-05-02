use Mix.Config

config :upload, port: 8080

config :logger, :console, metadata: [:module, :function, :pid]
