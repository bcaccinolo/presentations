defmodule ProcessRing do

  def call(dest) do
    receive do
      value -> send(dest, value + 1)
    end
  end

  def run(n) do
    last = Enum.reduce(1..n, self(), fn(_, acc) ->
      spawn(__MODULE__, :call, [acc])
    end)

    # Initiating the round
    send(last, 1)

    # Waiting for the last message
    receive do
      msg -> IO.puts("Receiving in the end #{msg}")
    end

  end

end


# c "process_ring.ex"
# ProcessRing.run(3)
# :timer.tc ProcessRing, :run, [9000]
# Time is in micro seconds µs (10e-6 seconds)

