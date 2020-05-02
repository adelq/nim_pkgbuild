import os
import strformat
import parseopt

import nimblepkg/common, nimblepkg/packageparser, nimblepkg/options

const usage = """PKGBUILD generator for Nimble packages.

Will create PKGBUILD which can be used for building package from the specified
Nimble project.

To create a PKGBUILD for a Nimble project in the current working directory,
simply run:

  nim_pkgbuild"""

const buildStr = """
build() {
    return 0
}
"""

proc generatePkgbuild(pkg: PackageInfo) =
  let f = open("PKGBUILD", fmWrite)
  defer: f.close()

  f.writeLine(&"# Maintainer: {pkg.author}")
  f.writeLine(&"pkgname={pkg.name}")
  f.writeLine(&"pkgver={pkg.version}")
  f.writeLine(&"pkgrel=1")
  f.writeLine(&"pkgdesc={pkg.description}")
  f.writeLine(&"license={pkg.license}")

  f.writeLine("makedepends=('nim')")
  f.writeLine("arch=('x86_64')")

  f.writeLine("")
  f.write(buildStr)
  f.writeLine("")

  f.write(&"package() {{\n    nimble install {pkg.name}\n}}\n")


proc getPackageInfo(): PackageInfo =
  let options = initOptions()
  let pkgInfo = getPkgInfo(getCurrentDir(), options)
  return pkgInfo


when isMainModule:
  var p = initOptParser()
  while true:
    p.next()
    case p.kind:
      of cmdEnd:
        generatePkgbuild(getPackageInfo())
        break
      of cmdShortOption:
        if p.key == "h":
          echo usage
        else:
          echo usage
          echo &"Unknown option: -{p.key}"
        break
      of cmdLongOption:
        if p.key == "help":
          echo usage
        else:
          echo usage
          echo &"Unknown option: --{p.key}"
          break
      of cmdArgument:
        echo "Passing in Nimble project names not yet supported"
