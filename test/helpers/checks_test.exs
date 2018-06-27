defmodule ChecksTest do
  use ExUnit.Case

  test "empty string is non numeric" do
    assert Checks.is_numeric_string("") == false
  end

  test "non string returns false" do
    assert Checks.is_numeric_string(1) == false
    assert Checks.is_numeric_string([]) == false
  end

  test "strings containing only numbers return true" do
    assert Checks.is_numeric_string("1123") == true
    assert Checks.is_numeric_string("1") == true
  end

  test "strings containing some letters return false" do
    assert Checks.is_numeric_string("11a23") == false
    assert Checks.is_numeric_string("a") == false
  end

end
