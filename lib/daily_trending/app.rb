class DailyTrending::App
  attr_accessor :title, :dev,:app_url, :dev_url, :rating, :price, :genre, :con_rating, :rate_cnt, :description
  @@all = []


  def self.scrape_play_store
    doc = Nokogiri::HTML(open("https://play.google.com/store/apps/collection/promotion_3000792_new_releases_apps?clp=SpEBCikKI3Byb21vdGlvbl8zMDAwNzkyX25ld19yZWxlYXNlc19hcHBzEAcYAxpkCl5uZXdfaG9tZV9kZXZpY2VfZmVhdHVyZWRfcmVjczJfdG9waWNfdjFfbGF1bmNoX2FwcHNfVVNfXzE1MTQ0NDgwMDAwMDBfNl9wcm9tb18xNTE0NDkxNzcwMTgwMDAwEAwYAw%3D%3D%3AS%3AANO1ljLrBj0&hl=en"))
    doc.css('div.card-content.id-track-click.id-track-impression')
  end


    # Iterates  #scrape_play_store method to # Makes the apps and assigns
    #  the attributes available on Google play store

  def self.make_apps
    scrape_play_store.each do |a|
      app = self.new
      app.title = a.css('a.title').attribute('title').value
      app.dev = a.css('a.subtitle').attribute('title').value
      app.dev_url = ("https://play.google.com" + a.css('a.subtitle').attribute('href').value)
      app.app_url = ("https://play.google.com" + a.css('a.title').attribute('href').value)
      app.rating = a.css('div.tiny-star').attribute('aria-label').value.strip.slice(/\d.\S/)<<"/5 Stars"
      app.price = a.at_css('span.display-price').text
      app.save
    end
    all
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end


  def scrape_app(url)
    Nokogiri::HTML(open(url))
  end


  def make_app(url)
    page = scrape_app(url)
    self.genre = page.css('a.document-subtitle.category').text
    self.con_rating = page.css('span.document-subtitle.content-rating-title').text
    self.rate_cnt = page.css('span.rating-count').text
    self.description = page.css('div.show-more-content.text-body').text
  end
end
