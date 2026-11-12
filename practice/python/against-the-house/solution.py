def dice_roll_scoring(dice: list[int]):
  dice = sorted(dice)
  counts = []

  a = 1

  for i in range(len(dice) - 1):
    if dice[i] == dice[i + 1]:
      a += 1
    else:
      counts.append(a)
      a = 1

  counts.append(a)

  if 5 in counts:
    return 50
  elif 4 in counts:
    return 40
  elif sorted(counts) == [2, 3]:
    return 25
  else:
    return sum(dice)
