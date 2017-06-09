class DashboardController < ApplicationController
  def index
    render json: {message: "Hellow"}
  end
end
