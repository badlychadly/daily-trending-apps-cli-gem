class DailyTrending::Cli

  def call
    list_apps
    menu
  end

  def list_apps
    s = "******".colorize(:red)
    puts ""
    puts "  #{s}"+"New And Updated Apps!"+s
    puts ""
    DailyTrending::Scraper.new.scrape_index_page
    DailyTrending::App.all.each.with_index(1) do |app, i|
      puts <<-DOC
      #{i}. #{app.title.colorize(:blue)}
        #{app.rating}        Cost: #{app.price}

      DOC
    end
    puts ""
    puts "Enter the number of the app you'd like more info on, or type exit"
  end


    def app_info(app)
      DailyTrending::Scraper.new.scrape_app(app)
      puts <<-DOC
              #{app.title.upcase.colorize(:blue)}
                Developers: #{app.dev}
                  Content For: #{app.con_rating}
                      Rated By: #{app.rate_cnt}

      DOC
            puts "DESCRIPTION:".colorize(:red)
      puts <<-DOC

          #{app.description}

      Get App At: #{app.app_url.colorize(:red)}
      More Apps By #{app.dev}: #{app.dev_url.colorize(:red)}

      DOC
      # open_browser(app)

    puts "  Type 'list' to see apps again or 'exit' to leave"
      menu
  end


  def menu
    input = nil
    until input == 'exit'
      input = gets.strip.downcase
      if input.to_i > 0 && input.to_i <= DailyTrending::App.all.size
        app_info(DailyTrending::App.find(input))
      elsif input == 'list'
        list_apps
      elsif input == 'exit'
        goodbye
      else
        puts "  #{input} not an option, type list or exit" unless input == 'exit'
      end
    end
  end

  # def open_browser(app)
  #   puts "Would you like to visit this App page?? (y/n)"
  #   input = gets.strip.downcase
  #
  #   if input == 'y'
  #     app.open_in_browser
  #   else
  #     list_apps
  #   end
  # end


  def goodbye
    puts "See you next time!!"
    exit
  end
end
