defmodule CaptchaWeb.CaptchaController do
  use CaptchaWeb, :controller

  def index(conn, %{"captcha" => captcha}) do
    try do
      answer = SolveCaptcha.calculate_captcha(captcha)

      conn
      |> assign(:answer, answer)
      |> assign(:captcha, captcha)
      |> render("index.html")
    rescue
      ArgumentError -> conn |> assign(:error_message, "Please enter a series of numbers only") |> render("index.html")
    end
  end

  def index(conn, _params) do
    render(conn, "index.html")
  end

end
