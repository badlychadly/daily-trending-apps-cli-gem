class DailyTrending::Vid
  attr_accessor :title, :developer,:app_url, :dev_url, :rating, :price

  def self.today
    self.scrape_apps
  end


  def self.scrape_apps
    apps = []
    #extract properties from each video
    #instaniate a video
    #make method for individual website
    apps << self.scrape_play_store
    #possibly scrape other websites
    apps
  end


  def self.scrape_play_store
    doc = Nokogiri::HTML(open("https://play.google.com/store/apps/collection/promotion_3000792_new_releases_apps?clp=SpEBCikKI3Byb21vdGlvbl8zMDAwNzkyX25ld19yZWxlYXNlc19hcHBzEAcYAxpkCl5uZXdfaG9tZV9kZXZpY2VfZmVhdHVyZWRfcmVjczJfdG9waWNfdjFfbGF1bmNoX2FwcHNfVVNfXzE1MTM5Mjk2MDAwMDBfNl9wcm9tb18xNTEzOTY1NjY2OTA1MDAwEAwYAw%3D%3D%3AS%3AANO1ljKilBo&hl=en"))
  #   app_info = {}
  #
  #   doc.css('div.card-content.id-track-click.id-track-impression').each do |app|
  #     app = self.new
  #     app.title = app.css('a.title').attribute('title').value
  #   end
  #   app
  # end

end
