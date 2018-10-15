defmodule SpawnBasic2 do
  def greet do
    IO.puts("Hello!")

    listen()
  end

  def listen do
    receive do
      msg -> IO.puts("Received the message #{inspect(msg)}")
    end
    listen()
  end
end
