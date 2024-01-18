# Performance Mod Guide for Valheim:

--- 

>  This guide aims to be a one-stop shop for Valheim's performance-related issues and fixes. However, please be aware that, things change, so if you see something that needs updating or fixing, let me know. I'm always open to new ideas and will keep this guide fresh as long as it's useful. Got questions or suggestions? Feel free to reach out.

> You'll find the guide broken down into sections. You don't have to go through all of them; just pick what works for you. Whenever I come back to it after a break, I like to start from the top and do the whole thing. There's a mix of easy and tough steps here, so it's a good idea to read through the whole thing first to know what you're getting into.

---

![Viking](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/valheim-pic.png?raw=true)

---

## A Couple Things to Note:

> While in-game, pressing ```F2``` will display a GUI with some additional information, like FPS [Frames per Second].

> Updating Valheim will remove the modifications we perform below on the **boot.config** file.

---

# Increase Performance

## Modify boot.config

> The first file to edit enables the GPU [Graphics Processing Unit] to handle more tasks, thereby reducing the load on the CPU [Central Processing Unit]

1. In your Steam Library, **Right-Click**, on **Valheim** and go to ```Manage```--->```Browse Local Files```.

2. Windows **Explorer** should have opened to the location of Valheim.

3. Inside the **valheim_Data** directory, you will find the ```boot.config``` file.

```
C:\Program Files (x86)\Steam\steamapps\common\Valheim\valheim_Data
```

![valheim_Data boot.config](https://github.com/ZeroOneZero/Performance-Mod-Guide-For-Valheim/blob/main/images/valheim_data-boot-config.png?raw=true)

4. Open the `boot.config` file in a text editor of your choice. This could be Notepad on Windows, TextEdit on macOS, or any other text editor that you prefer.

> Personally, I use [Notepad++](https://notepad-plus-plus.org/).

5. Once the file is open, press enter (to create a new line) and move the cursor to the very beginning of the text; top line.

6. Type or copy and paste the following lines at the top of the file:

```
gfx-enable-jobs=1
gfx-enable-native-gfx-jobs=1
```

7. Save the changes to the `boot.config` file, then close the text editor.

> Your `boot.config` file should now look something like this:

```
gfx-enable-jobs=1
gfx-enable-native-gfx-jobs=1
wait-for-native-debugger=0
hdr-display-enabled=0
gc-max-time-slice=3
build-guid=xxx
```

## Force Display Paramaters Via Steam

> Borderless window mode is a maximized window without borders, allowing you to move the focus in and out of an application. It reflects the current desktop resolution. For example, if you are running 4K on your desktop, forcing borderless will continue using that resolution.

> Choosing Fullscreen over Borderless has the potential to boost performance, as it allows the application to take control and set the display's resolution. However, it's difficult to shift your focus in and out (e.g., using ALT-TAB).

1. In your Steam Library, right-click on **Valheim** and go to **Properties**.

2. **Copy/Paste** the following into the **Launch Options** field.

```
-window-mode exclusive -screen-fullscreen
```

> This tells Steam the **Windowed Mode** we want to use is an **Exclusive Fullscreen**.

## High Priority Mode

> In this section, we’ll create a command shortcut that launches Valheim in High Priority mode via Steam.

### What is High Priority?

> In Windows, the operating system allocates the computer’s resources based on the priority of each application. \
A higher priority means more resources will be allocated to Valheim.

## Creating a Command Shortcut

1. In your Steam Library, right-click on Valheim and go to ```Manage``` ---> ```Browse Local Files```.

2. Windows **Explorer** should have opened to the game's location.

3. If you cannot see ```valheim.exe```, then must enable the showing of known extension types.

4. The steps are a bit different depending on if you are running Windows 10 or 11. Follow along:
  a. Windows 11:

```
1. Open File Explorer (WIN+E)
2. Click on the three dots icon (●●●) at the top to open the 'More options' menu.
3. Select 'Options' to open the Folder Options dialog.
4. In the Folder Options dialog, go to the 'View' tab.
5. Under 'Advanced settings', you'll find an option that says 'Hidden files and folders'.
6. Select 'Show hidden files, folders, and drives'.
7. Click 'OK' to apply the changes.
```

  b. Windows 10:

```
1. Open File Explorer.
2. Click on the 'View' tab in the top menu.
3. In the 'Show' section, there's a checkbox for 'Hidden items'. Check this box to show hidden files, folders, and drives.
```

5. **Right-click** ```valheim.exe```, select **Create shortcut**, and rename the new shortcut simply to ```valheim```.

![Valheim Red Circle](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/valheim-shortcut.png?raw=true)

6. **Right-click** on the newly created, and renamed shortcut file, ```valheim```, choose **Properties**.

7. In the **Target field**, leave the original text intact and type the following before it making sure to leave a space between the two.

```
cmd /c start /high Valheim
```

![Shortcut Targer](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/valheim-short.png?raw=true)

> The /c instructs the command prompt to close after executing our command.

8. Click ```OK``` when finished.

9. Back in the Valheim directory, hold down ```SHIFT``` + ```Right-click``` on the newly edited valheim shortcut.

10. Select **Copy as path**

11. Go back to Steam, open the Launch Options for Valheim, and paste our clipboard contents.

```
"C:\Program Files (x86)\Steam\steamapps\common\Valheim\valheim.lnk"
```

12. Press the spacebar then type: ```%command%```, after it.

13. If you were following along since the start your Launch Options should look like this:

```
"C:\Program Files (x86)\Steam\steamapps\common\Valheim\valheim.lnk" %command% -window-mode exclusive -screen-fullscreen -force-vulkan -console
```

![Task Manger](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/valheim-task-manager.png?raw=true)

> **Note:** ```-force-vulkan``` and ```-console``` are optional. These are covered in more detail at the end of this README.

![Launch Options](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/valheim-steam-launch-options.png?raw=true)

> Valheim will now run using a High Base priority. This you can verify after launching the game by following these instructions: [How to Geek: Windows Task Manager](https://www.howtogeek.com/405806/windows-task-manager-the-complete-guide/).

## Force High Performance Power Option

> The following instructions will show you how to force the High Performance power mode using the Group Policy Editor.

**Note: Group Policy cannot be used on Windows 10 or 11 Home edition.**

1. Press Windows Key + R and type in gpedit.msc.

![Run Gui](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/run-dialog.png?raw=true)

2. Navigate to Local Computer Policy --> Computer Configuration --> Administrative Templates --> System --> Power Management.

![Power Policy](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/power-policy.png?raw=true)

3. Double-click on Select an active power plan setting and change it as shown in the picture below: Enabled and High Performance.
![Power Policy Setting](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/power-policy-setting.png?raw=true)

4. To verify in Windows 11, press ```Windows Key + R``` and type: ```control /name Microsoft.PowerOptions```. This will open the Power Options control panel directly. 

![Power Options Run Gui](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/power-options-run-gui.png?raw=true)

5. In the Additional power settings. You will see, High Performance with the option to change it greyed out.

> This setting will now remain consistent even through Windows and driver updates.

# Additional Launch Options

> I use ```-force-vulkan```, and allow the game to control the **window mode** via ```-window-mode exclusive```. \
However, each user will experience different results; it is important to experiment and find out what works best. Below are a few other Launch Options:

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

> From the command prompt or by creating a Windows shortcut, the following command should achieve the same result without the need for Steam.

```
cmd /c start /high Valheim "C:\Program Files (x86)\Steam\steamapps\common\Valheim\valheim.exe" -window-mode exclusive -screen-fullscreen -force-vulkan -console
```

---

# Have you enjoyed my Performance Mod Guide for Valheim?

> If my guide has enhanced your gaming experience and you'd like to support my work, consider leaving a star on GitHub or reporting any issues you encounter. Every bit of feedback helps improve the guide for everyone!

---
