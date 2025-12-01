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
