def zigzag_encode(s: str, num_rows: int) -> str:
  
  if num_rows == 1:
    return s
  
  rows = [[] for _ in range(num_rows)]
  current_row = 0
  direction = -1
  result = ''
    
  for char in s:
    rows[current_row].append(char)
  
    if current_row == 0 or current_row == num_rows - 1:
      direction *= -1
    
    current_row += direction
  
  for i in range(len(rows)):
    result += "".join(rows[i])
  
  return result
