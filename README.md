# Captcha

## Details

Everything is on the home page. Enter a number in the input and the answer will be displayed below once you hit submit.

http://localhost:4000/ 

algorithm is in lib/helpers/solve_captcha.ex

## testing
Due to the acceptance testing the tests requires phantomjs installed and it must be running.

to install phantomjs:
`http://phantomjs.org/download.html`

to start phantomjs use the following:
`phantomjs --wd`

then just run `mix test` as normal

## stuff that came with the pheonix setup
To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.create && mix ecto.migrate`
- Install Node.js dependencies with `cd assets && npm install`
- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

- Official website: http://www.phoenixframework.org/
- Guides: http://phoenixframework.org/docs/overview
- Docs: https://hexdocs.pm/phoenix
- Mailing list: http://groups.google.com/group/phoenix-talk
- Source: https://github.com/phoenixframework/phoenix
