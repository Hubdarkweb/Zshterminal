Here's an updated `README.md` with requirements and a user manual:

---

# Termux Custom Zsh Setup Script

This script automates the setup of a customized Zsh environment in Termux, enhancing usability and appearance with tools, themes, plugins, and custom configurations.

## Requirements

- **Termux**: Ensure Termux is installed on your Android device.
- **Internet Connection**: The script requires an active internet connection to download packages and dependencies.
- **Termux Packages**: `pkg` should be functional for package installation.

## Installation

1. **Download the Script**  
   Clone or download the script into your Termux environment.

2. **Grant Execution Permissions**  
   Make the script executable:
   ```bash
   chmod +x script_name.zsh
   ```

3. **Run the Script**  
   Execute the script in Termux:
   ```bash
   ./script_name.zsh
   ```

## User Manual

### Script Components and Features

1. **System Update and Package Installation**  
   - Updates Termux packages and installs essential packages: `wget`, `git`, `zsh`, and `curl`.

2. **Oh-My-Zsh Setup**  
   - Installs Oh-My-Zsh if not already present, which is essential for managing Zsh themes and plugins.

3. **Powerlevel10k Theme**  
   - Installs the Powerlevel10k theme, offering a highly customizable and informative Zsh prompt.
   - Automatically configures `.zshrc` to use Powerlevel10k.

4. **Plugin Installation**  
   - Adds `zsh-syntax-highlighting` for syntax coloring and `zsh-autosuggestions` for command recommendations, enhancing command-line productivity.

5. **Keyboard Configuration for Termux**  
   - Customizes the keyboard layout for Termux to improve accessibility, especially for commonly used shortcuts.

6. **Random ASCII Art Generator**  
   - Generates and displays randomly colored ASCII art with the text "𝙏𝙊𝙥𝙋𝙇𝙐𝙂" in the Termux properties.

7. **Custom Aliases and Functions**  
   - Adds useful aliases for frequent commands (e.g., `ll`, `gs`, `ga`, `gc`, `gp`, `gd`) and a function for archive extraction that handles various formats.

### Post-Installation

1. **Restart Termux**  
   After the script completes, restart Termux to apply all changes.

2. **Powerlevel10k Configuration**  
   - Run `p10k configure` to customize your Powerlevel10k prompt, or manually edit the `.p10k.zsh` file.

### Commands and Aliases

- **`ll`**: Lists all files in the directory with details.
- **`gs`**: Displays the status of the Git repository.
- **`ga`**: Adds files to the Git staging area.
- **`gc`**: Commits changes with a message.
- **`gp`**: Pushes changes to the remote repository.
- **`gd`**: Shows differences between commits in Git.
- **`extract <file>`**: Extracts various archive formats, including `.tar.gz`, `.zip`, `.rar`, `.7z`, etc.

### Custom Keyboard Layout

The script customizes the Termux keyboard with an extra row for quick access to `ESC`, `TAB`, `CTRL`, `ALT`, and directional keys.

To reload the Termux settings after running the script, use:
```bash
termux-reload-settings
```

## Troubleshooting

- **Plugins Not Loading**: If plugins don't load, check that the `.zshrc` file includes the correct plugin path and list.
- **Oh-My-Zsh Not Installed**: Ensure that `curl` and `git` are installed and functional before running the script.
- **Powerlevel10k Not Displaying Correctly**: Run `p10k configure` to reset the theme and check your `.zshrc` configuration.

---

Enjoy your optimized Termux setup!
