class DailyTrending::App
  attr_accessor :title, :dev,:app_url, :dev_url, :rating, :price, :genre, :con_rating, :rate_cnt, :description
  @@all = []


  def self.all
    @@all
  end


  def self.find(input)
    @@all[input.to_i-1]
  end


  def exist?
    self.class.all.any?{|ap| ap.title == self.title}
  end


  def save
    @@all << self
  end

  # def open_in_browser
  #   binding.pry
  #   system("start '#{app_url}'")
  # end
end
