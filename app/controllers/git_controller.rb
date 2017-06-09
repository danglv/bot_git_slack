class GitController < ApplicationController
  def event
    render json: {message: params}
  end
end
