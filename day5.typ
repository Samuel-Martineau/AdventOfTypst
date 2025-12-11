#let parse(inp) = {
  let (first, last) = inp.split("\n\n")
  (
    first.matches(regex("(\d+)-(\d+)")).map(c => c.captures.map(int)).map(((start, end)) => (start: start, end: end)),
    last.split().map(int),
  )
}

#let partA(inp) = {
  let (ranges, ids) = parse(inp)

  let count = 0

  for id in ids {
    for (start, end) in ranges {
      if start <= id and id <= end {
        count += 1
        break
      }
    }
  }

  count
}

#let partB(inp) = {
  let result = parse(inp)
    .first()
    .sorted(key: it => it.start)
    .fold((count: 0, start: 0, end: 0), (acc, curr) => {
      if curr.start > acc.end {
        return (count: acc.count + acc.end - acc.start + 1, start: curr.start, end: curr.end)
      } else {
        return (count: acc.count, start: acc.start, end: calc.max(acc.end, curr.end))
      }
    })

  result.count + result.end - result.start
}
