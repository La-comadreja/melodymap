class HomeController < ApplicationController
  def index
    @NUM_DAYS = 7
    @time = Time.now
    @days = []
    @search_days = []
    for i in 0...@NUM_DAYS
      @days.append(@time.strftime("%A, %B %d"))
      @search_days.append(@time.strftime("%d+%b+%Y"))
      @time += 86400 
    end

    # pages directory scrapes from http://www.mysocialist.com/concerts
    doc_string = Nokogiri::HTML(open("pages/mysocialist.txt"))
    @sections = doc_string.css(".listingRow")
    @date = 0
    if !params[:date].nil?
      @date = params[:date].to_i
    end

    @events = []
    @links = []
    @addresses = []
    @sections.each do |s|
      t = s.to_s.encode!('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
      if t.include?("+on+" + @search_days[@date])
        @events.append(t)
        l = "http://www.mysocialist.com" + s.css("a")[0].to_s.encode!('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '').split("\"")[1]
        @links.append(l)

        doc_string = Nokogiri::HTML(open(l))
        s = doc_string.css(".event-venue-data")[0].to_s.encode!('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
        address = extr(s, "streetAddress") + ", " + extr(s, "addressLocality") + ", " + extr(s, "addressRegion") + " " + extr(s, "postalCode")
        @addresses.append(address)
      end
    end
  end

  def extr(s, str)
    s.split("itemprop=\"" + str + "\">")[1].split("</span>")[0]
  end
end
