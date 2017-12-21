class DailyTrending::Vid
  attr_accessor :name, :views, :description, :url, :category

  def self.today
    #return instances of vids
    puts <<-DOC
    1. BITTEN by a GIANT DESERT CENTIPEDE!
                1,300,174 views

    2.Lucky the iPhone singing cockatiel is OVER it!
                449,340 views
    DOC
    # vid_2 = self.new
    # vid_2.name = "Lucky the iPhone singing cockatiel is OVER it!"
    # vid_2.views = '449,340'
    # vid_2.description = 'Lucky became famous for singing a perfect rendition
    # of an iPhone ringtone. But watch what happens when he sees his own video!
    # Dude is OVER it.'
    # vid_2.url = 'https://www.youtube.com/watch?v=8eo-L_3OWAQ'
    # vid_2.category 'Film & Animation'

    # [vid_1, vid_2]
  end


end
