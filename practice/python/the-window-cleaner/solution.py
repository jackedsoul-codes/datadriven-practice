def longest_unique_substr(s):
  
  b = []
  max_len = 0
  
  for char in s:
    while char in b:
      b.pop(0)
      
    b.append(char)
    max_len = max(max_len, len(b))

  return max_len
