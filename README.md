[![GitHub issues](https://img.shields.io/github/issues/ZeroOneZero/Performance-Mod-Guide-For-Valheim?style=for-the-badge)](https://github.com/ZeroOneZero/Performance-Mod-Guide-For-Valheim/issues)
**Consider donating a $1 if my guide helped. I’ll use it to buy more coffee!**
[![GitHub stars](https://img.shields.io/github/stars/ZeroOneZero/Performance-Mod-Guide-For-Valheim?style=for-the-badge)](https://github.com/ZeroOneZero/Performance-Mod-Guide-For-Valheim/stargazers)
[![Donate with PayPal](https://raw.githubusercontent.com/stefan-niedermann/paypal-donate-button/master/paypal-donate-button.png)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=N86JXA77CARWE)

# Performance Mod Guide For Valheim

**I hope this guide finds all well! It’s not the fix all, end all problems guide, but it’s a start. I aim to preserve the veraciousness of this guide so if you notice any inconsistencies, open an issue through GitHub or [Contact Me](mailto:crazypants010@gmail.com). I welcome any aid.**

**I have outlined some simple and not so simple steps. I would suggest you read through this first so you know what you’re getting yourself into.**

**If you are the type looking for meaning, I recommend visiting [Rob’s Bible](https://github.com/ZeroOneZero/robs-bible).**

![Caution](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/image2.jpg?raw=true)

# Some Overlooked Things

- While in-game, pressing **F2** will display the FPS [Frames per Second].
- Updating Valheim will remove any changes to your **boot.config**, shown below.

# Increase Performance
## Modify boot.config

> *The file we will edit in this section enables the **GPU [Graphics Processing Unit]** to handle more tasks, reducing the load on the **CPU [Central Processing Unit]**.*

- In your Steam Library **Right-Click** on **Valheim** & go to **Manage--->Browse local files**.
- **Windows Explorer** should've opened to the games location. 
- Inside the **valheim_Data** directory is where we'll find our **boot.config**.

```sh
C:\Program Files (x86)\Steam\steamapps\common\Valheim\valheim_Data
```

- Locate and edit the **boot.config** file using either [Notepad](https://www.howtogeek.com/672710/why-notepad-is-still-awesome-for-taking-notes/) or [Notepad++](https://notepad-plus-plus.org/).

> *Personally I use [Notepad++](https://notepad-plus-plus.org/).*

![alt text](https://github.com/ZeroOneZero/Performance-Mod-Guide-For-Valheim/blob/main/images/boot.config.1.jpg?raw=true)
- Add the following two lines to the **top** of the file **leaving** the original text.

```sh
gfx-enable-jobs=1
gfx-enable-native-gfx-jobs=1
```

![alt text](https://github.com/ZeroOneZero/Performance-Mod-Guide-For-Valheim/blob/main/images/boot.config.2.jpg?raw=true)
- **Save and close** Notepad.

## Force Display Paramaters Via Steam

> *Up next we will look into forcing a display mode via the Steam launch settings.*

> Borderless is a maximized window without borders. Allowing you to move the focus in and out of an application. It reflects the current desktop resolution. If you are running 4K on your desktop, forcing borderless will continue using that resolution. 

> Choosing Fullscreen over Borderless has the potential to boost performance. It allows the application to take control and set the displays resolution. However, it's difficult to shift your focus in and out. (ALT-TAB)

- In your Steam Library **Right-Click** on **Valheim** & go to **Properties...**.

- **Copy/Paste** this into the **Launch Options** field.

```sh
-window-mode exclusive -screen-fullscreen
```

> This tells Steam the **Windowed Mode** we want to use is **Fullscreen**.

## High Priority Mode

> *In this section, we’ll make a command shortcut that launches Valheim in High Priority from Steam.*

### What is High Priority? 

> *In Windows, the operating system distributes the computer’s resources based on the priority of the application.* 

> *Higher priority means more resources will go to Valheim.*

### Navigate to the Valheim Directory.

- In your Steam Library **Right-Click** on **Valheim** & go to **Manage--->Browse local files**.

- **Windows Explorer** should've opened to the games location. 

- Locate the file **valheim.exe**

> *If you only see **valheim** and don’t see **valheim.exe**. Don't panic you just need to enable showing **[Hidden Items](https://support.microsoft.com/en-us/search?query=how%20to%20view%20hidden%20files%20in%20windows%2010#:~:text=Open%20File%20Explorer%20from%20the,folders%2C%20and%20drives%20and%20OK)**.

> *Look for **Application** in the **Type** column. **(Circled in red in the image below)**. It is a way to verify if it’s an **.exe**.*

- Right-Click on **valheim.exe**

- Select **Create shortcut** and rename it to **valheim**

![alt text](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/cs-1.jpg?raw=true)

## Create a Command Shortcut

- **Right-click** the valheim shortcut and choose **properties**

- In the **Target** field, leave the original text but type the following before it.

```sh
cmd /c start /high Valheim 
```

- Here is the full **Target** for your reference.

```sh
cmd /c start /high Valheim "C:\Program Files (x86)\Steam\steamapps\common\Valheim\valheim.exe"
```

> *The **/c** instructs the command prompt to close after executing our command.*

![alt text](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/cs-2.jpg?raw=true)

- Click **OK** when finished.

- Back at the Valheim directory, hold down the **SHIFT** key and **Right-Click** on the valheim shortcut

- Select **Copy as path**

- Open back up **Steam** and paste the clipboard contents into the **Valheim Launch Options**.

- After the **pasted contents**, (*which is the path to our shortcut*), type the following, making sure that there is a space between the two.

```sh
 %command% -window-mode exclusive -screen-fullscreen
```

- Here is the full **Launch Options** for your reference.
```sh

"C:\Program Files (x86)\Steam\steamapps\common\Valheim\valheim.lnk" %command% -window-mode exclusive -screen-fullscreen
```

![Launch Options](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/cs-3.jpg?raw=true)

> *Now after you run **Valheim**, you can verify that **valheim.exe** now has a **High** Base priority from the [Windows Task Manager](https://www.howtogeek.com/405806/windows-task-manager-the-complete-guide/).*

![Task Manager](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/cs-4.jpg?raw=true)

# Modding Valheim

> *Modding Valheim is fraught with danger! Be aware that updates may cause mods to load incorrectly and Valheim to crash.*
> *If your game isn't loading. **[Verify Files](https://support.steampowered.com/kb_article.php?ref=2037-QEUH-3335)** through Steam.*

## Preparing Files for Install
### BepInExPack Valheim

> *What is **BepInEx**? It is a general-purpose framework for Unity modding. Enabling plugins that use **.dll** files.*

- Go to [Link to BepInExPack Valheim](https://valheim.thunderstore.io/package/denikson/BepInExPack_Valheim/)
- Click **Manual Download** to download **BepInExPack Valheim**.

[![alt text][1]][2]

[1]:https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/BepInEx-1.jpg?raw=true
[2]:https://valheim.thunderstore.io/package/denikson/BepInExPack_Valheim/

### BuildShare & SlimVML
> *The plugin **BuildShare** allows for the importing and exporting of constructions in the **.vbuild** file format. *
> *However, **SlimVML Mod Loader** is required for it to function.*

- Create an account to download mods from **Nexus**. [Link to Nexus](https://www.nexusmods.com/)
- After **creating/logging** into your account click on this link to go to **BuildShare**. [Link to BuildShare](https://www.nexusmods.com/valheim/mods/5)
- To download click on **Manual--->** then at the **required mod pop-up** select **Download** lastly **--->Slow Download**

![Required Mod pop-up](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/Buildshare-1.jpg?raw=true)

- Go to [SlimVML Loader](https://valheim.thunderstore.io/package/BepInEx/SlimVML_Loader/)
- Click **Manual Download** to download BuildShares dependency **SlimVML Loader**.

[![alt text][1]][2]

[1]:https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/BepInEx-1.jpg?raw=true
[2]:https://valheim.thunderstore.io/package/BepInEx/SlimVML_Loader/

## Extracting and Copying Mod Files
- Open **Windows Explorer** and go to **Downloads**.

```sh
%USERPROFILE%\Downloads\
```

- Extract **denikson-BepInExPack_Valheim-x.x.xxxx.zip** file.
- Open **denikson-BepInExPack_Valheim-x.x.xxxx** folder and then **BepInExPack_Valheim**.
- Inside of **BepInExPack_Valheim**, **Copy--->** all the files and folders and **Paste--->** into the **Valheim** directory.

```sh
C:\Program Files (x86)\Steam\steamapps\common\Valheim
```

- Extract **BepInEx-SlimVML_Loader-x.x.x.zip** file.
- Open the **BepInEx-SlimVML_Loader-x.x.x** folder.
- Copy the **BepInEx** folder into the Valheim directory.

```sh
C:\Program Files (x86)\Steam\steamapps\common\Valheim
```
- Extract **BuildShare No Herobrine-x-x-x-xxxxxxxxxx.zip**
- Copy the **CR-BuildShare_VML.dll** into the **SlimVML** folder located at:

```sh
C:\Program Files (x86)\Steam\steamapps\common\Valheim\BepInEx\SlimVML
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

> *Choose one of my mods or search for other construction mods within Nexus.*

- Select a mod from the list.
- Click on **Manual**, to the right**
> *Sometimes a **Mod Required** *window will appear.*
- Click **Download--->Slow Download**
- Extract it and **Copy-->Paste** the **.vbuild** file to the Explorer window. Or to:

```sh
C:\Program Files (x86)\Steam\steamapps\common\Valheim\BuildShare\Builds
```

## Deploy the Construction Mod
- Find the **Drop-Down** and select the mod you copied.
- Select **Toggle** to see where the mod will go before you Build it.
- Once you’ve found a spot, click on **Build**

## Force High Performace Power Option

**The following will show you how to force the High Performance power mode using the Group Policy Editor.**

> *Cannot use group policy on Windows 10 Home*

- **Windows Key + R** and type in ``` gpedit.msc ```.

![Run Gui](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/k7aaffa9lmd61.webp?raw=true)

-	Select **Local Computer Policy --> Computer Configuration --> Administrative Templates --> System --> Power Management**
 
 ![Run Gui](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/mpovw2xblmd61.webp?raw=true)

- Double click on **Select an active power plan** setting and change it to match the picture below. **Enabled and High Performance**
 
![Run Gui](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/8sklkojdlmd61.webp?raw=true)

-	To verify, go to **Settings --> System --> Power & sleep --> Additional power settings** and the option should be greyed out.

![Run Gui](https://github.com/ZeroOneZero/Valheim-Modding-and-Performance/blob/main/images/dx240zyllmd61.webp?raw=true)

•	Now the setting will remain even through Windows and driver updates.

# Additional Launch Options
> *On my PC **-force-vulcan** makes it run worse. I run at 4k maxed following the steps in this guide. Experiment and figure out which one works best for your setup.*

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

> *Not using Steam Launch Options? Try this in the shortcuts **Target** field*
```sh
cmd /c start /high Valheim "C:\Program Files (x86)\Steam\steamapps\common\Valheim\valheim.exe" -window-mode exclusive -screen-fullscreen
```

# Edits - Sources - Thanks
*Thank [Reddit user RustyB3ans for the boot.config fixes](https://www.reddit.com/user/RustyB3ans/)*

*I combined two posts to make the auto high priority fix. Reddit user [1000AngryTrashBees](https://www.reddit.com/user/1000AngryTrashBees/) and Reddit user [DerBoeseWolf](https://www.reddit.com/user/DerBoeseWolf/)*

*Launch Options I paraphrased from the [Unity Guide](https://docs.unity3d.com/Manual/CommandLineArguments.html)*

*Here is my email if you wish to ask about something else.*



| Mods I Use |
| ---------- |
| BetterUI |
| Build Camera |
| BuildShare (AdvancedBuilding) |
| Craft Build Smelt Cook Fuel Pull From Containers |
| First person view |
| HD Valheim |
| Improved Build HUD |
| Item Stacks - Valheim BepInEx Plugin |
| Map Teleport |
| Nexus Update Check |
| Plant Everything |
| SkToolbox - Console Admin and Chat Functionality Extender |
| Smarter containers |
| Unrestricted Portals |
| Valheim - Interact While Building |
| Valheim Performance Optimizations |


Copyright [2022] [Robert Adams]
