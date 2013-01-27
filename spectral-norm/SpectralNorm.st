"* The Computer Language Benchmarks Game
    http://shootout.alioth.debian.org/
    contributed by Paolo Bonzini *"!

Object subclass: SpectralNorm [
    SpectralNorm class >> spectralnorm: n [
   | u v vBv vv |
   u := Array new: n withAll: 1.0d0.
   10 timesRepeat:
      [v := u multiplyAtAv.
       u := v multiplyAtAv].
   vBv := 0.0d0.
   vv := 0.0d0.
   1 to: n do:
      [:i |
       vBv := vBv + ((u at: i) * (v at: i)).
       vv := vv + ((v at: i) * (v at: i))].
   ^(vBv / vv) sqrt
    ]

    SpectralNorm class >> spectralnorm2 [
   self print: (self spectralnorm: 500) digits: 9.
    stdout nl.
   ^''
    ]

    SpectralNorm class >> print: number digits: decimalPlaces [
   stdout nextPutAll:
      ((number ) printString copyWithout: $s)
    ]
]

Eval [
    (Time millisecondsToRun: [ SpectralNorm spectralnorm2 ]) printNl
]

