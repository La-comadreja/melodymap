class HomeController < ApplicationController
  def index
    @time = Time.now
    @days = []
    for i in 0...7
      @day = @time.strftime("%A, %B %d")
      @days.append(@day)
      @time += 86400 
    end
  end
end
