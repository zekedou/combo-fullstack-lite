defmodule MyApp.Telemetry do
  @moduledoc false

  use Supervisor

  @spec start_link(term()) :: Supervisor.on_start()
  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  @impl Supervisor
  def init(_arg) do
    children = [
      # Uncomment following lines when you need telemetry.
      # Check https://hexdocs.pm/needle_telemetry for more information.
      # {NeedleTelemetry.Reporter, config()},
      # {NeedleTelemetry.Poller, config()}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end

  @spec metrics :: [Telemetry.Metrics.t()]
  def metrics do
    NeedleTelemetry.load_metrics(config())
  end

  defp config do
    [
      meta: [],
      specs: [
        MyApp.Telemetry.VM,
        MyApp.Telemetry.Combo,
        MyApp.Telemetry.EctoRepo
      ],
      reporter: {:console, []},
      poller: [period: 10_000]
    ]
  end
end
