defmodule TimingDecorator do
  use Decorator.Define, with_timing: 0

  def with_timing(body, context) do
    quote do
      require Logger
      start = System.monotonic_time()
      unquote(body)
      stop = System.monotonic_time()
      duration = stop - start

      Logger.info("Function #{unquote(context.name)} took #{duration} ns")
    end
  end
end
