### If you enjoyed this guide, consider buying me a $1 coffee!

[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg?style=for-the-badge&logo=appveyor)](https://paypal.me/robthepcguy)

# Performance Mod Guide For Valheim

**You are about to embark on the modding journey of a lifetime. Surely recommending you to read through the guide first before attempting it is going to fall on deaf ears. Nonetheless, I recommended it.**

**I hope this guide finds all well. It isn’t the fix all, end all problems guide, but it’s a start. Please, if you have any suggestions, hit me up at crazypants010@gmail.com.**

**If you are the type looking for meaning, I recommend visiting [Rob’s Bible](https://github.com/ZeroOneZero/robs-bible).**

![Caution](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/image2.jpg?raw=true)

# Increase Performance
## High Priority Mode
**In this section, we’ll make a command shortcut that launches Valheim in High Priority from Steam.**

> **What is High Priority?** 
> *In Windows, the operating system distributes the computer’s resources based on the priority of the application.* 
> **Higher priority means more resources will go to Valheim.**

### Navigate to the Valheim Directory.
```sh
C:\Program Files (x86)\Steam\steamapps\common\Valheim
```
- Right-Click on **valheim.exe**

> *If you don't see **valheim.exe** but do see **valheim**, it means that **Hidden Items** aren't being displayed. 
> Look for **Application** in the **Type** column two colums over; this is where you can verify if it's an **.exe**.*

- Select **Create shortcut** and rename it to **valheim**

![alt text](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/cs-1.jpg?raw=true)

## Create a Command Shortcut
- **Right-click** the valheim shortcut and choose **properties**
- Click in the **Target** field and arrow over to the beginning.
- Leave the original text alone, but type the following before it.

```sh
cmd.exe /c start Valheim /high 
```
- Here is the full **Target** for your reference.
```sh
cmd.exe /c start Valheim /high "C:\Program Files (x86)\Steam\steamapps\common\Valheim\valheim.exe"
```

> The **/c** instructs the command prompt to close after executing our command.

![alt text](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/cs-2.jpg?raw=true)

- Click **OK** when finished.
- **SHIFT+Right-Click** on the valheim shortcut
- Select **Copy as path**
- In Steam, paste the clipboard contents into the **Valheim Launch Options**.
- After our path enter in a space followed by the following.

```sh
 %command% -window-mode exclusive
```
- Here is the full **Launch Options** for your reference.
```sh
"C:\Program Files (x86)\Steam\steamapps\common\Valheim\valheim.lnk" %command% -window-mode exclusive
```
![Launch Options](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/cs-3.jpg?raw=true)

![Task Manager](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/cs-4.jpg?raw=true)

> After launch you can verify that **valheim.exe** now has a **High** Base priority from [Windows Task Manager](https://www.howtogeek.com/405806/windows-task-manager-the-complete-guide/).

## Modify boot.config

> The file we will edit in this section enables the **GPU [Graphics Processing Unit]** to handle more tasks, reducing the load on the **CPU [Central Processing Unit]**.

- In your Steam Library **Right-Click** on Valheim & go to **Manage--->Browse local files**
- A Explorer window should open. 
- Go into the **valheim_Data** directory.
```sh
C:\Program Files (x86)\Steam\steamapps\common\Valheim\valheim_Data
```
- Find and edit the **boot.config** file using [Notepad](https://www.howtogeek.com/672710/why-notepad-is-still-awesome-for-taking-notes/) or [Notepad++](https://notepad-plus-plus.org/).

![alt text](https://github.com/ZeroOneZero/Performance-Mod-Guide-For-Valheim/blob/main/images/boot.config.1.jpg?raw=true)
- Add the following two lines to the **top** of the file leaving the original text.
```sh
gfx-enable-jobs=1
gfx-enable-native-gfx-jobs=1
```
![alt text](https://github.com/ZeroOneZero/Performance-Mod-Guide-For-Valheim/blob/main/images/boot.config.2.jpg?raw=true)
- Save and close Notepad.

# Modding Valheim

> Modding Valheim is fraught with danger! Be aware that updates may cause mods to load incorrectly and Valheim to crash.
> If your game isn't loading. Rename the Valheim directory to **Valheim.bak** and [Verify Files](https://support.steampowered.com/kb_article.php?ref=2037-QEUH-3335) through Steam.

## Preparing Files for Install
### BepInExPack Valheim

> BepInExPack is a general-purpose framework for Unity modding. Enabling plugins that use **.dll** files.

- Go to [Link to BepInExPack Valheim](https://valheim.thunderstore.io/package/denikson/BepInExPack_Valheim/)
- Click **Manual Download** to download BepInExPack Valheim.

[![alt text][1]][2]

[1]:  https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/BepInEx-1.jpg?raw=true
[2]:  https://valheim.thunderstore.io/package/denikson/BepInExPack_Valheim/ "Redirect to homepage"

### BuildShare & SlimVML

> Allows for the saving and loading of constructions in the new **.vbuild** file format. 
> SlimVML Mod Loader lets BuildShare function within the BepInEx Mod Framework.

- Go to [SlimVML Loader](https://valheim.thunderstore.io/package/BepInEx/SlimVML_Loader/)
- Click **Manual Download** to download SlimVML Loader which has BuildShare & SlimVML in one zip.

[![alt text][1]][2]

[1]:  https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/BepInEx-1.jpg?raw=true
[2]:  https://valheim.thunderstore.io/package/BepInEx/SlimVML_Loader/ "Redirect to homepage"

## Extracting and Copying Mod Files
- Open Explorer and go to Downloads.
```sh
%USERPROFILE%\Downloads\
```
- Extract **denikson-BepInExPack_Valheim-x.x.xxxx.zip** file.
- Open the **denikson-BepInExPack_Valheim-x.x.xxxx** folder.
- Select All the files/folders.
- **Copy--->Paste** them into the Valheim directory.
```sh
C:\Program Files (x86)\Steam\steamapps\common\Valheim
```
- Extract **BepInEx-SlimVML_Loader-x.x.x.zip** file.
- Open the **BepInEx-SlimVML_Loader-x.x.x** folder.
- Select All the files/folders.
- **Copy--->Paste** them into the Valheim directory.
- Replace All Files when prompted.
```sh
C:\Program Files (x86)\Steam\steamapps\common\Valheim
```

## Using BuildShare
### Run Valheim & Load a World
- Once loaded up, you’ll see a **BuildShare** button to the left. Click on it and the menu will appear.
- Select **Build--->Get Builds**
- An Explorer window and Web Page should appear. If not, minimize or close Valhiem, then you should see them.
### Download Mods from Nexus
- The [webpage](https://www.nexusmods.com/valheim/mods/categories/10/) that opened will have a search bar at the top.
- Enter my username [RobsDAPCGuy](https://www.nexusmods.com/valheim/users/70149208?tab%3Duser%2Bfiles=&tab=user+files)
- Then change the category from **Mods to Users** and click **Search**

*Choose my mods or search for other construction mods within Nexus.*
- Select a mod from the list.
- Click on **Manual to the right**
*Sometimes a* **Mod Requires** *window will appear.*
- Click **Download--->Slow Download**
- Extract it and **Copy-->Paste** the .vbuild file to the Explorer window. Or to:
```sh
C:\Program Files (x86)\Steam\steamapps\common\Valheim\BuildShare\Builds
```
## Deploy the Construction Mod
- Find the **Drop-Down** and select the mod you copied.
- Select **Toggle** to see where the mod will go before you Build it.
- Once you’ve found a spot, click on **Build**
# Additional Launch Options
*I run a Shadow PC, for me -force-vulcan makes it run worse. I run at 4k maxed following the steps in this guide. Experiment and figure out which one works best for your setup.*
| Launch Options | Description | Usefulness |
| -------------- | ----------- | ---------- |
| -malloc=system | Allows the OS to decide the amount of RAM to use. | Not sure. Need testers. |
| -USEALLAVAILABLECORES | Uses all CPU cores to achieve better performance | An Unreal Engine parameter No effect on Unity games |
| -force-vulkan | Force use of Vulkan for rendering. | Useful for older cards |
| -screen-width 1920 -screen-height 1080 | Override the default screen width and height | Yes |
| -console | Enables the F5 console inside Valheim | Yes |
| -window-mode (exclusive or borderless) | Overrides full-screen windowing mode | Yes |
| -popupwindow | A window without a frame. | No |
| -force-d3d9 | Run a game using DirectX 9 | Not sure. Need testers. |"

*Not using Steam Launch Options? Try this in the Target*
```sh
cmd.exe /c start Valheim /high "C:\Program Files (x86)\Steam\steamapps\common\Valheim\valheim.exe" -window-mode exclusive
```
# Edits - Sources - Thanks
*Thank [Reddit user RustyB3ans for the boot.config fixes](https://www.reddit.com/user/RustyB3ans/)*

*I combined two posts to make the auto high priority fix. Reddit user [1000AngryTrashBees](https://www.reddit.com/user/1000AngryTrashBees/) and Reddit user [DerBoeseWolf](https://www.reddit.com/user/DerBoeseWolf/)*

*Launch Options I paraphrased from the [Unity Guide](https://docs.unity3d.com/Manual/CommandLineArguments.html)*

*Here is my email if you wish to ask about something else.*

[crazypants010@gmail.com](mailto:crazypants010@gmail.com)

| Mods I Use |
| ---------- |
| Custom Graphics Settings |
| BetterUI |
| SkToolbox |
| Build Camera |
| First person view |
| No lens dirt |
| Unrestricted Portals |
| Nexus Update Check |
| BuildShare (AdvancedBuilding)|
| InSlimVML - Valheim Mod Loader |
| Item Stacks |
| Map Teleport |
| Valheim - Interact While Building |
| More Slots |
| Improved Build HUD |
| Faster Teleportation |
