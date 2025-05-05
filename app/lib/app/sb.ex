defmodule App.Sb do
  def setup do
    :telemetry.attach_many(
      {__MODULE__, :live_view},
      [
        [:sb, :event, :start],
        [:sb, :event, :stop]
      ],
      &__MODULE__.handle_sb_event/4,
      %{}
    )

    :ok
  end

  def handle_sb_event(
        [:sb, :event, :start],
        %{start: _timestamp} = measurements,
        %{event: event, module: module} = meta,
        _handler_configuration
      ) do
    OpentelemetryTelemetry.start_telemetry_span(
      __MODULE__,
      "some_span_name",
      meta,
      %{}
    )

    :ok
  end

  def handle_sb_event(
        [:sb, :event, :stop],
        %{stop: _timestamp} = measurements,
        %{event: event, module: module} = meta,
        _handler_configuration
      ) do
    OpentelemetryTelemetry.end_telemetry_span(__MODULE__, meta) |> IO.inspect()
    :ok
  end
end
