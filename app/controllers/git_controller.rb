class GitController < ApplicationController
  def event
    push = JSON.parse(request.body.read)
    puts "I got some JSON: #{push.inspect}"
    render json: {message: push}
  end
end
