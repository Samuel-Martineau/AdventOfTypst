#let add(a, b) = a + b
#let mult(a, b) = a * b

#let partA(inp) = (
  {
    let (..rawOperands, rawOperations) = inp.trim().split("\n").map(l => l.split())

    let operands = rawOperands.map(l => l.map(int))
    let operations = rawOperations.map(o => if o == "+" { add } else { mult })

    operations.zip(..operands)
  }
    .map(((f, ..args)) => args.reduce(f))
    .sum()
)

#let transpose(a) = a.first().zip(..a.slice(1))

#let rectangularize(a, p) = {
  let n = calc.max(..a.map(b => b.len()))
  a.map(b => b + (n - b.len()) * (p,))
}

#let partB(inp) = (
  {
    let (..rawOperands, rawOperations) = rectangularize(inp.trim().split("\n").map(l => l.split("")), " ")

    let operations = rawOperations.filter(s => s.trim() != "").map(o => if o == "+" { add } else { mult })
    let operands = transpose(rawOperands)
      .map(o => o.filter(s => s.trim() != "").map(int).reduce((acc, curr) => 10 * acc + curr))
      .split(none)
      .slice(1, -1)

    operations.zip(operands)
  }
    .map(((f, args)) => args.reduce(f))
    .sum()
)
