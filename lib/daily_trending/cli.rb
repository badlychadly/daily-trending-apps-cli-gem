class DailyTrending::Cli

  def call
    list_apps
    menu
    goodbye
  end

  def list_apps
    s = "******".colorize(:red)
    puts ""
    puts "  #{s}"+"New And Updated Apps!"+s
    puts ""
    DailyTrending::Scraper.new.scrape_play_store
    DailyTrending::App.all.each.with_index(1) do |app, i|
      puts <<-DOC
      #{i}. #{app.title.colorize(:blue)}
        #{app.rating}        Cost: #{app.price}

      DOC
    end
    puts ""
  end

    def menu
      input = nil
      until input == 'exit'
        puts "Enter the number of the app you'd like more info on, or type exit"
        input = gets.strip.downcase

        if input.to_i > 0 && input.to_i <= DailyTrending::App.all.size
          app_info(DailyTrending::App.all[input.to_i-1])
        elsif input == 'list'
          list_apps
        else
          puts "#{input} not an option, type list or exit" unless input == 'exit'
        end
      end
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
    input = nil
    puts "  Type 'list' to see apps again or 'exit' to leave"
    until input == 'list'|| input == 'exit'
      input = gets.strip.downcase
      if input == 'list'
        list_apps
      elsif input == 'exit'
        goodbye
      else
        puts "  #{input} not an option, type list or exit" unless input == 'exit'
      end
    end
  end


  def goodbye
    puts "See you next time!!"
    exit
  end
end
