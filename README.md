# nim_pkgbuild

Arch Linux PKGBUILD generator from .nimble packages

First, install Nim and Nimble:

    $ pacman -S nim nimble

Then clone this project:

    $ git clone https://github.com/adelq/nim_pkgbuild.git

To install, navigate to the directory and run `nimble install`:

    $ cd nim_pkgbuild
    $ nimble install

Now you can create a PKGBUILD from your project's .nimble file:

    $ cd my_nim_project
    $ nim_pkgbuild

You can then edit the PKGBUILD as needed.
