eliloconfig

Script allowing to manage EFI booting on Slackware® and its derivatives.

This script is a modification of a the version initially written by Patrick Volkerding, Sebeka, Minnesota, USA who remains its copyright holder.

It adds to the version shipped in Slackware internationalization through gettext and an elilo boot menu with additional information accessible from the menu through display of text files, hat have been added to the source directory elilo. The boot menu can be displayed either as a boot entry of the EFI firmware, or running a startup.nsh script from an EFI shell of which the machine is equipped.

As is this script target Slint but after adaptation (see below) is usable on any distribution based on Slackware as on Slackware itself, provided that the /boot directory of the installed system has the same layout as Slackware.

To adapt this version of eliloconfig to another distribution just run the script rebrand.sh.

You will be asked the name of your distribution, then will get the /tmp/elilo source directory. Just run eliloconfig.SlackBuild in it to build your re-branded liloconfig package.

Slackware® is a registered trademark of Slackware Linux, Inc.

Didier Spaier, Paris, 28/03/2016. 
