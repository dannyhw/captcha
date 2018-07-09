defmodule SolveCaptchaTest do
  use ExUnit.Case

  test "non list returns error" do
    assert_raise ArgumentError, "invalid arugment type, should be a string of numbers or a list of numbers", fn ->
      SolveCaptcha.calculate_captcha(1)
    end

    assert_raise ArgumentError, "invalid arugment type, should be a string of numbers or a list of numbers", fn ->
      SolveCaptcha.calculate_captcha(:atom)
    end
  end

  test "empty list returns 0" do
    assert SolveCaptcha.calculate_captcha([]) == 0
  end

  test "list with one number returns 0" do
    assert SolveCaptcha.calculate_captcha([1]) == 0
    assert SolveCaptcha.calculate_captcha([2]) == 0
  end

  test "list with two equal numbers returns that number" do
    assert SolveCaptcha.calculate_captcha([1, 1]) == 1
    assert SolveCaptcha.calculate_captcha([2, 2]) == 2
  end

  test "list with two non equal numbers returns 0" do
    assert SolveCaptcha.calculate_captcha([1, 2]) == 0
    assert SolveCaptcha.calculate_captcha([3, 4]) == 0
  end

  test "returns 0 if no digits match the next" do
    assert SolveCaptcha.calculate_captcha([1, 2, 3, 4]) == 0
    assert SolveCaptcha.calculate_captcha([1, 2, 1, 2]) == 0
  end

  test "one digit matches the next return that digit" do
    assert SolveCaptcha.calculate_captcha([1, 1, 2, 3]) == 1
    assert SolveCaptcha.calculate_captcha([1, 2, 3, 4, 5, 6, 7, 8, 8]) == 8
    assert SolveCaptcha.calculate_captcha([1, 2, 3, 4, 5, 5, 7, 8, 9, 0]) == 5
  end

  test "multiple digit matching the next return the sum of the digits that matched" do
    assert SolveCaptcha.calculate_captcha([1, 1, 2, 2]) == 3
    assert SolveCaptcha.calculate_captcha([1, 1, 3, 3, 5, 6, 7, 8, 8]) == 12
  end

  test "last digit can match first digit" do
    assert SolveCaptcha.calculate_captcha([1, 2, 3, 1]) == 1
    assert SolveCaptcha.calculate_captcha([1, 2, 3, 4, 5, 5, 7, 8, 9, 1]) == 6
    assert SolveCaptcha.calculate_captcha([9, 1, 2, 1, 2, 1, 2, 9]) == 9
    assert SolveCaptcha.calculate_captcha([1, 1, 1, 1]) == 4
  end

  @tag :current
  test "works for strings where each character is a number" do
    assert SolveCaptcha.calculate_captcha("1231") == 1
  end

  @tag :current
  test "non numeric strings fail" do
    assert_raise ArgumentError, "invalid arugment type, should be a string of numbers or a list of numbers", fn ->
      SolveCaptcha.calculate_captcha("somestring")
    end
    assert_raise ArgumentError, "invalid arugment type, should be a string of numbers or a list of numbers", fn ->
      SolveCaptcha.calculate_captcha(["a","b","c"])
    end
    assert_raise ArgumentError, "invalid arugment type, should be a string of numbers or a list of numbers", fn ->
      SolveCaptcha.calculate_captcha(["a","a"])
    end
    assert_raise ArgumentError, "invalid arugment type, should be a string of numbers or a list of numbers", fn ->
      SolveCaptcha.calculate_captcha(["a"])
    end
    assert_raise ArgumentError, "invalid arugment type, should be a string of numbers or a list of numbers", fn ->
      SolveCaptcha.calculate_captcha("a")
    end
  end

end
