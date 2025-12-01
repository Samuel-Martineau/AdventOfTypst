#let parse(str) = (
  str
    .matches(regex("(R|L)(\d+)"))
    .map(m => m.captures)
    .map(((d, a)) => (if (d == "L") { -1 } else { 1 }) * int(a))
)

#let partA(str) = (
  parse(str)
    .fold(
      (50, 0),
      ((pos, count), step) => {
        let new = calc.rem-euclid(pos + step, 100)
        (new, count + int(new == 0))
      },
    )
    .at(1)
)

#let partB(str) = (
  parse(str)
    .fold(
      (50, 0),
      ((pos, count), step) => {
        let new = calc.abs(calc.rem-euclid(step + pos, 100))
        let rem = calc.abs(calc.div-euclid(step + pos, 100))

        if step < 0 {
          if pos == 0 {
            rem -= 1
          }

          if new == 0 {
            rem += 1
          }
        }

        (
          new,
          count + rem,
        )
      },
    )
    .at(1)
)
