import strutils, os
import docopt
import sthingspkg/levenshtein, sthingspkg/words

let doc = """
Naval Fate.

Usage:
  sthings --breaklines <a>
  sthings (-h | --help)
  sthings --version
  sthings --levenshtein <a> <b>
  sthings --couples <words>...

Options:
  -h --help     Show this screen.
  --version     Show version.
  -c=<case>     Case to transform to.
  --breaklines  Converts encoded line endings. Usful for mashed json.
"""

let args = docopt(doc, version = "Naval Fate 2.0")

proc main(args: Table[string, Value]): void =
  if args["--breaklines"]:
    let str:string = $(args["<a>"])
    for line in str.split("\\n"):
      writeLine(stdout, line)
  elif args["--levenshtein"]:
    let a = args["<a>"]
    let b = args["<b>"]
    echo levenshtein($a, $b)
  elif args["--couples"]:
    var words: seq[string] = @[]
    for w in args["<words>"]:
      words.add($w)
    echo wordCouples(words)
  
if isMainModule:
  main(args)

# sthings --case=<case> <sinput>
# snake_case
# camelCase
# PascalCase
# kebab-case
# UPPER_CASE