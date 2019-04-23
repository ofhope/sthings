import strutils, os
import docopt
import sthingspkg/levenshtein

let doc = """
Naval Fate.

Usage:
  sthings --breaklines <sinput>
  sthings (-c=<case> --case=<case>) <sinput>
  sthings (-h | --help)
  sthings --version
  sthings -l <a> <b>

Options:
  -h --help     Show this screen.
  --version     Show version.
  -c=<case>     Case to transform to.
  --breaklines  Converts encoded line endings. 
"""

let args = docopt(doc, version = "Naval Fate 2.0")

proc main(args: Table[string, Value]): void =
  if args["--breaklines"]:
    let str:string = $(args["<sinput>"])
    for line in str.split("\\n"):
      writeLine(stdout, line)
  elif args["-l"]:
    let a = args["<a>"]
    let b = args["<b>"]
    echo levenshtein($a, $b)
  
if isMainModule:
  main(args)

# snake_case
# camelCase
# PascalCase
# kebab-case
# UPPER_CASE