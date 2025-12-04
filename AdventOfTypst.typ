#set page(height: auto)

#show heading.where(level: 1): it => [
  #pagebreak(weak: true)
  #it
]

= Day 1

#import "day1.typ"

== Part A

Example: #day1.partA("L68 L30 R48 L5 R60 L55 L1 L99 R14 L82")

Input: #day1.partA(read("day1.txt"))

== Part B

Example: #day1.partB("L68 L30 R48 L5 R60 L55 L1 L99 R14 L82")

Input: #day1.partB(read("day1.txt"))

== Code
#raw(read("day1.typ"), block: true, lang: "typ")

= Day 2

#import "day2.typ"

== Part A

Example: #day2.partA("11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124")

Input: #day2.partA(read("day2.txt"))

== Part B

Example: #day2.partB("11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124")

Input: #day2.partB(read("day2.txt"))

== Code

#raw(read("day2.typ"), block: true, lang: "typ")

= Day 3

#import "day3.typ"

== Part A

Example: #day3.partA(
  "987654321111111
811111111111119
234234234234278
818181911112111",
)

Input: #day3.partA(read("day3.txt"))

== Part B

Example: #day3.partB(
  "987654321111111
811111111111119
234234234234278
818181911112111",
)

Input: #day3.partB(read("day3.txt"))

== Code

#raw(read("day3.typ"), block: true, lang: "typ")
