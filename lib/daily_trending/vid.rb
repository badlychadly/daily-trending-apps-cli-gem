class DailyTrending::Vid
  attr_accessor :title, :dev,:app_url, :dev_url, :rating, :price

  def self.today
    self.scrape_play_store
  end



  def self.scrape_play_store
    doc = Nokogiri::HTML(open("https://play.google.com/store/apps/collection/promotion_3000792_new_releases_apps?clp=SpEBCikKI3Byb21vdGlvbl8zMDAwNzkyX25ld19yZWxlYXNlc19hcHBzEAcYAxpkCl5uZXdfaG9tZV9kZXZpY2VfZmVhdHVyZWRfcmVjczJfdG9waWNfdjFfbGF1bmNoX2FwcHNfVVNfXzE1MTM5Mjk2MDAwMDBfNl9wcm9tb18xNTEzOTY1NjY2OTA1MDAwEAwYAw%3D%3D%3AS%3AANO1ljKilBo&hl=en"))
    apps = []

    doc.css('div.card-content.id-track-click.id-track-impression').each do |a|
      app = self.new
      app.title = a.css('a.title').attribute('title').value
      app.dev = a.css('a.subtitle').attribute('title').value
      app.dev_url = ("https://play.google.com" + a.css('a.subtitle').attribute('href').value)
      app.app_url = ("https://play.google.com" + a.css('a.title').attribute('href').value)
      app.rating = a.css('div.tiny-star').attribute('aria-label').value.strip.slice(0,9)
      app.price = a.at_css('span.display-price').text
      apps << app
    end
    apps
  end

  def self.scrape_app_page
    page = Nokogiri::HTML(open('https://play.google.com/store/apps/details?id=homeworkout.homeworkouts.noequipment&hl=en'))
    binding.pry
    puts <<-DOC
    con_rating: Everyone
    genre: Health and Fitness
    rate_cnt: 75,000
    description: "Home Workouts provides daily workout routines"

    want them to choose the number of the app they want more info on
    info only is seen when the select that app
    DOC

  end


end
