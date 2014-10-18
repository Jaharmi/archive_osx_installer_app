Archive OS X installer application
==================================

This combination of a script and importable Hazel rule will archive new OS X installer applications as they appear in the /Applications directory.

It is better than _most_ fish and chips. Honest.


Why?
----

The Mac App Store saves new OS X Install applications to the /Applications folder. Subsequent updates from the Mac App Store overwrite the previous version of the OS X Install app. Even if you move the application elsewhere, downloading updates will overwrite it wherever it has been moved — as long as the Finder can find it.

This is frustrating for those who would like to archive various versions/builds of OS X for later use.


How does it work?
-----------------

The Hazel rule detects when you have a new OS X Install application in the /Applications folder. It waits a short time to make sure the download is complete.

Then, it pounces! Hazel runs the "archive\_osx\_installer_app" script, which does all the heavy lifting.

1. It determines the version number and build of OS X in the app (without using the entire InstallESD.dmg).
1. It copies the OS X Install app to a temporary folder.
1. It archives the temporary folder to a compressed disk image in /Users/Shared.
1. It removes the temporary folder to free up space.

Examples of actual disk images saved to /Users/Shared:

* Install Mac OS X Lion 10.7.3 11D50.dmg
* Install OS X Mountain Lion 10.8.4 12E55.dmg
* Install OS X Yosemite 10.10 14A389.dmg

You may also run "archive\_osx\_installer_app" on its own, if you don't have Hazel, don't use Hazel, and/or don't want Hazel. The script takes one parameter, the path to the OS X Install app.

Examples:

    /usr/local/bin/archive_osx_installer_app "/Applications/Install Mac OS X Lion.app"
    /usr/local/bin/archive_osx_installer_app /Applications/Install\ OS\ X\ Mountain\ Lion.app
    /usr/local/bin/archive_osx_installer_app '/Applications/Install OS X Yosemite.app'


Installation
------------

__If you have The Luggage installed__, you can use the included Makefile to make an installation package for the script. This is not required, but you may want it that way. (I've been known to work with The Luggage, as you may know.)

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

__Once the script is installed__, import the Hazel rule.

1. Double-click on the "Applications.hazelrules" file.
1. Choose "Applications" as the folder to import the rules to when Hazel prompts you for that choice.


Feedback
--------

If you encounter a problem, please submit an issue.

In particular, the Hazel rule might be fiddly, as I find it hard to get those right when they include downloads. In this case, the download will also be updated — perhaps several times — later. I've tried to make it match correctly without making a new archive every time Hazel scans. YMMV.


Version history
---------------

0.9.0 - First public release
