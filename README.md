# Various Fixes and Notes That Are Important
Don't know how to do this, but I'll put my findings here to share

# Modding 
When using Vortex through SteamTinkerLaunch, modding is very easy (tested on Fallout 4, Fallout New Vegas, Tale of Two Wastelands, and Skyrim

Stardew Valley is best played through Proton (any version) and to get it working correctly with modding, download SMAPI manually and run the .bat file through wine. Vortex won't detect natvie games so you need a .exe in the game files. Use "Move deployment (Experimental!)" in the "Mods" tab of the settings. Make sure the staging folder is on the same drive

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
There is not a single good guide out there on getting KDE (QT) apps to work on any other desktop environment other than KDE (wihout either mismatched dark and light themes or horrible tearing in apps). IT IS VERY POSSIBLE, but you need to install a lot of dependencies.

Install
qt5ct
qt6ct
kvantum-git
dolphin
kate
plasma-desktop

Set the environment variables in /etc/environment/ to 
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

