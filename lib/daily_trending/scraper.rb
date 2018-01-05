class DailyTrending::Scraper

  def scrape_play_store
    doc = Nokogiri::HTML(open("https://play.google.com/store/apps/collection/promotion_3000792_new_releases_apps?clp=SpEBCikKI3Byb21vdGlvbl8zMDAwNzkyX25ld19yZWxlYXNlc19hcHBzEAcYAxpkCl5uZXdfaG9tZV9kZXZpY2VfZmVhdHVyZWRfcmVjczJfdG9waWNfdjFfbGF1bmNoX2FwcHNfVVNfXzE1MTQ0NDgwMDAwMDBfNl9wcm9tb18xNTE0NDkxNzcwMTgwMDAwEAwYAw%3D%3D%3AS%3AANO1ljLrBj0&hl=en"))
    doc.css('div.card-content.id-track-click.id-track-impression')
  end

  def make_apps
    scrape_play_store.each do |a|
      DailyTrending::App.new_from_index(a)
    end
    DailyTrending::App.all
  end

  def scrape_app(app_url)
    Nokogiri::HTML(open(app_url))
  end

end
