**If you like this guide consider buying me a coffee.**

[![Support me on Patreon](https://img.shields.io/endpoint.svg?url=https%3A%2F%2Fshieldsio-patreon.vercel.app%2Fapi%3Fusername%3DRobThePCGuy%26type%3Dpatrons&style=for-the-badge)](https://patreon.com/RobThePCGuy)

# Performance Mod Guide For Valheim
*I have compiled the techniques listed below from a variety of online sources into a single document for your reading pleasure. A how-to-guide for editing Valheim and Windows files.*

**If this induces apprehension, then I recommend going back to watching Puppy Dog Pals.**

![alt text](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/image2.jpg?raw=true)

# Increase Performance
## High Priority Mode
*In this section, we’ll make a command shortcut that launches Valheim in High Priority from Steam.*

**What is High Priority?** 
*In Windows, the operating system distributes the computer’s resources based on the priority of the application.* **Higher priority means more resources will go to Valheim.**
### Navigate to the Valheim Directory.
```sh
C:\Program Files (x86)\Steam\steamapps\common\Valheim
```
- Right-Click on **valheim.exe**

*If you don't see **valheim.exe** but do see **valheim**, it means that **Hidden Items** aren't being displayed. Look for Application in the column next to it; this is where we'll find our.exe.*

- Select **Create shortcut** and rename it to **valheim**

![alt text](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/shortcut1.JPG?raw=true)

### Create a Command Shortcut
- **Right-click** the valheim shortcut and choose **properties**
- Click in the **Target** field. Use the arrow keys to move the cursor to the start.
- Leave the original text alone, but type the following before it.

```sh
cmd.exe /c start “Valheim” /high 
```
- Here is the full **Target** for your reference.
```sh
cmd.exe /c start "Valheim" /high "C:\Program Files (x86)\Steam\steamapps\common\Valheim\valheim.exe"
```
![alt text](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/shortcut2.JPG?raw=true)

- Click **OK** when finished.
- **SHIFT+Right-Click** on the valheim shortcut
- Select **Copy as path**
- Open Steam and paste the clipboard contents into the Valheim Launch Options.
- Leave the original text typing the following after it.
```sh
 %command% -window-mode exclusive -screen-fullscreen
```
- Here is the full **Launch Options** for your reference.
```sh
"C:\Program Files (x86)\Steam\steamapps\common\Valheim\valheim.lnk" %command% -window-mode exclusive -screen-fullscreen
```
![alt text](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/shortcut3.JPG?raw=true)

![alt text](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/shortcut4.JPG?raw=true)

## Modify boot.config
*Enables the* **GPU [Graphics Processing Unit]** *to take on more jobs lightening the load on the* **CPU [Central Processing Unit]**
- Open Steam, **Right-Click** on Valheim, go to **Manage--->Browse local files**
- Explorer should have opened. Go into the **valheim_Data** directory.
```sh
C:\Program Files (x86)\Steam\steamapps\common\Valheim\valheim_Data
```
- Find and edit the **boot.config** file using Notepad or Notepad++
- Add the following three lines to the **top** of the file leaving the original text.
```sh
gfx-enable-gfx-jobs=1
gfx-enable-native-gfx-jobs=1
scripting-runtime-version=latest
```
- Save and close Notepad.
# Modding Valheim
*Modding Valheim is fraught with danger. Be aware that updates may cause mods to load incorrectly and Valheim to crash. If your game isn't loading. Rename the Valheim directory to **Valheim.bak** and run Steam's File Verification.*
## Preparing Files for Install
### BepInEx for Valheim
- Go to [Link to BepInEx](https://valheim.thunderstore.io/package/denikson/BepInExPack_Valheim/)
- Click **Manual Download** to download BepInExPack for Valheim.
### Download BuildShare
- Register or login to [Nexus](https://users.nexusmods.com/auth/sign_in)
- Now go to the [BuildShare](https://www.nexusmods.com/valheim/mods/5)
- Select **Manual--->** *(Required Mod pop-up)* **--->Download--->Slow Download**
### Download BepInEx SlimVML Loader
- Go to [GitHub](https://github.com/BepInEx/BepInEx.SlimVML.Loader/releases/latest)
- Under **assets** click on **SlimVML.Loader.dll**
## Extracting and Copying Mod Files
- Open Explorer and go to Downloads.
```sh
%USERPROFILE%\Downloads\
```
- Extract **denikson-BepInExPack** zip file.
- Open the **BepInExPack_Valheim** folder.
- Select All the files/folders.
- **Copy--->Paste** them into the Valheim directory.
- Find **SlimVML.Loader.dll** in Downloads and **Copy--->Paste** into:
```sh
C:\Program Files (x86)\Steam\steamapps\common\Valheim\BepInEx\patchers
```
- Copy **CR-BuildShare_VML.dll** into the Mods directory. **Create the folders if needed.**
```sh
C:\Program Files (x86)\Steam\steamapps\common\Valheim\InSlimVML\Mods
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
- In Valheim, select the **Builds** menu within **BuildShare**
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
| -force-d3d9 | Run a game using DirectX 9 | Not sure. Need testers. |

*Not using Steam Launch Options? Try this in the Target*
```sh
cmd.exe /c start “Valheim” /high C:\Program Files (x86)\Steam\steamapps\common\Valheim\valheim.exe" -window-mode exclusive -screen-fullscreen
```
# Edits - Sources - Thanks
*Thank [Reddit user RustyB3ans for the boot.config fixes](https://www.reddit.com/user/RustyB3ans/)*

*I combined two posts to make the auto high priority fix. Reddit user [1000AngryTrashBees](https://www.reddit.com/user/1000AngryTrashBees/) and Reddit user [DerBoeseWolf](https://www.reddit.com/user/DerBoeseWolf/)*

*Launch Options I paraphrased from the [Unity Guide](https://docs.unity3d.com/Manual/CommandLineArguments.html)*

*Here is my email if you wish to ask about something else.*

[rob@zero-one-zero.com](mailto:rob@zero-one-zero.com)

| Mods I Use |
| ---------- |
| RememberIPDamnit |
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

| Texture Pack |
| ------------ |
| Badgers 2k Re-Texture |
