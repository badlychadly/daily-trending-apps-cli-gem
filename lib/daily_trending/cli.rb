class DailyTrending::Cli

  def call
    list_vids
    menu
    goodbye
  end

  def list_vids
    puts "Today's Trendables"
    puts <<-DOC
    1. BITTEN by a GIANT DESERT CENTIPEDE!#.colorize
                1,300,174 views

    2.Lucky the iPhone singing cockatiel is OVER it!#.colorize
                449,340 views
    DOC
    @vid = DailyTrending::Vid.today
  end

    def menu
      input = nil
      until input == 'exit'
        puts "Enter the number of the video you that interests you or type exit"
        input = gets.strip.downcase
        case input
        when '1'
          vid_info
        when '2'
          vid_info
        when 'list'
          list_vids
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
