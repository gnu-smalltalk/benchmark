"* The Computer Language Benchmarks Game
    http://shootout.alioth.debian.org/
    contributed by Paolo Bonzini *"!

Array extend [
    multiplyAtAv [
    ^(self multiplyAv) multiplyAtv
    ]
    multiplyAtv [
   | n atv sum |
   n := self size.
   atv := Array new: n.
   1 to: n do: [:i|
      sum := 0.0d0.
      1 to: n do: [:j|
         sum := sum + ((j matrixA: i) * (self at: j)) ].
      atv at: i put: sum].
   ^atv
    ]

    multiplyAv [
   | n av sum |
   n := self size.
   av := Array new: n.
   1 to: n do: [:i|
      sum := 0.0d0.
      1 to: n do: [:j|
         sum := sum + ((i matrixA: j) * (self at: j)) ].
      av at: i put: sum].
   ^av
    ]
]

SmallInteger extend [
    matrixA: anInteger [
   ^1.0d0 / ((self + anInteger - 2) * (self + anInteger - 1) /2  + self)
    ]
]


