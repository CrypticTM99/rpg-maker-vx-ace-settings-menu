# RPG Maker VX Ace - Settings Menu Script

This script adds a fully functional settings menu to the main menu of RPG Maker VX Ace. It allows players to adjust sound settings, toggle display options (fullscreen/windowed mode), and rebind controls directly from the main menu. The settings menu integrates smoothly with the default functionality of RPG Maker VX Ace without causing any conflicts.

## Features

- **Sound Settings**: 
  - Adjust master volume, BGM, SE, and ME volumes.
  - Visual sliders for easy adjustment.

- **Display Settings**: 
  - Toggle between fullscreen and windowed modes.
  - Customizable for additional display options like resolution changes (can be expanded).

- **Control Settings**: 
  - Allows the player to manage keybindings (extendable to allow custom rebinding).

- **Non-intrusive Integration**: 
  - Adds a "Settings" option to the main menu without breaking any existing default features in RPG Maker VX Ace.

## Installation

1. **Download the Script**:
   - Download the `SettingsMenu.rb` script and place it inside the `Scripts` folder of your RPG Maker VX Ace project.

2. **Insert the Script**:
   - In RPG Maker VX Ace, open your project.
   - Open the **Script Editor** (F11).
   - Paste the `SettingsMenu.rb` script into an available slot in the `Scripts` list.
     - It’s recommended to place it near the top of the list but after any default scripts that handle the main menu.

3. **Save Your Project**:
   - Once the script is added, save your project to retain the changes.

4. **Access the Settings Menu**:
   - Launch your game, and in the main menu, you will see an option for **Settings**.
   - Selecting this option will bring you to the settings menu, where you can adjust sound, display, and controls.

## How to Use

1. **Sound Settings**:
   - In the settings menu, choose **Sound** to adjust the volume for master sound, background music (BGM), sound effects (SE), and music effects (ME).
   - Use the visual sliders to adjust the volumes as needed.

2. **Display Settings**:
   - Choose **Display** to toggle between fullscreen and windowed mode for the game.
   - (Optional) You can extend this functionality by adding more display options, such as screen resolution changes.

3. **Control Settings**:
   - Choose **Controls** to rebind keys (you can extend this functionality based on your game’s needs).
   - This menu can be expanded to allow the player to modify keyboard or gamepad bindings.

4. **Returning to the Menu**:
   - When you’re done adjusting the settings, choose **Back** to return to the main settings menu or back to the main game.

## Extending the Script

This script is modular and can be extended to add more settings or customization options. Here's how you can extend it:

- **Add New Sound Options**: Add more options for adjusting other sound channels like **Voice** or custom audio categories.
- **Add Resolution Settings**: In the `Scene_DisplaySettings` class, you can add more resolution options for the player to choose from.
- **Custom Keybinding**: In `Scene_ControlSettings`, you can implement custom keybinding functionality for more advanced control setups.

## Compatibility

This script is designed to be compatible with **RPG Maker VX Ace**. However, it may conflict with other scripts that modify the main menu or settings menus. Make sure to test your game thoroughly after adding this script to ensure compatibility with any other scripts you may be using.

## License

This script is free to use and modify, but please give credit if you use it in your RPG Maker VX Ace projects. 

## Credits

- **Script Creator**: [CrypticTM]
- **Script Editor**: [CrypticTM]
- **RPG Maker VX Ace**: Developed by **Enterbrain**.
