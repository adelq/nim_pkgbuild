# Package

version       = "0.1.0"
author        = "Adel Qalieh"
description   = "PKGBUILD generator from .nimble packages"
license       = "GPL-3.0"
srcDir        = "src"
bin           = @["nim_pkgbuild"]

# Dependencies
requires "nim >= 1.2.0", "nimble >= 0.11.2"
