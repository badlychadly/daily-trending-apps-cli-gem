class DailyTrending::App
  attr_accessor :title, :dev,:app_url, :dev_url, :rating, :price, :genre, :con_rating, :rate_cnt, :description
  @@all = []


  def self.new_from_index(a)
      app = self.new
      app.title = a.css('a.title').attribute('title').value
      app.dev = a.css('a.subtitle').attribute('title').value
      app.dev_url = ("https://play.google.com" + a.css('a.subtitle').attribute('href').value)
      app.app_url = ("https://play.google.com" + a.css('a.title').attribute('href').value)
      app.rating = a.css('div.tiny-star').attribute('aria-label').value.strip.slice(/\d.\S/)<<"/5 Stars"
      app.price = a.at_css('span.display-price').text
      app.exist? ? all.freeze : app.save
  end


  def exist?
    self.class.all.any?{|ap| ap.title == self.title}
  end


  def save
    @@all << self
  end

  def self.all
    @@all
  end


  def make_app(xml_info)
    page = xml_info
    self.genre = page.css('a.document-subtitle.category').text
    self.description = page.css('div.show-more-content.text-body').text
    self.con_rating = page.css('span.document-subtitle.content-rating-title').text
    self.rate_cnt = page.css('span.rating-count').text
  end
end
