# Various Fixes and Notes That Are Important
Don't know how to do this, but I'll put my findings here to share

# Modding
When using Vortex through SteamTinkerLaunch, modding is very easy (tested on Fallout 4, Fallout New Vegas, Tale of Two Wastelands, and Skyrim

Stardew Valley is best played through Proton (any version) and to get it working correctly with modding, download SMAPI manually and run the .bat file through wine. Vortex won't detect natvie games so you need a .exe in the game files. Use "Move deployment (Experimental!)" in the "Mods" tab of the settings. Make sure the staging folder is on the same drive

Payday 2 modding is easy through proton, just download https://znix.xyz/random/payday-2/SuperBLT/latest-wsock.php (or from here if you want the website https://superblt.znix.xyz/) and extract the dll into the root directory of the game (where the .exe is) and add WINEDLLOVERRIDES="wsock32"=n,b %command% to the launch options on steam.

Red Dead Redemption 2 can be modded with both Scripthook and LML, just install both of them and add WINEDLLOVERRIDES="dinput8,ScriptHookRDR2,lml=n,b" %command% as the steam launch options,this should activaste all the .ini files required for both to work, in my testing I can even just use vortex (from steamtinkerlaunch) to download scripthook mods and then lml mods manually. The two main mods that I can confirm work are Horse Controller Fix https://www.nexusmods.com/reddeadredemption2/mods/1347 and Seasons https://www.nexusmods.com/reddeadredemption2/mods/1557?tab=description 
(Scripthook) http://www.dev-c.com/rdr2/scripthookrdr2/ 
(LML) https://www.rdr2mods.com/downloads/rdr2/tools/76-lennys-mod-loader-rdr/ 

# Various Game Fixes
Hearts of Iron IV running on an optimus will give a black screen on the launcher, both on native and wine. Native uses OpenGL which seems to run terribly in my case, forcing it to use wine specifically 7.0.3. and using DirectX9 will fix the performance, but 5x speed will still be slow.
To get HOI4 running on OpenGL well you need to use "__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia %command%" as the launch options."

Alright I figured out how to get HOI4 to run natively. You need to put in the mentioned launch options, there are two things you can do.
1st Way: Whenever you need to use the launcher (to edit mods playtests and such) remove the first underscore _ from "__NV_PRIME_RENDER_OFFLOAD=1" that way it'll launch without giving a black screen. To launch the game add the underscore _ back and launch skipping the launcher from the preparing to launch.
2nd way: you need to go to ~/.paradoxlauncher/ and find the Paradox Launcher in both folders, then you need to add "--disable-gpu" to the last line in the executable, so it looks like "${SCRIPTPATH}"/Launcher --no-sandbox -disable-gpu "$@" and now you should be able to launch the game normally. 

If your on an Optimus System, you need to be in nvidia mode to play opengl games, as in my experience they all with forcibly run on the intel card and games like TF2 won't let you play online using the launch options. 

Red Dead Redemption 2: Running with gamemode surprisingly causes it to freeze every once in awhile, which you need to force quit the game to fix. 

# Endeavour OS/Arch
When installing Endeavour OS make sure to follow the post install guides, as if you're on Nvidia like me the first kernal update will break your install, make sure to install their nvidia-hook package (see here https://forum.endeavouros.com/t/newest-update-broke-install-most-likely-nvidia-drivers/27590)
# Qtile/Picom
Qtile can easily be installed next to really any desktop environment, and importing the profile from Endeavour OS is really simple
Make sure to enable vsync on picom via the autostart.conf. 

If your getting fps higher than what your screen should be getting after moving between workspaces in qtile, move the game over to it's own workspace and that should fix it.

Replace qtile and picom with their -git versions for more options and better compatibility

A really cool thing you can do with pacman is install packages via a .txt file generated via pacman -Qqe > installedpackages.txt (which can be used to import your previous installed packages) and can be installed via yay -S - < installedpackages.txt (the name doesn't matter it can be whatever). 
Q = query 
q = quiet/less information which just gives the package name without the version
e = explicitly installed, packages installed via yay -S package-name or pacman -S packagename 

Picom with Qtile will give you really bad performance, (tested on tf2 with a difference of ~30fps in main menu) 
This can be resolved by using Qtile as the Window Manager for XFCE4 and Picom as the compositor, for some reason adding xfce4 in the mix makes it perform well.
This can be set up very easily, as demonstrated here https://forum.endeavouros.com/t/tutorial-easy-setup-endeavour-xfce-i3-tiling-window-manager/13171
To get rid of the panel you need to do killall xfce4-panel before saving the session. There is no way to delete it otherwise. 
Instead of adding i3 to the autostart, simply add qtile instead with the command being 'qtile start'
Add picom as a startup app in XFCE, NOT in ~/.config/qtile/autostart.sh

# How to make GTK and QT Apps Consistent w/ Any Theme
I couldn't find a single comprehensive guide out there that I could find on getting KDE (QT) apps to work on any other desktop environment other than KDE (wihout either mismatched dark and light themes or horrible tearing in apps). IT IS VERY POSSIBLE, but you need to install a lot of dependencies.

Install
qt5ct-kde
qt6ct
kvantum-git
dolphin
kate
konsole
breeze
  
yay -S --needed qt5ct-kde qt6ct kvantum-git dolphin kate konsole breeze
(should work)

First you should add a color scheme you want to $HOME/.local/share/color-schemes/ and /usr/local/share/color-schemes/, for me that was https://github.com/vinceliuice/Qogir-kde 
Open up qt5ct-kde and 
Go to fonts and set 
General: Noto Sans (Regular) 10 
Fixed width: Monospace (Regular) 10
DO NOT create a fonts.conf. 
Set the icon theme to a dark variant, unless your insane and like light themes. Do this for both root and user qt5ct and qt6ct.
QT_QPA_PLATFORMTHEME-qt5ct
Now you should have a consistent dark theme for every app you use, including configuration settings (right click > configure dolphin). I'll attach my qt5ct and qt6ct config files, dependencies are qogir-kde-theme-git or the manually add the color scheme to /usr/local/share/color-schemes/ and papirus-icon-theme

![image](https://user-images.githubusercontent.com/64805993/180672311-2896ab52-3047-439e-9df7-978b630f23d7.png)
Proof

# Inconsistent Cursor Theme
So there's a ton of solutions, but the one that I've found is editing your ~/.config/gtk-3.0/settings.ini and ~/.config/gtk-4.0/settings.ini and change it to the theme you want. You can find what the names are with (thank you arch wiki) find /usr/share/icons ~/.local/share/icons ~/.icons -type d -name "cursors" command. If that doesn't work, then you need to edit your ~/.Xresources file and put the icon theme in there, which I've had to do every single time I install endeavour os plasma 

# Legacy Macbooks running OracleVM
I tested Pop_OS! on an old macbook to let someone try linux, but it wouldn't load, using elementary OS was the solution, specifcally using a Linux Ubuntu 64x settings, and enab,ing efi mode in the vm settings. I'm very new to VM's but I need to put this somewhere so I remember. If anyone has any experience with VM's and/or Elementary OS I'd be happy to hear about it. 

# Optimus Manager Can't Switch Modes
So for whatever reason Optimus Manager will probably stop working for you like it has for me about... 5 times ish. Other than just a reset of config files, one issue I was having was with Endeavour OS's sddm settings (I think), the fix is this https://github.com/Askannz/optimus-manager/issues/356#issuecomment-1100828176
You need to commend out both lines that start with Display in /etc/sddm.conf pretty easy fix. 

#Your system is screwed up and you can't get into a desktop environment and need to debug
Use Qtile. In the repo I've put my list of packages I use for qtile plus my config. Should get everything you need. I've never had qtile break on me. Perfect window manager to test if an issue is desktop environment related or system related. 
