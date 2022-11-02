defmodule PLRCTest do
  use ExUnit.Case
  doctest PLRC

  test "greets the world" do
    assert PLRC.hello() == :world
  end
end
