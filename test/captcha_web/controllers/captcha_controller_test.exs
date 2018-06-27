defmodule CaptchaWeb.CaptchaControllerTest do
  use CaptchaWeb.ConnCase
  use Hound.Helpers

  hound_session()

  test "home page loads successfully", %{conn: conn} do
    response = get(conn, "/")
    assert response.status == 200
    assert html_response(response, 200) =~ "Captcha challenge"
  end

  test "simple captcha displays the correct answer", %{conn: conn} do
    response = get(conn, "/?captcha=11")
    assert response.status == 200
    assert html_response(response, 200) =~ "the answer to captcha 11 is 1"

    response = get(conn, "/?captcha=1122")
    assert response.status == 200
    assert html_response(response, 200) =~ "the answer to captcha 1122 is 3"
  end

  test "non number cause error message to display", %{conn: conn} do
    response = get(conn, "/?captcha=a1sd")
    assert response.status == 200
    assert html_response(response, 200) =~ "Error: Please enter a series of numbers only"
  end

  test "there is a text input field and input can be entered" do
    navigate_to("/")
    form = find_element(:tag, "form")
    input_field = find_within_element(form, :name, "captcha")

    fill_field(input_field, "test")
    assert attribute_value(input_field, "value") == "test"
  end

  test "I can submit input and answer is displayed" do
    navigate_to("/")
    form = find_element(:tag, "form")
    input_field = find_within_element(form, :name, "captcha")

    fill_field(input_field, "1111")
    assert attribute_value(input_field, "value") == "1111"
    submit_element(form)

    answer = find_element(:id, "answer")
    assert inner_text(answer) == "the answer to captcha 1111 is 4"
  end

  test "when I submit a non number I get an error message" do
    navigate_to("/")
    form = find_element(:tag, "form")
    input_field = find_within_element(form, :name, "captcha")

    fill_field(input_field, "11a1")
    assert attribute_value(input_field, "value") == "11a1"
    submit_element(form)

    answer = find_element(:id, "error")
    assert inner_text(answer) == "Error: Please enter a series of numbers only"
  end
end
