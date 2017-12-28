class DailyTrending::Cli

  def call
    list_apps
    menu
    goodbye
  end

  def list_apps
    s = "******".colorize(:blue)
    puts ""
    puts "  #{s}"+"Today's Trendables"+s
    puts ""

    @apps = DailyTrending::Vid.today
    @apps.each.with_index(1) do |app, i|
      puts <<-DOC
      #{i} #{app.title.colorize(:green)}
          #{app.rating}  #{app.price}

      DOC
    end
    puts ""
  end

    def menu
      input = nil
      until input == 'exit'
        puts "Enter the number of the video you that interests you or type exit"
        input = gets.strip.downcase

        if input.to_i > 0
          puts @apps[input.to_i-1]
        elsif input == 'list'
          list_apps
        else
          puts "#{input} not an option, type list or exit" unless input == 'exit'
        end
      end
    end

    #vid info possibly needs to be in another file
    def vid_info
      puts <<-DOC
      Description: Lucky became famous for singing a perfect rendition
      of an iPhone ringtone. But watch what happens when he sees his own video!
      Dude is OVER it.

      Original video: https://www.youtube.com/watch?v=wO0vP...
      Category: Film & Animation
      DOC
    end

    def goodbye
      puts "See you next time!!"
    end

  # shows uploaders info:
  # "Please SUBSCRIBE - http://bit.ly/BWchannel
  # Tour Tickets Available Now! - http://bit.ly/bravetickets
  # Buy Brave Wilderness Gear - http://bit.ly/BWmerch
  # Buy Coyote’s Book - http://bit.ly/BOOKbraveadventures
  # Watch More - http://bit.ly/BTwarrior"

end
