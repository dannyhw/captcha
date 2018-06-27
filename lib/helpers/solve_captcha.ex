defmodule SolveCaptcha do
  def solve([x | [x]]) do
    x
  end

  def solve([_x | [_y]]) do
    0
  end

  def solve([h1, h2 | t]) do
    solve([h1, h2]) + solve([h2] ++ t)
  end

  def calculate_captcha(x) when not is_list(x) do
    if is_binary(x) and Checks.is_numeric_string(x) do
      numberList =
        Enum.map(String.codepoints(x), fn char ->
          {num, _} = Integer.parse(char)
          num
        end)

      calculate_captcha(numberList)
    else
      raise ArgumentError,
        message: "invalid arugment type, should be a string of numbers or a list of numbers"
    end
  end

  def calculate_captcha([]) do
    0
  end

  def calculate_captcha([h | []]) when is_number(h) do
    0
  end

  def calculate_captcha([x | [x]]) do
    if is_number(x) do
      x
    else
      {num, _} = Integer.parse(x)
      num
    end
  end

  def calculate_captcha(list) do
    if Enum.all?(list, fn n -> is_integer(n) end) do
      [h | _t] = list
      solve(list ++ [h])
    else
      raise ArgumentError,
        message: "invalid arugment type, should be a string of numbers or a list of numbers"
    end
  end
end
