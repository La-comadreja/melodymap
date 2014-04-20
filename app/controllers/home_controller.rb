class HomeController < ApplicationController
  def index
    @NUM_DAYS = 7
    @time = Time.now
    @days = []
    @search_days = []
    for i in 0...@NUM_DAYS
      @days.append(@time.strftime("%A, %B %d"))
      @search_days.append(@time.strftime("%Y-%m-%d"))
      @time += 86400 
    end

    d = params[:days]
    d ||= 0
    doc_string = Nokogiri::HTML(open(URI.escape("http://www.villagevoice.com/concerts/#/date:" + @search_days[d.to_i] + "/")))
  end
end
