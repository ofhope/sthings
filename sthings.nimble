# Package

version       = "0.1.0"
author        = "Alexis Hope"
description   = "A command line tool for string things `sthings`"
license       = "MIT"
srcDir        = "src"
bin           = @["sthings"]

# Dependencies

# [Deps]
# --define: release
# --opt: size

requires "docopt"
requires "nim >= 0.18.0"
