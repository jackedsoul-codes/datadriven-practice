def inverted_triangle(n: int) -> list[str]:
  s= '*'
  a = []
  for i in range(n, 0, -1):
    a.append(i*s)

  return a
