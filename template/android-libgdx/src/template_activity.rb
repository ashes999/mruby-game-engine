require 'ruboto/widget'
require 'ruboto/util/toast'

# LibGDX
java_import com.badlogic.gdx.ApplicationAdapter;
java_import com.badlogic.gdx.Gdx;
java_import com.badlogic.gdx.graphics.GL20;
java_import com.badlogic.gdx.graphics.Texture;
java_import com.badlogic.gdx.graphics.g2d.SpriteBatch;

# LibGDX on Android
java_import android.os.Bundle;
java_import com.badlogic.gdx.backends.android.AndroidApplicationConfiguration;
java_import com.badlogic.gdx.backends.android.AndroidApplication;

class TestGame < ApplicationAdapter
  def create
    @batch = SpriteBatch.new
    @img = Texture.new("assets/badlogic.jpg")
  end

  def render
    Gdx.gl.glClearColor(1, 0, 0, 1)
    Gdx.gl.glClear(GL20.GL_COLOR_BUFFER_BIT)
    @batch.begin
    @batch.draw(@img, 0, 0)
    @batch.end
  end
end

### boilerplate/launcher code below

class AndroidLauncher < AndroidApplication
  def onCreate(bundle)
    super
    config = AndroidApplicationConfiguration.new
    game = TestGame.new
    initialize(game, config)
    self.content_view = initialize_for_view(game, config)
    puts "Content view is #{self.content_view}"
  rescue Exception => e
    puts "Exception starting #{self.class}: #{e} (#{e.class} #{e.message})\n#{e.backtrace.join("\n")}"
    super
  end
end

class TemplateActivity
  def onCreate(bundle)
    super
    start_ruboto_activity(AndroidLauncher)
    finish
  rescue Exception => e
    puts "Exception starting #{self.class}: #{e} (#{e.class}) #{e.message}\n#{e.backtrace.join("\n")}"
  end
end
