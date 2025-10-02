defmodule MyApp.Telemetry.VM do
  @moduledoc false

  use NeedleTelemetry.Spec

  @impl true
  def metrics(_meta) do
    [
      summary("vm.memory.total", unit: {:byte, :kilobyte}),
      summary("vm.total_run_queue_lengths.total"),
      summary("vm.total_run_queue_lengths.cpu"),
      summary("vm.total_run_queue_lengths.io")
    ]
  end
end
