# coding: utf-8
require './main.rb'


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
  Ree::Response.build [200, {"Content-Type" => "text/html"}, ["OK"]]
end

get "/show" do
  Ree::Response.build [200, {"Content-Type" => "text/html"}, ["SHOW"]]
end

get "/erb" do
  Ree::Response.build [200, {"Content-Type" => "text/html"}, [erb]]
end

app = Rack::Builder.new { run Ree::Application }
Rack::Server.start(app: app.to_app, server: "thin")
