# Performance Mod Guide for Valheim

This guide is a trusted resource, offering tips to optimize Valheim performance, even on older systems. Compiled from expert sources, personal experience, and community insights to provide you with practical recommendations.

Even though this guide is separated into sections, you do not necessarily have to do all of them in order or even at all. However, ensure you read through this guide in its entirety before attempting any of the below sections.

![Viking](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/valheim-pic.png?raw=true)

## Section 1: Vulkan API

The game suffers from performance issues even on high-end PCs. To address these problems, let's start by taking advantage of the Vulkan API.

Valheim supports the Vulkan API, a more efficient graphics architecture that potentially can:

- Lower CPU load
- Predictable CPU load
- Better memory interfaces
- Predictable memory load

Running Valheim in Vulkan can improve FPS, especially on systems that struggle with the default renderer.

1. Enable the Vulkan API:

   - In the Steam Library for Valheim, simply click `Play`.
   - Choose `Play Valheim using Vulkan`

---

## Section 2: Optimize Boot Configuration for Better FPS

> [!NOTE]
> Modifying this file will boost FPS as it forces the system to allocate more processing tasks to the Graphics Processing Unit (GPU), thereby lightening the load on the Central Processing Unit (CPU) and alleviating bottlenecks.

> [!IMPORTANT]
> Updating Valheim will remove this modification, forcing you to add it again.

1. Locate the `boot.config`:

   - In your Steam Library, `Right-Click` on `Valheim`.
   - Navigate to `Manage` ⇒ `Browse local files`.
   - Inside the Explorer window that should have opened, you will see `valheim_Data`.
   
     `C:\Program Files (x86)\Steam\steamapps\common\Valheim\valheim_Data`

   - Inside of the `valheim_Data` folder, locate the `boot.config` file. It's at the top.

![valheim_Data boot.config](https://github.com/ZeroOneZero/Performance-Mod-Guide-For-Valheim/blob/main/images/valheim_data-boot-config.png?raw=true)

2. Editing the file:
 
   - `Right-click` on `boot.config` and select `Open With` ⇒ `Notepad`.

   - Add the following lines at the top of the file:

     - `gfx-enable-gfx-jobs=1`
     - `gfx-enable-native-gfx-jobs=1`

   - Save and exit

Here is what your `boot.config` file should now look like:

![boot.config](https://github.com/ZeroOneZero/Performance-Mod-Guide-For-Valheim/blob/main/images/boot.config.png?raw=true)

> [!IMPORTANT]
> You can `Verify Files`, located in the `Properties` Panel. To have Steam check and restore any modified files.

---

## Section 3: Giving the Valheim Process a Higher Priority

In this section, we’ll create a command shortcut that launches Valheim from Steam in high-priority mode.

### What is High Priority?

> In Windows, the operating system allocates the computer’s resources based on the priority of each application. \
A higher priority means more resources will be allocated to Valheim.

1. Create a shortcut:

   - In your Steam Library, `Right-Click` on `Valheim`.
   - Navigate to `Manage` ⇒ `Browse local files`.
   - `Right-Click` on `valheim.exe` and select `Create shortcut`.
   - Name the new shortcut `valheim`.

2. Make it a Command shortcut:

   - `Right-Click` the new shortcut, select `Properties`.
   - Add the following to the front of the `Target` field:

     `cmd /c start /high Valheim.exe `

   - Click `OK`

![Shortcut Target](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/valheim-short.png?raw=true)

> [!NOTE]
> The /c instructs the command prompt to close after executing our command.

3. Copy the location of the shortcut to paste into Steam.
 
   - While holding down the `SHIFT` key, `Right-click` on the Command shortcut.
   - Select `Copy as path`.

4. Open Steam and go to the Launch Options for Valheim.

   - Paste in the path, then after it type: `%command%`

     `"C:\Program Files (x86)\Steam\steamapps\common\Valheim\valheim.lnk" %command%`

![Launch Options](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/valheim-steam-launch-options.png?raw=true)

---

## Section 4: High-Performance Power Plan on Windows

> [!NOTE]
> Only one or the other can be done.

1. Set a power plan through Settings:

   - Press `Windows Key` + `R`, and type `powercfg.cpl`.
   - Select `High performance` or, if available, choose `Ultimate Performance`.

2. Force a Power Plan with the Group Policy (will not work on Home editions of Windows):

   - Press `Windows Key` + `R`, and type `gpedit.msc`.
   - Under `Local Computer Policy`, expand `Computer Configuration` ⇒ `Administrative Templates` ⇒ `System`, and select `Power Management`.
   - Double-click on `Select an active power plan`.
   - Select the `Enabled` radio button and choose from the drop-down `High Performance` or, if available, `Ultimate Performance`.
   - Click `OK`.

---

## Section 5: Nvidia Control Panel Settings

If you're using an Nvidia GPU, tweak settings for Valheim to get an extra FPS boost:

1. `Vertical Sync` can be set to `Fast` in the Nvidia Control Panel to reduce input lag without locking FPS, especially if your system produces higher frame rates than your monitor's refresh rate.

2. Power Management Mode: Set to `Maximum Performance`.

---

## Section 6: Valheim Graphics Configuration Script

> [!CAUTION]
> BE AWARE THIS IS A WIP: ANY HELP WOULD BE GREAT.
> LOD seems to be screwy.

### Features

- **Adjust Graphics Quality**: Choose from Low, Medium, High, or Ultra presets to optimize Valheim's graphics settings for your system.
- **Automatic System Detection**: The script detects your CPU, RAM, and GPU to recommend the best graphics quality setting.
- **Backup Functionality**: Before making changes, the script creates a backup of your current Valheim registry settings.
- **Restore Capability**: Easily restore previous graphics settings from backups.
- **User-Friendly Interface**: Interactive menu-driven script that's simple to use, even for those unfamiliar with PowerShell.

1. Run PowerShell as Administrator.

   - Press `Win` + `S`, and type `powershell`.
   - `Right-Click` on the search entry for `powershell`, and from the menu, select `Run as administrator`.

2. Copy and Paste One or the Other:
 
   The following code will allow remote script execution and execute my script without the need to download it.

     ```powershell
     #One
     Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force; Invoke-RestMethod "https://raw.githubusercontent.com/RobThePCGuy/Performance-Mod-Guide-For-Valheim/main/doit.ps1" | Invoke-Expression
     ```

   OR: This will run the script as Administrator, allow remote script execution, and execute my script without the need to download it.

     ```powershell
     #the Other
     Start-Process PowerShell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force; Invoke-RestMethod 'https://raw.githubusercontent.com/RobThePCGuy/Performance-Mod-Guide-For-Valheim/main/doit.ps1' | Invoke-Expression" -Verb RunAs
     ```

3. When you run the script, you'll be presented with a menu.

   Allows you to select from:

   - **Low**: Optimizes for performance on lower-end systems.
   - **Medium**: Balanced settings for moderate performance and visuals.
   - **High**: Enhances visuals while maintaining good performance.
   - **Ultra**: Maximum settings for high-end systems.

   Restore/Backup the Registry.

   - Lists available backups stored in the `ValheimRegistryBackup` folder on your Desktop.
   - Allows you to:
     - Restore the most recent backup.
     - Choose a specific backup to restore.
     - Enter a custom backup file path.
  
> [!CAUTION]
> Restoring settings will overwrite your current graphics configurations.

> [!NOTE]
> Backups are stored in a folder named `ValheimRegistryBackup` on your Desktop.
> Each backup is a `.reg` file with a timestamp (e.g., `ValheimRegistryBackup_20230101120000.reg`).
> You can manually restore a backup by double-clicking the `.reg` file and following the prompts.

> [!IMPORTANT]
> Modifying the registry requires administrative privileges. Ensure you run PowerShell as Administrator.
> Ensure that Valheim is not running while you apply new settings or restore backups.

---

## Section 7: Steam Launch Options

To force a few fixes directly, we can use Steam and its Launch Options.

1. In your Steam Library, `Right-Click` on `Valheim`, select `Properties` ⇒ `Launch Options`.

| Launch Options                          | Description                                         |
|-----------------------------------------|-----------------------------------------------------|
| -screen-width 1920 -screen-height 1080 | Override the default screen width and height        |
| -console                                | Enables the F5 console inside Valheim               |
| -window-mode exclusive                  | Activates exclusive full-screen mode. *If it doesn't seem to be working, press `ALT`+`ENTER`* **x2**.       |
| -window-mode borderless                 | Opens in a full-screen window without borders.      |
| -popupwindow                            | A window without a frame.                           |
| -force-d3d9                             | Run a game using DirectX 9                          |
| -force-d3d11                            | Run a game using DirectX 11                         |
| -force-d3d12                            | Run a game using DirectX 12                         |
| -force-vulkan                           | Forces Vulkan. It is easier to simply choose Vulkan from the options after clicking Play.

Your final Steam Launch Options may look something like this:

`"C:\Program Files (x86)\Steam\steamapps\common\Valheim\valheim.lnk" %command% -console`

---

## Closing Statement:

These hacks and scripts are provided "as is" without warranty of any kind. The author is not liable for damage or data loss. Use at your own risk.

Performance optimization in Valheim is an ongoing process, as the game itself is evolving. Use this guide as a starting point, and experiment with different settings to see what works best for your system. Remember, feedback is valuable—if you discover new optimizations, feel free to share them to help others.

Enjoy smoother gameplay and the Viking adventure you deserve! If this guide has helped, consider leaving a comment or contacting me with suggestions at rob@zero-one-zero.com.

If my guide has enhanced your gaming experience, consider leaving a star.
