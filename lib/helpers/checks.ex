defmodule Checks do
  def is_numeric_string(x) when not is_binary(x) do
    false
  end

  def is_numeric_string(str) do
    case Float.parse(str) do
      {_num, ""} -> true
      _ -> false
    end
  end
end
