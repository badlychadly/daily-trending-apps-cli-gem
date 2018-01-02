class DailyTrending::Cli

  def call
    list_apps
    menu
    goodbye
  end

  def list_apps
    s = "******".colorize(:blue)
    puts ""
    puts "  #{s}"+"New And Updated Apps!"+s
    puts ""

    @apps = DailyTrending::App.today
    @apps.each.with_index(1) do |app, i|
      puts <<-DOC
      #{i} #{app.title.colorize(:blue)}
        #{app.rating}        Cost: #{app.price}

      DOC
    end
    puts ""
  end

    def menu
      input = nil
      until input == 'exit'
        puts "Enter the number of the app that interests you or type exit"
        input = gets.strip.downcase

        if input.to_i > 0
          app_info(@apps[input.to_i-1])
        elsif input == 'list'
          list_apps
        else
          puts "#{input} not an option, type list or exit" unless input == 'exit'
        end
      end
    end

    def app_info(app)
      app.scrape_app_page(app.app_url)
      puts <<-DOC
              #{app.title.upcase.colorize(:blue)}
              Developers: #{app.dev}        Rated By: #{app.rate_cnt}
                    Content For: #{app.con_rating}

      DOC
            puts "DESCRIPTION:".colorize(:red)
      puts <<-DOC

          #{app.description}

      Get App At: #{app.app_url.colorize(:red)}
      More Apps By #{app.dev}: #{app.dev_url.colorize(:red)}

      DOC
    end


    def goodbye
      puts "See you next time!!"
    end

end
