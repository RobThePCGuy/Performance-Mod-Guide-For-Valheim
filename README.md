# Performance Mod Guide for Valheim

This guide has served me well, and I hope it will do the same for you. Designed as a comprehensive resource for all performance-related issues in Valheim, it aims to be your go-to solution. Your feedback is crucial to keeping this guide up-to-date and useful. If you find any outdated information, errors, or if you have suggestions for improvement, please do not hesitate to reach out. You can contact me via email @ <rob@zero-one-zero.com>. I am dedicated to continually updating this guide to ensure it remains relevant and helpful to all.

Explore the guide, which is broken down into sections and designed for flexibility. Choose the sections that suit your needs or tackle them all for a complete experience. Embued with a mix of easy and challenging steps, you may consider reading through the entire guide first to strategize your approach.

*Or, why not start at the top like I do after a break? It’s a great way to refresh your understanding.*

![Viking](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/valheim-pic.png?raw=true)

> [!NOTE]
> While in-game, pressing ```F2``` will display a GUI with some additional information, like Frames per Second (FPS).
> 
> Be aware that updates to Valheim may affect the modifications suggested in this guide. Always check your game for changes after any patches to ensure that these modifications are still applicable and functioning as expected.

# Increasing Performance

## Unlock Your GPU By Editing `boot.config`

> [!IMPORTANT]
> For about 90% of systems, this simple modification can increase your frames per second (FPS). By making specific changes to this file, we shift a greater portion of the processing tasks to the Graphics Processing Unit (GPU). This adjustment reduces the workload on the Central Processing Unit (CPU), effectively easing the bottleneck. This can lead to smoother gameplay and improved performance.

1. **Accessing Valheim Data Files:**
   - In the Steam Library, **right-click** on **Valheim**.
   - Navigate to `Manage` --> `Browse Local Files`.
   - Inside of the Explorer window that should have opened you will see `valheim_Data`.
    
    ```
    C:\Program Files (x86)\Steam\steamapps\common\Valheim\valheim_Data
    ```

2. **Locate `boot.config`**:
   - Go into the `valheim_Data` folder to locate the `boot.config` file. It'll be at the top of the directory listing.
  
  ![valheim_Data boot.config](https://github.com/ZeroOneZero/Performance-Mod-Guide-For-Valheim/blob/main/images/valheim_data-boot-config.png?raw=true)

3. **Edit `boot.config`:**
   - Now you can right click on it and edit the `boot.config` with your choice of [text editor](https://notepad-plus-plus.org/).
   - Press the `Enter` key to create a new line at the very top of the file.
   - Arrow up to the blank line and paste the following text at the top:

     ```
     gfx-enable-jobs=1
     gfx-enable-native-gfx-jobs=1
     ```

4. Finally you can save and close.

> [!IMPORTANT]
> Here is what your `boot.config` file should now look like:

![boot.config](https://github.com/ZeroOneZero/Performance-Mod-Guide-For-Valheim/blob/main/images/boot.config.png?raw=true)

## Force Display Parameters via Steam

> Borderless window mode is a maximized window without borders, allowing you to move the focus in and out of an application. It reflects the current desktop resolution. For example, if you are running 4K on your desktop, forcing borderless will continue using that resolution.

> Choosing Fullscreen over Borderless has the potential to boost performance, as it allows the application to take control and set the display's resolution. However, it's difficult to shift your focus in and out (e.g., using ```ALT``` + ```TAB``` ).

1. In your Steam Library, ```Right-Click``` on **Valheim** and go to **Properties**.

2. **Copy/Paste** the following into the **Launch Options** field.

```-window-mode exclusive``` or ```-window-mode borderless```

## High Priority Mode

> In this section, we’ll create a command shortcut that launches Valheim in High Priority mode via Steam.

### What is High Priority?

> In Windows, the operating system allocates the computer’s resources based on the priority of each application. \
A higher priority means more resources will be allocated to Valheim.

## Creating a Command Shortcut

1. In your Steam Library, ```Right-click``` on Valheim and go to ```Manage``` ---> ```Browse Local Files```.

2. Windows **Explorer** should have opened to the game's location.

3. If you cannot see ```valheim.exe```,  you must disable hiding known file type extensions.

4. The steps are a bit different depending on if you are running Windows 10 or 11. Follow along:

  - Windows 11:
    - Open File Explorer ( ```WIN``` + ```E``` )
    - Click on the three dots icon ( ```●●●``` ) at the top to open the **More options** menu.
    - Select **Options** to open the **Folder Options** dialog.
    - In the **Folder Options** dialog, go to the ```View``` tab.
    - Under **Advanced settings**, you'll find an option that says **Hide extensions for known file types**.
    - Disable this option.
    - Click **OK** to apply the changes.

  - Windows 10:
    - Open File Explorer.
    - Click on the **View** tab in the top menu (You may need to press the ALT key to show the top menu).
    - Under **Advanced settings**, you'll find an option that says **Hide extensions for known file types**.
    - Disable this option.
    - Click **OK** to apply the changes.

5. ```Right-click``` on **valheim.exe** and select **Create shortcut** then, rename the new shortcut simply to ```valheim```.

![Valheim Red Circle](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/valheim-shortcut.png?raw=true)

6. ```Right-click``` on the newly created, and renamed shortcut file, ```valheim```, choose **Properties**.

7. In the **Target field**, leave the original text intact and type the following before it making sure to leave a space between the two.

```
cmd /c start /high Valheim
```

![Shortcut Target](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/valheim-short.png?raw=true)

> The /c instructs the command prompt to close after executing our command.

8. Click ```OK``` when finished.

9. Back in the Valheim directory, hold down ```SHIFT``` + ```Right-click``` on the newly edited valheim shortcut.

10. Select **Copy as path**

11. Go back to Steam, open the Launch Options for Valheim, and paste our clipboard contents.

```
"C:\Program Files (x86)\Steam\steamapps\common\Valheim\valheim.lnk"
```

12. Press the spacebar then type: ```%command%```, after it.

13. If you were following along from the start, your Launch Options should look like this:

```
"C:\Program Files (x86)\Steam\steamapps\common\Valheim\valheim.lnk" %command% -window-mode exclusive -force-vulkan -console
```

![Launch Options](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/valheim-steam-launch-options.png?raw=true)

> [!NOTE]
> ```-force-vulkan``` and ```-console``` are optional. These are covered in more detail at the end of this README.

14. Valheim will now run using a High Base priority. This you can verify after launching the game by following these instructions: [How to Geek: Windows Task Manager](https://www.howtogeek.com/405806/windows-task-manager-the-complete-guide/).

![Task Manger](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/valheim-task-manager.png?raw=true)

## Force High Performance Power Option

> The following instructions will show you how to force the High Performance power mode using the Group Policy Editor.

**Note: Group Policy cannot be used on Windows 10 or 11 Home edition.**

1. Press ```Windows Key``` + ```R```, and type in gpedit.msc.

![Run Gui](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/run-dialog.png?raw=true)

2. Navigate to ```Local Computer Policy``` --> ```Computer Configuration``` --> ```Administrative Templates``` --> ```System``` --> ```Power Management```.

![Power Policy](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/power-policy.png?raw=true)

3. ```Double-click``` on **Select an active power plan** setting and change it as shown in the picture below: ```Enabled``` and ```High Performance```.

![Power Policy Setting](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/power-policy-setting.png?raw=true)

4. To verify in Windows 11, press ```Windows Key``` + ```R``` and type: ```control /name Microsoft.PowerOptions```. This will open the Power Options control panel directly. 

![Power Options Run Gui](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/power-options-run-gui.png?raw=true)

5. In the Additional power settings. You will see **High Performance**, with the option to change it greyed out.

6. This setting will now remain consistent even through Windows and driver updates.

# Additional Launch Options

> I use ```-force-vulkan```, and ```-window-mode borderless``` because I am always using ```ALT```+```Tab```.
> However, each user will experience different results; it is important to experiment and find out what works best. Below are a few other Launch Options:

| Launch Options                          | Description                                         |
|-----------------------------------------|-----------------------------------------------------|
| -screen-width (1920) -screen-height (1080)  | Override the default screen width and height        |
| -console                                | Enables the F5 console inside Valheim               |
| -window-mode (exclusive or borderless)  | Overrides the default screen width and height                |
| -popupwindow                            | A window without a frame.                           |
| -force-d3d9                             | Run a game using DirectX 9                          |
| -force-d3d11                            | Run a game using DirectX 11                         |
| -force-d3d12                            | Run a game using DirectX 12                         |
| -force-vulkan                           | Force use of Vulkan for rendering which can reduce the CPU bottleneck                         |

---

# Have you enjoyed my Performance Mod Guide for Valheim?

> If my guide has enhanced your gaming experience and you'd like to support my work, consider leaving a star on GitHub or reporting any issues you encounter. Every bit of feedback helps improve the guide for everyone!

---
