class DailyTrending::App
  attr_accessor :title, :dev,:app_url, :dev_url, :rating, :price, :genre, :con_rating, :rate_cnt, :description
  @@all = []


  def exist?
    self.class.all.any?{|ap| ap.title == self.title}
  end


  def save
    @@all << self
  end

  def self.all
    @@all
  end
end
