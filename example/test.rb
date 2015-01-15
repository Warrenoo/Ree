# coding: utf-8
require "ree"

erb = <<-ERB
  <html>
    <head>
      <title>测试</title>
    </head>
    <body style='background-color: red'>
      <h1 style='text-align: center'>TITLE</h1>
    </body>
  </html>
ERB

get "/" do
  render "OK"
end

get "/show" do
  render "SHOW"
end

get "/erb" do
  render erb
end

get "/test" do
  render template: File.expand_path("../test.html", __FILE__)
end

get "/json" do
  json = { a: 1, b: 2, c: 3, d: 4}
  render json: json
end

app = Rack::Builder.new { run Ree::Application }
Rack::Server.start(app: app.to_app, server: "thin")
