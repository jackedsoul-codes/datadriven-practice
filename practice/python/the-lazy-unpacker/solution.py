def flatten_generator(nested: list) -> list:

  result = []
 
  for items in nested:
    if isinstance(items, list):
      result.extend(flatten_generator(items))
    else:
      result.append(items)

  return result
