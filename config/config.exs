use Mix.Config

config :upload,
  port: 8080,
  uploads_dir: "uploads",
  download_chunk_size: 5000

config :logger, :console, metadata: [:module, :function, :pid]
