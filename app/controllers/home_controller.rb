class HomeController < ApplicationController
  def index
    @time = Time.now
    @days = []
    for i in 0...7
      @days.append(@time.strftime("%A, %B %d"))
      @time += 86400 
    end
  end
end
