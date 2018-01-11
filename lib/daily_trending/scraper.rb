class DailyTrending::Scraper


  def scrape_play_store
    @doc = "https://play.google.com"
    mp = Nokogiri::HTML(open("#{@doc}/store/apps/collection/promotion_3000792_new_releases_apps?clp=SpEBCikKI3Byb21vdGlvbl8zMDAwNzkyX25ld19yZWxlYXNlc19hcHBzEAcYAxpkCl5uZXdfaG9tZV9kZXZpY2VfZmVhdHVyZWRfcmVjczJfdG9waWNfdjFfbGF1bmNoX2FwcHNfVVNfXzE1MTQ0NDgwMDAwMDBfNl9wcm9tb18xNTE0NDkxNzcwMTgwMDAwEAwYAw%3D%3D%3AS%3AANO1ljLrBj0&hl=en"))
    mp.css('div.card-content.id-track-click.id-track-impression').each do |a|
      app = DailyTrending::App.new
      app.title = a.css('a.title').attribute('title').value
      app.dev_url = (@doc + a.css('a.subtitle').attribute('href').value)
      app.app_url = (@doc + a.css('a.title').attribute('href').value)
      app.rating = a.css('div.tiny-star').attribute('aria-label').value.strip.slice(/\d.\S/)<<"/5 Stars"
      app.price = a.at_css('span.display-price').text
      app.exist? ? DailyTrending::App.all.freeze : app.save
    end
  end


  def scrape_app(app)
    page = Nokogiri::HTML(open(app.app_url))
    binding.pry
    app.dev = page.css('a.document-subtitle.primary').text.strip
    app.genre = page.css('a.document-subtitle.category').text.strip
    app.description = page.css('div.show-more-content.text-body').text
    app.con_rating = page.css('span.document-subtitle.content-rating-title').text
    app.rate_cnt = page.css('span.rating-count').text
    app
  end


end
