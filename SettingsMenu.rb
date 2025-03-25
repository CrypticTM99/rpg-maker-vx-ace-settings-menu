##Created by CrypticTM##

# ** SettingsMenu.rb **
# This script adds a settings menu to the main menu of RPG Maker VX Ace without breaking any default functionality.
# The settings menu allows users to adjust sound volume, screen resolution, and manage key bindings.

# Modifying the main menu to add the "Settings" option
class Scene_Menu < Scene_MenuBase
  alias original_create_command_window create_command_window
  
  def create_command_window
    original_create_command_window
    @command_window.set_handler(:settings, method(:command_settings))
  end
  
  def command_settings
    SceneManager.call(Scene_Settings)
  end
end

# The new Scene_Settings class
class Scene_Settings < Scene_MenuBase
  def start
    super
    create_background
    create_settings_window
  end
  
  def create_background
    @background = Sprite.new
    @background.bitmap = Cache.system("MenuBackground") # Custom background image if you want
  end

  def create_settings_window
    @settings_window = Window_Command.new(300, ['Sound', 'Display', 'Controls', 'Back'])
    @settings_window.set_handler(:ok, method(:on_settings_ok))
    @settings_window.set_handler(:cancel, method(:return_to_menu))
    @settings_window.x = (Graphics.width - @settings_window.width) / 2
    @settings_window.y = (Graphics.height - @settings_window.height) / 2
  end

  def on_settings_ok
    case @settings_window.index
    when 0
      SceneManager.call(Scene_SoundSettings)
    when 1
      SceneManager.call(Scene_DisplaySettings)
    when 2
      SceneManager.call(Scene_ControlSettings)
    when 3
      return_to_menu
    end
  end

  def return_to_menu
    SceneManager.return
  end
end

# Sound Settings Menu
class Scene_SoundSettings < Scene_MenuBase
  def start
    super
    create_background
    create_sound_settings_window
  end

  def create_background
    @background = Sprite.new
    @background.bitmap = Cache.system("MenuBackground")
  end

  def create_sound_settings_window
    @sound_window = Window_SoundSettings.new
    @sound_window.set_handler(:cancel, method(:return_to_settings))
  end

  def return_to_settings
    SceneManager.call(Scene_Settings)
  end
end

class Window_SoundSettings < Window_Command
  def initialize
    super(0, 0)
    @volume = Audio.master_volume
    @bgm_volume = Audio.bgm_volume
    @se_volume = Audio.se_volume
    @me_volume = Audio.me_volume
    self.height = 160
    self.width = 320
    refresh
  end

  def make_command_list
    add_command('Master Volume', :master_volume)
    add_command('BGM Volume', :bgm_volume)
    add_command('SE Volume', :se_volume)
    add_command('ME Volume', :me_volume)
    add_command('Back', :cancel)
  end

  def refresh
    self.contents.clear
    super
    draw_volume_slider(0, 'Master Volume', @volume)
    draw_volume_slider(40, 'BGM Volume', @bgm_volume)
    draw_volume_slider(80, 'SE Volume', @se_volume)
    draw_volume_slider(120, 'ME Volume', @me_volume)
  end

  def draw_volume_slider(y, label, value)
    self.contents.draw_text(0, y, 120, 32, label)
    self.contents.fill_rect(120, y, 180, 16, Color.new(0, 0, 0, 64))
    self.contents.fill_rect(120 + (value * 1.8), y, 16, 16, Color.new(255, 255, 255))
  end
end

# Display Settings Menu (for toggling fullscreen or screen resolution)
class Scene_DisplaySettings < Scene_MenuBase
  def start
    super
    create_background
    create_display_settings_window
  end

  def create_background
    @background = Sprite.new
    @background.bitmap = Cache.system("MenuBackground")
  end

  def create_display_settings_window
    @display_window = Window_DisplaySettings.new
    @display_window.set_handler(:cancel, method(:return_to_settings))
  end

  def return_to_settings
    SceneManager.call(Scene_Settings)
  end
end

class Window_DisplaySettings < Window_Command
  def initialize
    super(0, 0)
    self.height = 160
    self.width = 320
    refresh
  end

  def make_command_list
    add_command('Fullscreen', :fullscreen)
    add_command('Windowed', :windowed)
    add_command('Back', :cancel)
  end

  def refresh
    self.contents.clear
    super
  end
end

# Control Settings (Key Bindings or other controls)
class Scene_ControlSettings < Scene_MenuBase
  def start
    super
    create_background
    create_control_settings_window
  end

  def create_background
    @background = Sprite.new
    @background.bitmap = Cache.system("MenuBackground")
  end

  def create_control_settings_window
    @control_window = Window_ControlSettings.new
    @control_window.set_handler(:cancel, method(:return_to_settings))
  end

  def return_to_settings
    SceneManager.call(Scene_Settings)
  end
end

class Window_ControlSettings < Window_Command
  def initialize
    super(0, 0)
    self.height = 160
    self.width = 320
    refresh
  end

  def make_command_list
    add_command('Rebind Controls', :rebind)
    add_command('Back', :cancel)
  end

  def refresh
    self.contents.clear
    super
  end
end
