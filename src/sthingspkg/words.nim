import streams

type
  WordCouple = tuple[a, b: string]

iterator couples[A](xs: seq[A]): auto =
  for i in 0 .. pred(xs.len):
    for j in (i + 1) .. pred(xs.len):
      yield (xs[i], xs[j])

proc wordCouples*(s: seq[string]): seq[WordCouple] =
  result = @[]
  for a, b in couples(s):
    result.add((a, b))

proc readWords*(path: string): seq[string] =
  result = @[]
  var
    input = newFileStream(path, fmRead)
    s = ""
  defer:
    input.close()
  while readLine(input, s):
    result.add(s)
