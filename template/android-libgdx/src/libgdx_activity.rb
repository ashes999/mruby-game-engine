# This is generated (sort of). Don't change it. Your game code should go
# in ruby_terrace_game.rb.

require 'ruboto/widget'
require 'main_game'

class LibgdxActivity
  def onCreate(bundle)
    super
    # Can't instantiate Ruby class in Java, so create it here and pass it in
    Java::ComTerraceLibgdx.LibgdxActivity.mainGame = MainGame.new
    start_ruboto_activity "AndroidLauncher", {
      :java_class => Java::ComTerraceLibgdxAndroid::AndroidLauncher
    }
  rescue Exception
    puts "Exception creating activity: #{$!}"
    puts $!.backtrace.join("\n")
  end
end
