Archive OS X installer application
==================================

This combination of a script and importable [Hazel](http://www.noodlesoft.com/hazel.php) rule will archive [new OS X installer applications](https://itunes.apple.com/us/app/os-x-yosemite/id915041082?mt=12) as they appear in the /Applications directory.

It is better than _most_ fish and chips. Honest.


Why?
----

The Mac App Store saves new OS X Install applications to the /Applications folder. Subsequent updates from the Mac App Store overwrite the previous version of the OS X Install app. Even if you move the application elsewhere, downloading updates will overwrite it wherever it has been moved — as long as the Finder can find it.

This is frustrating for those who would like to archive various versions/builds of OS X for later use.


How does it work?
-----------------

The Hazel rule detects when you have a new OS X Install application in the /Applications folder. It waits a short time to make sure the download is complete.

Then it pounces! Hazel runs the "archive\_osx\_installer\_app" script, which does _all_ of the heavy lifting.

1. It determines the version number and build of OS X in the app (without using the entire InstallESD.dmg).
1. It copies the OS X Install app to a temporary folder. Please note that you'll want enough space for this — and for each OS X Install application that you currently have in /Applications, if you add the Hazel rule, below.
1. It archives the temporary folder to a compressed disk image in /Users/Shared. (You know I dig [disk image compression](http://www.jaharmi.com/2007/01/18/compressed_mac_os_x_disk_image_statistics).) Again, this is making yet another copy, so you'll want enough disk space for that.
1. It removes the temporary folder to free up space.

Examples of actual disk images saved to /Users/Shared:

* Install Mac OS X Lion 10.7.3 11D50.dmg
* Install OS X Mountain Lion 10.8.4 12E55.dmg
* Install OS X Mavericks 10.9.3 13D65.dmg
* Install OS X Yosemite 10.10 14A389.dmg

You may also run "archive\_osx\_installer_app" on its own, if you don't have Hazel, don't use Hazel, and/or don't want Hazel. The script takes one parameter, the path to the OS X Install app.

Examples:

    /usr/local/bin/archive_osx_installer_app "/Applications/Install Mac OS X Lion.app"
    /usr/local/bin/archive_osx_installer_app /Applications/Install\ OS\ X\ Mountain\ Lion.app
    /usr/local/bin/archive_osx_installer_app /Applications/Install\ OS\ X\ Mavericks.app
    /usr/local/bin/archive_osx_installer_app '/Applications/Install OS X Yosemite.app'

__A note on free disk space:__ as described above, if you import the Hazel rule, you will want enough free disk space on your particular system to comfortably make a copy and a disk image — a process which itself has disk space requirements — of that copy of each OS X Install application in your /Applications folder.

__A note on the destination folder:__ I chose /Users/Shared on something of a whim. Afaik, I can only pass one parameter to the script from Hazel. You can move your disk images from that location, perhaps with another Hazel rule, if you so choose.


Installation
------------

If you want to make OS X Install applications manually, you only need the shell script.

__If you have [The Luggage](https://github.com/unixorn/luggage/) and its prerequisites installed__, you can use the included Makefile to make an installation package for the script. This is not required, but you may want it that way. (I've been known to work with The Luggage, as you may know from [various events](http://www.jaharmi.com/psumacconf_2012_luggage_talk) and [so on](http://www.jaharmi.com/psumacconf_2013_luggage_talk). If you'd like to make flat packages or see some makefile overrides I like, this Makefile may be of interest to you.)

1. Clone the repository.
1. Make the installation package with The Luggage.
    make pkg
1. Install the installation package.

__If you don't have The Luggage installed__, you can copy the script to /usr/local/bin yourself.

1. Clone the repository.
1. Copy the script to /usr/local/bin.
  sudo cp archive_osx_installer_app /usr/local/bin
1. Make sure the script is executable.
  sudo chmod 755 /usr/local/bin/archive_osx_installer_app

__Once the script is installed__, import the Hazel rule. The Hazel rule wires things up to make automatic archives — or at least that's the goal — so if you're using Hazel on the system where you download OS X Install application updates, I suggest you try it.

1. Double-click on the "Applications.hazelrules" file.
1. Choose "Applications" as the folder to import the rules to when Hazel prompts you for that choice.


Feedback
--------

This project is hosted on both [Bitbucket](https://bitbucket.org/jaharmi/archive-os-x-installer-application/overview) and [Github](https://github.com/Jaharmi/archive_osx_installer_app). The primary public repository is on Bitbucket; I personally use [Mercurial](http://mercurial.selenic.com) to track changes.

If you encounter a problem, please submit an issue.

In particular, the Hazel rule might be fiddly, as I find it hard to get those right when they include downloads. In this case, the download will also be updated — perhaps several times — later. I've _tried_ to make it match correctly without making a new archive every time Hazel scans. YMMV.


Version history
---------------

* 0.9.0 - First public release
* 0.9.1 - Update Hazel matching conditions to look for either no previous matches or a match that predates the latest modification to the OS X Install application
