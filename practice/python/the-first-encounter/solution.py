def string_to_number_mapping(s: str) -> dict:
  d = {}
  for string in range(len(s)):
    if s[string] in d:
      pass
    else:
      d[s[string]]=string





  return d
