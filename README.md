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

- To see your in-game FPS [Frames per Second] press **F2**.
- Updates to the game will remove the changes to the boot.config below.

# Increase Performance
## Modify boot.config

> *The file we will edit in this section enables the **GPU [Graphics Processing Unit]** to handle more tasks, reducing the load on the **CPU [Central Processing Unit]**.*

- In your Steam Library **Right-Click** on **Valheim** & go to **Manage--->Browse local files**
- A **Windows Explorer** window should open. 
- Go into the **valheim_Data** directory.

```sh
C:\Program Files (x86)\Steam\steamapps\common\Valheim\valheim_Data
```

- Find and edit the **boot.config** file using [Notepad](https://www.howtogeek.com/672710/why-notepad-is-still-awesome-for-taking-notes/) or [Notepad++](https://notepad-plus-plus.org/).

![alt text](https://github.com/ZeroOneZero/Performance-Mod-Guide-For-Valheim/blob/main/images/boot.config.1.jpg?raw=true)
- Add the following two lines to the **top** of the file **leaving** the original text.

```sh
gfx-enable-jobs=1
gfx-enable-native-gfx-jobs=1
```

![alt text](https://github.com/ZeroOneZero/Performance-Mod-Guide-For-Valheim/blob/main/images/boot.config.2.jpg?raw=true)
- **Save and close** Notepad.

## Force Display Paramaters Via Steam

- **A setting that can cause mixed performance is the fullscreen or borderless window mode.**

> Borderless is a maximized window without borders. Allowing you to move the focus in and out of an application. It reflects the current desktop resolution. If you are running 4K on your desktop, having borderless set for a program will continue with that resolution. 

> Choosing Fullscreen over Borderless has the potential to boost performance. It allows the application to take control of the display and set a separate resolution. However, it's difficult to shift your focus in and out.

- Find Valhiem in your Steam Libary, then **Right Click** -> **Properties...**.

- **Copy/Paste** this into the **Launch Options** field.

```sh
-window-mode exclusive -screen-fullscreen
```

> This tells Steam the **Windowed Mode** will allow the application to use **Fullscreen** exclusivly.

## High Priority Mode

**In this section, we’ll make a command shortcut that launches Valheim in High Priority from Steam.**

### What is High Priority? 

> *In Windows, the operating system distributes the computer’s resources based on the priority of the application.* 

> *Higher priority means more resources will go to Valheim.*

### Navigate to the Valheim Directory.

- In your Steam Library Right-Click on Valheim & go to **Manage--->Browse local files**.

- The **Windows Explorer** window should open to the Valheim directory.

- Locate the file **valheim.exe**

> *Don’t see **valheim.exe** but see **valheim**? **Hidden Items** aren’t being displayed.*

> *Look for **Application** in the **Type** column. **(Circled in red in the image below)** That is where you can verify if it’s an **.exe**.*

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
I've read on Reddit people stating 'changing the Windows 10 Power Options from Balanced to High Performance has no effect on the actual performance due to Datacenter Managing it' ... blah blah blah.
However, if you are like me and just feel some sort of way about not being able to keep the Power Option Setting on High Performance then this guide is for you. Call it a "Pet Peeve" if you will. I have a semi-simple option that probably won't work for everyone but it has been successful for me.
I became a part of the Shadow family starting with Boost on 2020-02-28. Now I'm living life Infinitely better.
Shadow Website Subscriptions Page
Now the family can sit down and get to work. My procedure to get the High Performance Setting to stick even through reboots and shutdowns.
Prerequisites:
So, if you are reading this then I will assume that you or someone you know is having the same issue I ran into many months ago. That is no matter what I couldn't stop Windows 10 from reverting to the Balanced Power Setting. I tried custom plans, fake programs you name it.
My hypothesis was if I only had the group policy editor then I could lock the Power Setting. I'm sure you realize by now that no matter if you are Boost, Ultra or Infinite the Windows OS Edition is the same. Basically Windows 10 Home. No matter what you read online you won't find a way to add a functional group policy to a Home version of Windows 10.
First Option:
- If you have a PC that has a legit version of Windows 7, 8 or 10 then all you have to do is set up your Microsoft Account on that PC. Windows will sync the digital licence for Windows 10 Pro... providing you have the Pro version of 7, 8 or 10.
- After you completed the aforementioned step. Log on to your Shadow PC using the same Microsoft Account.
- Then go to 'Settings --> Update & Security --> Activation --> Go to Store'
Windows 10 Settings Activation GUI
- That link will open the Windows Store. Where provided you logged in with the right Windows Account and everything synced hunky dory you'll see the 'Install' box.
Second Option:
- If you have the original 7, 8 or 10 Pro product key you could simply enter it in the Activation window. Instead of selecting 'Go to Store' select 'Change product key.'.
Continuing Steps No Matter Option:
- For me, it started to install then stated it failed. Well, after you reboot check your Activation page and you should see Windows 10 Pro.
Windows 10 Settings Activation GUI
- Let's Test it by opening Group Policy. 'Windows Key + R' and type in 'gpedit.msc'.
Windows 10 Run GUI
- Select 'Local Computer Policy --> Computer Configuration --> Administrative Templates --> System --> Power Management'
Windows 10 Group Policy GUI
- Double click on 'Select an active power plan' setting and change it to match the picture below. (Enabled and High Performance)
Windows 10 Group Policy Power Management GUI
- You should reboot your Shadow PC now. When it has come back log in then go to 'Settings --> System --> Power & sleep --> Additional power settings'
Windows 10 Power & Sleep Settings
- If everything worked as I know it should you will no longer be able to change the Preferred Plans in this window and thus thwarting Shadow PC being able to reset the setting.
Windows 10 Control Panel Power Options
Like I stated in the beginning of this post I did this not because I know it will make the Shadow PC faster just for my own personal vindication. The placebo has its effect.
Comment below if this helped you. Or if you want to hate feel free there is all the room on the internet.
Not a member of the Shadow PC family? You can feel free to use my Referral Code ROBMVGHE last I had heard you get $10 off and so will I.

I like pictures, I hope you do too!
