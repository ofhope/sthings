import immutablestring

proc lev(t: tuple[a, b: ImmutableString]): int =
  let (a, b) = t
  if a.len == 0: return b.len
  if b.len == 0: return a.len
  let
    a1 = a.tail
    b1 = b.tail
    d1 = lev((a1, b)) + 1
    d2 = lev((a, b1)) + 1
    d3 = lev((a1, b1)) + (if a.head == b.head: 0 else: 1)
  return min(min(d1, d2), d3)

proc levenshtein*(a, b: string): int =
  lev((a.lift, b.lift))