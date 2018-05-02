use Mix.Config

config :upload,
  port: 8080,
  uploads_dir: "uploads"

config :logger, :console, metadata: [:module, :function, :pid]
