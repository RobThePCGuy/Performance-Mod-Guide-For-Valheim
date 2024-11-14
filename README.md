 # Performance Mod Guide for Valheim

This guide is a trusted resource, offering tips to optimize Valheim performance, even on older systems. Compiled from expert sources, personal experience, and community insights, it provides practical recommendations—from adjusting configuration files to fine-tuning settings—plus an all-in-one performance script. Navigate by section or follow through completely for the best results. 

Reviewing the guide in full will help you plan your approach effectively.

![Viking](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/valheim-pic.png?raw=true)

# To Gain or Not to Gain Performance

## **Section 1: Vulkan API**

The game sometimes suffers from performance issues even on high-end PCs. To address these problems, let's start by taking advantage of the Vulkan API.

Valheim supports the Vulkan API, a more efficient graphics architecture. Running Valheim in Vulkan can improve FPS, especially on systems that struggle with the default renderer.

1. **How to enable Vulkan**:
   - Open Steam, select Valheim, click Play.
   - Choose "Play Valheim using Vulkan."
   - Note: Vulkan does not always work well with smoke effects. Experiment to see if this mode is compatible with your setup.
 
## **Section 2: Optimize Boot Configuration for Better FPS**

> [!IMPORTANT]
> In roughly 90% of systems, this straightforward adjustment can boost frames per second (FPS). It forces the system to allocate more processing tasks to the Graphics Processing Unit (GPU), thereby lightening the load on the Central Processing Unit (CPU) and alleviating bottlenecks. This is configured in the `boot.config` file, which plays a key role in redistributing the workload from the CPU to the GPU.

### **Editing `boot.config`**

1. In the Steam Library, **right-click** on **Valheim**.
   - Navigate to `Manage` --> `Browse Local Files`.
   - Inside of the Explorer window that should have opened you will see `valheim_Data`.
    
    `
    C:\Program Files (x86)\Steam\steamapps\common\Valheim\valheim_Data
    `
2. Go into the `valheim_Data` folder to locate the `boot.config` file. It'll be at the top of the directory listing.
  
  ![valheim_Data boot.config](https://github.com/ZeroOneZero/Performance-Mod-Guide-For-Valheim/blob/main/images/valheim_data-boot-config.png?raw=true)

3. `Right-click` `boot.config` and select "Open With" > Notepad.
   - Add the following lines at the top of the document:
     - `gfx-enable-gfx-jobs=1`
     - `gfx-enable-native-gfx-jobs=1`
    - Save and exit

Here is what your `boot.config` file should now look like:

![boot.config](https://github.com/ZeroOneZero/Performance-Mod-Guide-For-Valheim/blob/main/images/boot.config.png?raw=true)

> [!IMPORTANT]
> You can simply `verify files` from the properties for Valheim in your Steam Libray if you think you may have doorked it up.

## Section 3: Command Shortcut to get High Priority Mode

In this section, we’ll create a command shortcut that launches Valheim in High Priority mode via Steam.

### What is High Priority?

> In Windows, the operating system allocates the computer’s resources based on the priority of each application. \
A higher priority means more resources will be allocated to Valheim.

### Creating a Command Shortcut

1. In your Steam Library, `Right-click` on Valheim and go to `Manage` ---> `Browse Local Files`.

2. Windows **Explorer** should have opened to the game's location.

3. `Right-click` on the `valheim` exe and select `Create shortcut`
   - Rename the new shortcut to `valheim`.

4. `Right-click` the `valheim` shortcut, select `Properties`.
   - Add the following at the start of the `Target` field:
    - `cmd /c start /high Valheim.exe `
   - Click `OK`

![Shortcut Target](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/valheim-short.png?raw=true)

> [!NOTE]
> The /c instructs the command prompt to close after executing our command.

5. Next up is to hold `SHIFT` and `Right-click` on the shortcut.
   - Select **Copy as path**

6. In Steam's Launch Options for Valheim, paste this path
   - Press the spacebar then type: `%command%`, after it to make sure it runs with a high base priority.
`
"C:\Program Files (x86)\Steam\steamapps\common\Valheim\valheim.lnk" %command%
`

![Launch Options](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/valheim-steam-launch-options.png?raw=true)

## Section 4: Enable High-Performance Power Plan**

This ensures your system is always utilizing the maximum power needed for gaming.

1. Press `Windows Key + R`, type `gpedit.msc` (Note: This is only available on non-Home editions of Windows).
   - Navigate to **Local Computer Policy** > **Administrative Templates** > **System** > **Power Management**.
   - Set the active power plan to **High Performance**.

## **Section 5: In-Game Graphics Settings**

Adjusting in-game settings can also help balance visual quality with performance:

- **VSync**: Turn it off to reduce unnecessary load and prevent lower FPS rates when your game struggles to match your monitor's refresh rate.
- **Vegetation Quality**: Set to **High** to keep visuals immersive without massive performance cost.
- **Shadows**: Set **Shadow Quality** to **Low** and **Active Point Light Shadows** to **Low**.
- **Draw Distance**: Keep this at **High** only if your system can handle it; otherwise, reduce it for better FPS.
- **Other Effects**: Enable **Bloom**, **Anti-Aliasing**, **SSAO**, **Tessellation**, and **Soft Particles** for decent visuals, but leave other effects off to improve FPS.

## **Section 6: Nvidia Control Panel Settings**

If you're using an Nvidia GPU, tweak settings for Valheim to get an extra FPS boost:

1. **Vertical Sync**: Set to **Fast** in the Nvidia Control Panel to reduce input lag without locking FPS, especially if your system produces higher frame rates than your monitor's refresh rate.

2. **Power Management Mode**: Set to **Maximum Performance**.

## **Section 7: Valheim Graphics Quality Configuration Script**

Welcome to the **Valheim Graphics Quality Configuration Script**! This PowerShell script allows you to easily adjust the graphics quality settings of Valheim by modifying specific registry entries. It also provides backup and restore functionality, ensuring that you can revert to previous settings if needed.

### Features
- **Adjust Graphics Quality**: Choose from Low, Medium, High, or Ultra presets to optimize Valheim's graphics settings for your system.
- **Automatic System Detection**: The script detects your CPU, RAM, and GPU to recommend the best graphics quality setting.
- **Backup Functionality**: Before making changes, the script creates a backup of your current Valheim registry settings.
- **Restore Capability**: Easily restore previous graphics settings from backups.
- **User-Friendly Interface**: Interactive menu-driven script that's easy to use, even for those unfamiliar with PowerShell.

### Prerequisites

- **Operating System**: Windows 10 or later.
- **Permissions**: Run PowerShell as an Administrator to ensure the script can modify the registry.
- **PowerShell Execution Policy**: The script requires script execution permissions.

### Allow Script Execution

Before running the script, you may need to adjust your PowerShell execution policy:

```powershell
## Check current execution policy
Get-ExecutionPolicy

## Temporarily allow script execution for the current session
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
```

### Run the Script

1. **Download the Script**: Save the script file [doit.ps1](https://github.com/RobThePCGuy/Performance-Mod-Guide-For-Valheim/blob/a4ce914d6c542ee95a6d81d18709d5b261d7aefd/doit.ps1) to a convenient location on your computer.
2. **Open PowerShell as Administrator**:
   - Press `Win + X` and select **Windows PowerShell (Admin)** or **Windows Terminal (Admin)**.
3. **Navigate to the Script Directory**:

   ```powershell
   #Powershell
   cd $Env:UserProfile\Downloads
   
   #CMD
   cd %UserProfile%\Downloads
   ```

4. **Execute the Script**:

   ```powershell
   #Powershell
   .\doit.ps1
   
   #CMD
   powershell .\doit.ps1
   ```

#### Options

When you run the script, you'll be presented with a menu:

1. Apply New Graphics Quality Settings

- **Description**: Adjust Valheim's graphics settings based on predefined quality levels.
- **Process**:
  - The script detects your system specifications (CPU, RAM, GPU).
  - Recommends a graphics quality level based on your RAM size.
  - Allows you to select from:
    - **Low**: Optimizes for performance on lower-end systems.
    - **Medium**: Balanced settings for moderate performance and visuals.
    - **High**: Enhances visuals while maintaining good performance.
    - **Ultra**: Maximum settings for high-end systems.
  - **Backup**: Creates a timestamped backup of your current graphics settings.
  - **Apply Settings**: Modifies the registry entries to apply the new graphics settings.

2. Restore Graphics Settings from Backup

- **Description**: Restore previous graphics settings from backups.
- **Process**:
  - Lists available backups stored in the `ValheimRegistryBackup` folder on your Desktop.
  - Allows you to:
    - Restore the most recent backup.
    - Choose a specific backup to restore.
    - Enter a custom backup file path.
  - **Warning**: Restoring settings will overwrite your current graphics configurations.

> [!NOTE]
>**Backup Location**: Backups are stored in a folder named `ValheimRegistryBackup` on your Desktop.
>**Backup Format**: Each backup is a `.reg` file with a timestamp (e.g., `ValheimRegistryBackup_20230101120000.reg`).
>**Manual Restore**: You can manually restore a backup by double-clicking the `.reg` file and following the prompts.

> [!IMPORTANT]
>**Administrator Rights**: Modifying the registry requires administrative privileges. Ensure you run PowerShell as an Administrator.
>**Valheim Must Be Closed**: Ensure that Valheim is not running while you apply new settings or restore backups.

## Section 8: **Steam Launch Options**

To force a few fixes directly we can use Steam and it's Launch Options.

1. **Modify Steam Launch Options**
   - In the Steam Library, right-click _Valheim_, select _Properties_, and under _Launch Options_ you can add one of the following.

| Launch Options                          | Description                                         |
|-----------------------------------------|-----------------------------------------------------|
| -screen-width (1920) -screen-height (1080)  | Override the default screen width and height        |
| -console                                | Enables the F5 console inside Valheim               |
| -window-mode exclusive                  | Activates exclusive full-screen mode, minimizing any extra processing load often seen in windowed configurations.       |
| -window-mode borderless                 | Opens the application in a full-screen window without borders, allowing smooth transitions between applications. It adjusts to match your desktop’s resolution, so on a 4K display, the application retains that high resolution in borderless mode.       |
| -popupwindow                            | A window without a frame.                           |
| -force-d3d9                             | Run a game using DirectX 9                          |
| -force-d3d11                            | Run a game using DirectX 11                         |
| -force-d3d12                            | Run a game using DirectX 12                         |
| -force-vulkan                           | Directs the game to run on the Vulkan API. This can reduce CPU overhead and improve GPU efficiency, especially on newer cards.                         |

## **Final Thoughts**

These hacks and script is provided "as is" without warranty of any kind. The author is not responsible for any damage or data loss that may occur from using these. Use at your own risk.

Performance optimization in Valheim is an ongoing process, as the game itself is evolving. Use this guide as a starting point, and experiment with different settings to see what works best for your system. Remember, feedback is valuable—if you discover new optimizations, feel free to share them to help others.

Enjoy smoother gameplay and the Viking adventure you deserve! If this guide has helped, consider leaving a comment or contacting me with suggestions at rob@zero-one-zero.com.

If my guide has enhanced your gaming experience, consider leaving a star.
