defmodule MyApp.Telemetry.Combo do
  @moduledoc false

  use NeedleTelemetry.Spec

  @impl true
  def metrics(_meta) do
    [
      summary("combo.endpoint.start.system_time",
        unit: {:native, :millisecond}
      ),
      summary("combo.endpoint.stop.duration",
        unit: {:native, :millisecond}
      ),
      summary("combo.router_dispatch.start.system_time",
        tags: [:route],
        unit: {:native, :millisecond}
      ),
      summary("combo.router_dispatch.exception.duration",
        tags: [:route],
        unit: {:native, :millisecond}
      ),
      summary("combo.router_dispatch.stop.duration",
        tags: [:route],
        unit: {:native, :millisecond}
      ),
      summary("combo.socket_connected.duration",
        unit: {:native, :millisecond}
      ),
      sum("combo.socket_drain.count"),
      summary("combo.channel_joined.duration",
        unit: {:native, :millisecond}
      ),
      summary("combo.channel_handled_in.duration",
        tags: [:event],
        unit: {:native, :millisecond}
      )
    ]
  end
end
