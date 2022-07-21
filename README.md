# Karions-Findings
Don't know how to do this, but I'll put my findings here to share

When using Vortex through SteamTinkerLaunch, modding is very easy (tested on Fallout 4, Fallout New Vegas, Tale of Two Wastelands, and Skyrim

Stardew Valley is best played through Proton (any version) and to get it working correctly with modding, download SMAPI manually and run the .bat file through wine. Vortex won't detect natvie games so you need a .exe in the game files. Use "Move deployment (Experimental!)" in the "Mods" tab of the settings. Make sure the staging folder is on the same drive

When installing Endeavour OS make sure to follow the post install guides, as if you're on Nvidia like me the first kernal update will break your install, make sure to install their nvidia-hook package (see here https://forum.endeavouros.com/t/newest-update-broke-install-most-likely-nvidia-drivers/27590)

Qtile can easily be installed next to really any desktop environment, and importing the profile from Endeavour OS is really simple
Make sure to enable vsync on picom via the autolaunch.conf. 

If your getting fps higher than what your screen should be getting after moving between workspaces in qtile, move the game over to it's own workspace and that should fix it.

Replace qtile and picom with their -git versions

A really cool thing you can do with pacman is install packages via a a .txt file generated via pacman -Q > installedpackages.txt (which can be used to import your previous installed packages) and can be installed via yay -S - < installedpackages.txt (the name doesn't matter it can be whatever)

Use Xrender NOT OpenGL on picom-conf 
