class DailyTrending::Scraper


  def initialize
    @base_link = "https://play.google.com"
  end
  # Why was instance variable @base_link not available in #scrape_app before I made #initialize??
  # Didn't work in #scrape_app when I assigned it in #scrape_index_page

  def scrape_index_page
    index_page = Nokogiri::HTML(open("#{@base_link}/store/apps/collection/promotion_3000792_new_releases_apps?clp=SpEBCikKI3Byb21vdGlvbl8zMDAwNzkyX25ld19yZWxlYXNlc19hcHBzEAcYAxpkCl5uZXdfaG9tZV9kZXZpY2VfZmVhdHVyZWRfcmVjczJfdG9waWNfdjFfbGF1bmNoX2FwcHNfVVNfXzE1MTQ0NDgwMDAwMDBfNl9wcm9tb18xNTE0NDkxNzcwMTgwMDAwEAwYAw%3D%3D%3AS%3AANO1ljLrBj0&hl=en"))
    index_page.css('div.card-content.id-track-click.id-track-impression').each do |a|
      app = DailyTrending::App.new
      app.title = a.css('a.title').attribute('title').value
      app.app_url = (@base_link + a.css('a.title').attribute('href').value)
      app.rating = a.css('div.tiny-star').attribute('aria-label').value.strip.slice(/\d.\S/)<<"/5 Stars"
      app.price = a.at_css('span.display-price').text
      app.exist? ? DailyTrending::App.all.freeze : app.save
    end
  end


  def scrape_app(app)
    page = Nokogiri::HTML(open(app.app_url))
    app.dev = page.css('a.document-subtitle.primary').text.strip
    app.dev_url = (@base_link + page.css('a.document-subtitle.primary').attribute('href').value)
    app.genre = page.css('a.document-subtitle.category').text.strip
    app.description = page.css('div.show-more-content.text-body').text
    app.con_rating = page.css('span.document-subtitle.content-rating-title').text
    app.rate_cnt = page.css('span.rating-count').text
    app
  end


end
