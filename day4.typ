#let parse(inp) = {
  let body = inp.split().map(l => l.split("").map(c => c == "@"))
  let padding = body.first().len() * (false,)
  (padding,)
  body
  (padding,)
}

#let partA(inp) = (
  {
    let grid = parse(inp)
    let n = grid.len()
    let m = grid.first().len()

    let accessible = grid

    for i in range(1, n - 1) {
      for j in range(1, m - 1) {
        if not grid.at(i).at(j) {
          accessible.at(i).at(j) = false
          continue
        }
        let count = (
          int(grid.at(i - 1).at(j - 1))
            + int(grid.at(i).at(j - 1))
            + int(grid.at(i + 1).at(j - 1))
            + int(grid.at(i - 1).at(j))
            + int(grid.at(i + 1).at(j))
            + int(grid.at(i - 1).at(j + 1))
            + int(grid.at(i).at(j + 1))
            + int(grid.at(i + 1).at(j + 1))
        )
        accessible.at(i).at(j) = count < 4
      }
    }

    accessible
  }
    .flatten()
    .map(int)
    .sum()
)

#let partB(inp) = {
  let grid = parse(inp)

  let n = grid.len()
  let m = grid.first().len()

  let removed = 0

  while true {
    let removedThisRound = 0

    for i in range(1, n - 1) {
      for j in range(1, m - 1) {
        if not grid.at(i).at(j) { continue }

        let count = (
          int(grid.at(i - 1).at(j - 1))
            + int(grid.at(i).at(j - 1))
            + int(grid.at(i + 1).at(j - 1))
            + int(grid.at(i - 1).at(j))
            + int(grid.at(i + 1).at(j))
            + int(grid.at(i - 1).at(j + 1))
            + int(grid.at(i).at(j + 1))
            + int(grid.at(i + 1).at(j + 1))
        )

        if count < 4 {
          removedThisRound += 1
          grid.at(i).at(j) = false
        }
      }
    }

    removed += removedThisRound
    if removedThisRound == 0 { break }
  }

  removed
}
