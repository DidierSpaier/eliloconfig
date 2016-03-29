eliloconfig

Script allowing to manage EFI booting on Slackware® and its derivatives.

This script is a modification of a the version initially written by Patrick Volkerding, Sebeka, Minnesota, USA who remains its copyright holder.

It brings to the Slackware version internationalization through gettext, and an elilo boot menu with additional information through the display of text files, added to the source directory elilo.

The boot menu can be displayed either as a boot entry of the EFI firmware, or running a startup.nsh script from an EFI shell if the target machine is so equipped and another boot manager does not steal the show.

As is, this script targets the upcoming Slint distribution, but after an easy adaptation (see below) it is usable on any distribution based on Slackware and on Slackware itself.

To adapt this version of eliloconfig to another distribution, just run the script rebrand.sh. You will be asked the name of your distribution, then will get the /tmp/elilo-[distribution] source directory. Run /tmp/elilo-[distribution]/eliloconfig.SlackBuild to build your re-branded liloconfig package.

By default, the script eliloconfig.SlackBuild installs translations of messages output of eliloconfig, with an UTF-8 encoding. If this is not wished, just remove the "po" directory or the file SeTlocales from /tmp/elilo-[distribution] before running it.

Slackware® is a registered trademark of Slackware Linux, Inc.

Didier Spaier, Paris, 28/03/2016.

Last updated 29/03/2016.
