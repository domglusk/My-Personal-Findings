# Various Fixes and Notes That Are Important
Don't know how to do this, but I'll put my findings here to share

# Modding
When using Vortex through SteamTinkerLaunch, modding is very easy (tested on Fallout 4, Fallout New Vegas, Tale of Two Wastelands, and Skyrim

Stardew Valley is best played through Proton (any version) and to get it working correctly with modding, download SMAPI manually and run the .bat file through wine. Vortex won't detect natvie games so you need a .exe in the game files. Use "Move deployment (Experimental!)" in the "Mods" tab of the settings. Make sure the staging folder is on the same drive

Payday 2 modding is easy through proton, just download https://znix.xyz/random/payday-2/SuperBLT/latest-wsock.php (or from here if you want the website https://superblt.znix.xyz/) and extract the dll into the root directory of the game (where the .exe is) and add WINEDLLOVERRIDES="wsock32"=n,b %command% to the launch options on steam.

# Various Game Fixes
Hearts of Iron IV running on an optimus will give a black screen on the launcher, both on native and wine. Native uses OpenGL which seems to run terribly in my case, forcing it to use wine specifically 7.0.3. and using DirectX9 will fix the performance, but 5x speed will still be slow.
To get HOI4 running on OpenGL well you need to use "__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia %command%" as the launch options. Haven't tested native but will soon.

Alright I figured out how to get HOI4 to run natively. You need to put in the mentioned launch options, there are two things you can do.
1st Way: Whenever you need to use the launcher (to edit mods playtests and such) remove the first underscore _ from "__NV_PRIME_RENDER_OFFLOAD=1" that way it'll launch without giving a black screen. To launch the game add the underscore _ back and launch skipping the launcher from the preparing to launch.
2nd way: you need to go to ~/.paradoxlauncher/ and find the Paradox Launcher in both folders, then you need to add "--disable-gpu" to the last line in the executable, so it looks like "${SCRIPTPATH}"/Launcher --no-sandbox -disable-gpu "$@" and now you should be able to launch the game normally. 


# Endeavour OS/Arch
When installing Endeavour OS make sure to follow the post install guides, as if you're on Nvidia like me the first kernal update will break your install, make sure to install their nvidia-hook package (see here https://forum.endeavouros.com/t/newest-update-broke-install-most-likely-nvidia-drivers/27590)
# Qtile/Picom
Qtile can easily be installed next to really any desktop environment, and importing the profile from Endeavour OS is really simple
Make sure to enable vsync on picom via the autostart.conf. 

If your getting fps higher than what your screen should be getting after moving between workspaces in qtile, move the game over to it's own workspace and that should fix it.

Replace qtile and picom with their -git versions

A really cool thing you can do with pacman is install packages via a a .txt file generated via pacman -Q > installedpackages.txt (which can be used to import your previous installed packages) and can be installed via yay -S - < installedpackages.txt (the name doesn't matter it can be whatever)

Use Xrender NOT OpenGL on picom-conf 

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
plasma-desktop

yay -S --needed qt5ct-kde qt6ct kvantum-git dolphin kate konsole plasma-desktop
(should work)

Set the environment variables in /etc/environment/ (just add it on it's own line) to 
$XDG_CURRENT_SESSION=KDE
and log into plasma-desktop. Set your application style to kvantum and set the theme to the respective color scheme (KvArc for example in Kvantum and color schemes). This is because you can't import kde color schemes easily to qt5ct and qt6ct. Set your icon theme to the one you want to use (for me that was Fluent Dark), change your cursor to the one you want (again Fluent for me) 
After doing that log back into xfce/qtile/gnome/ whatever your using and open up qt5ct, sudo qt5ct, qt6ct, and sudo qt6ct. In ALL of them set the application theme to kvantum, leave the color scheme as default. Go to fonts and set 
General: Noto Sans (Regular) 10 
Fixed width: Monospace (Regular) 10
DO NOT create a fonts.conf. 
Set the icon theme to a dark variant, unless your insane and like light themes. Do this for both root and user qt5ct and qt6ct.
Finally, comment out $XDG_CURRENT_SESSION=KDE and add
QT_QPA_PLATFORMTHEME-qt5ct
Now you should have a consistent dark theme for every app you use, including configuration settings (right click > configure dolphin).
You can get rid of plasma-desktop, but I keep it around just in case I need to change my color scheme/kvantum theme. 
I have gotten this to work with both breeze and lightly but I still need to test if it'll work. 
I'm going to attach my qt5ct, qt6ct, and both gtk 2 3 and 4 folders with the files. I have no idea if importing will work so please let me know via issues tab, if that can be opened.

![image](https://user-images.githubusercontent.com/64805993/180672311-2896ab52-3047-439e-9df7-978b630f23d7.png)
Proof

Update: You can safely remove plasma and plasma-desktop after setting the color theme. 
# Inconsistent Cursor Theme
So there's a ton of solutions, but the one that I've found is editing your ~/.config/gtk-3.0/settings.ini and ~/.config/gtk-4.0/settings.ini and change it to the theme you want. You can find what the names are with (thank you arch wiki) find /usr/share/icons ~/.local/share/icons ~/.icons -type d -name "cursors" command. If that doesn't work, then you need to edit your ~/.Xresources file and put the icon theme in there, which I've had to do every single time I install endeavour os plasma 

# Legacy Macbooks running OracleVM
I tested Pop_OS! on an old macbook to let someone try linux, but it wouldn't load, using elementary OS was the solution, specifcally using a Linux Ubuntu 64x settings, and enab,ing efi mode in the vm settings. I'm very new to VM's but I need to put this somewhere so I remember. If anyone has any experience with VM's and/or Elementary OS I'd be happy to hear about it. 

# Optimus Manager Can't Switch Modes
So for whatever reason Optimus Manager will probably stop working for you like it has for me about... 5 times ish. Other than just a reset of config files, one issue I was having was with Endeavour OS's sddm settings (I think), the fix is this https://github.com/Askannz/optimus-manager/issues/356#issuecomment-1100828176
You need to commend out both lines that start with Display in /etc/sddm.conf pretty easy fix. 
