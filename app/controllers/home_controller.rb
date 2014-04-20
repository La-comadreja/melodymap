class HomeController < ApplicationController
  def index
    @time = Time.now
    @days = []
    @search_days = []
    for i in 0...7
      @days.append(@time.strftime("%A, %B %d"))
      @search_days.append(@time.strftime("%Y-%m-%d"))
      @time += 86400 
    end

    
  end
end
