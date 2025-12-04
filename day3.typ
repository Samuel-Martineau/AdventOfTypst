#let parse(inp) = inp.split().map(l => l.split("").slice(1, -1).map(int))

#let maxFromDigits(n, digits) = {
  if n == 1 { return calc.max(..digits) }

  let first = calc.max(..digits.slice(0, 1 - n))
  let idx = digits.position(d => d == first)

  let rest = maxFromDigits(n - 1, digits.slice(idx + 1))
  let mag = int(calc.log(rest))

  first * calc.pow(10, mag + 1) + rest
}

#let partA(inp) = parse(inp).map(maxFromDigits.with(2)).sum()

#let partB(inp) = parse(inp).map(maxFromDigits.with(12)).sum()
