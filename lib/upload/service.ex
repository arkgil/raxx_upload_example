defmodule Upload.Service do
  @moduledoc false

  use Raxx.Server
  use Raxx.Logger

  require Logger

  alias Raxx.Request

  # Handle request headers
  #
  # This callbacks receives a `Raxx.Request` struct which contains all the headers, path
  # info etc. `body: true` means that the request carries a body.
  #
  # In our case we're only interested in PUT requests containing the body, sent to
  # `/uploads/:id`.
  @impl true
  def handle_head(%Request{method: :PUT, body: true, path: ["uploads", id]}, _state) do
    Logger.debug("Initiating upload")
    # Empty list here means that we're not returning anything to a client yet. A map
    # is a state of the request handler.
    {[], %{}}
  end

  # Let's return 404 for all other requests.
  def handle_head(_request, _state) do
    response(:not_found)
    |> set_header("content-type", "text/plain")
    |> set_body("Not found")
  end

  # Handle chunks of data
  #
  # For now let's just log how many bytes of data we've received. Note that we can't make
  # any assumptions on the size of each chunk.
  @impl true
  def handle_data(chunk, state) do
    Logger.debug(fn -> "Received #{byte_size(chunk)} byte chunk of data" end)
    # Empty list here means that we're not returning anything to the client yet. Let's
    # return the state as is.
    {[], state}
  end

  # Handle end of request
  #
  # This callback receives request "trailers", which apparently are HTTP headers sent
  # at the end of the request. I had no idea one could do that.
  @impl true
  def handle_tail(_trailers, state) do
    Logger.debug(fn -> "Upload completed" end)
    # We're finally returning the response. We don't need to return state here anymore
    # because no callback related to current request will be ever called again.
    response(:no_content)
  end
end
