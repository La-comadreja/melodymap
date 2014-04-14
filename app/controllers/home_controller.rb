class HomeController < ApplicationController
  def index
    @time = Time.now
    @days = []
    @searchDays = []
    for i in 0...7
      @days.append(@time.strftime("%A, %B %d"))
      @searchDays.append(@time.strftime("%Y-%m-%d"))
      @time += 86400 
    end
  end
end
