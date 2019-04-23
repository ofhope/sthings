import hashes

type ImmutableString* = object
  content: ref string
  start: int
  hashValue: int

template len*(h: ImmutableString): int = len(h.content[]) - h.start
template head*(h: ImmutableString): char = h.content[h.start]

proc tail*(h: ImmutableString): ImmutableString =
  result.content = h.content
  result.start = h.start + 1
  result.hashValue = 0
  for i in result.start .. high(result.content[]):
    result.hashValue = result.hashValue !& ord(result.content[i])
  result.hashValue = !$(result.hashValue)

proc lift*(s: string): ImmutableString =
  new result.content
  result.content[] = s
  result.start = 0
  result.hashValue = hash(s)