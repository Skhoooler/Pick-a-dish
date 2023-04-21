defmodule PadServerTest do
  use ExUnit.Case
  doctest PadServer

  test "greets the world" do
    assert PadServer.hello() == :world
  end
end
