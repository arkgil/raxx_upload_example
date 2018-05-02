defmodule Upload.Router do
  @moduledoc false

  use Raxx.Server

  use Raxx.Router, [
    {%{method: :PUT, path: ["uploads", name]}, Upload.UploadService},
    {_, Upload.NotFound}
  ]
end
