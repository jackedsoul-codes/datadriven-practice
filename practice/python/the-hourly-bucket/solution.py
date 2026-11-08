def group_by_hour(events):
  d = {}

  for e in events:
    hour = e["ts"][:13]

    if hour not in d:
      d[hour] = [e["type"]]

    else:
      # d[hour] = d[hour].append(e["type"])
      d[hour].append(e["type"])
      

  return d
