# flutterfly
# Flutter Installer

This script simplifies the installation of Flutter on Mac and Linux systems. 
This project is completely modular and if you don't want all the files, there is a general file that works without any dependence on other files.

This project enables you to install the Flutter SDK, Android SDK, and dependencies required for building Linux apps, from various sources including language sites, GitHub repositories, official distribution repositories, and unofficial third-party repositories. Except Snap

Key points:
- Install Flutter SDK
- Install Android SDK
- Add PATH Android && Flutter && JDK > in Shell
- Install dependencies for Linux app generation
- Supports multiple sources:
  - Official source 
  - GitHub repos
  - Official distro repositories
  - Unofficial 3rd party repos

# Installation
> To install and use the modular file, `cd` the `Scripts` folder and run the ```installer.sh``` file
```fish
git clone https://github.com/nooob-developer/noob-flutter-installer.git
```
or

Download method for separate and complete file
```fish
wget https://raw.githubusercontent.com/nooob-developer/noob-flutter-installer/main/noob-flutter-full-installer.sh
```

# Important Notes
**For Iranian users, it is necessary to connect to an IP outside of Iran. (VPN)**
> Ensure you have at `wget` or `curl` `git` of `polkit` installed before running the script.
> - Root access for installing packages 
>  - Give the script permission to execute.

# Troubleshooting
please open a GitHub issue 
or
**Send your problem to this** id [@nooob_developer](https://t.me/Nooob_developer "Telegram") for help.

## Releases

v1.0

> Initial release

v1.1

 > Added support for macOS

v2.0

 > Added version TUI (very soon)

v3.0

 > Added version GUI (soon)

## License

This project is licensed under the GPL 3.0 License - see the [LICENSE file](https://codeberg.org/nooob-developer/flutterfly/src/branch/main/LICENSE) for details.



