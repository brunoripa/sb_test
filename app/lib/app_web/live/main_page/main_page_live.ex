defmodule AppWeb.MainPageLive do
  use AppWeb, :live_view

  use TimingDecorator

  require OpenTelemetry.Tracer

  def mount(_params, _session, socket) do
    # OpenTelemetry.Tracer.with_span "main_page_live.mount" do
    # v = :rand.uniform_real() * 1000
    # v = 500
    # Process.sleep(trunc(v))
    # OpenTelemetry.Tracer.set_attribute("span.kind", "custom_kind")
    # OpenTelemetry.Tracer.set_status(:ok)
    # end

    first()
    |> second()
    |> third()

    {:ok, socket}
  end

  @decorate with_timing()
  def first do
  end

  @decorate with_timing()
  def second(_) do
  end

  @decorate with_timing()
  def third(_) do
  end
end
