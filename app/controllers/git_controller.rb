class GitController < ApplicationController
  def event
    push = JSON.parse(request.body.read)
    puts "I got some JSON: #{push.inspect}"
    sender = push["sender"]
    sender_name = sender["login"]
    render json: {message: "#{sender_name} just comment"}
  end
end
