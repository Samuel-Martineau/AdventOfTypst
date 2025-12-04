#let parse(str) = (
  str
    .matches(regex("(\d+)-(\d+)"))
    .map(m => m.captures)
    .map(((a, b)) => (int(a), int(b)))
)

#let partition((a, b), mag: none) = {
  let upper = calc.pow(10, int(calc.log(a)) + 1) - 1
  if b > upper {
    ((a, upper),)
    partition((upper + 1, b))
  } else {
    ((a, b),)
  }
}

#let sumOfDivisble((a, b), d) = {
  let count = calc.quo(b, d) - calc.quo(a, d) + int(calc.rem(a, d) == 0)
  let first = a + calc.rem-euclid(-a, d)
  let sum = calc.quo(count * (2 * first + (count - 1) * d), 2)
  sum
}

#let partA(str) = (
  parse(str)
    .map(partition)
    .sum()
    .map(((a, b)) => {
      let mag = int(calc.log(a))
      if calc.even(mag) { return 0 }
      let divisor = calc.pow(10, (mag + 1) / 2) + 1
      sumOfDivisble((a, b), divisor)
    })
    .sum()
)

#let divisors(n) = {
  for d in range(1, calc.floor(calc.sqrt(n)) + 1) {
    if calc.rem(n, d) == 0 {
      let d2 = calc.quo(n, d)
      if d == d2 { (d,) } else { (d, d2) }
    }
  }
}.sorted()

#let stride(d, w, n) = {
  assert(d < calc.pow(10, w))
  if n == 0 { return 0 }
  stride(d, w, n - 1) * calc.pow(10, w) + d
}

#let countsForDivisors(divisors) = {
  let counts = (1,) * divisors.len()
  for (i, d) in divisors.enumerate() {
    for j in range(i + 1, divisors.len()) {
      if calc.rem(divisors.at(j), d) == 0 {
        counts.at(i) -= 1
      }
    }
  }
  counts
}

#let partB(input) = (
  parse(input)
    .map(partition)
    .sum()
    .map(((a, b)) => {
      let mag = int(calc.log(a)) + 1
      if mag == 1 { return 0 }
      let divisors = divisors(mag).slice(0, -1)
      let counts = divisors
        .map(m => stride(1, m, calc.quo(mag, m)))
        .map(d => sumOfDivisble((a, b), d))
      let multipliers = countsForDivisors(divisors)
      multipliers.zip(counts).map(((m, c)) => m * c).sum()
    })
    .sum()
)
