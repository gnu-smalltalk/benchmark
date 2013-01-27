Stream subclass: PiDigitSpigot [

    PiDigitSpigot class >> new [
        ^ super new
            initialize;
            yourself
    ]

    | numer accum denom k |

    atEnd [
    ^false
    ]

    next [
    | digit |
    [ self step. (digit := self extract) isNil ] whileTrue.
    self eliminate: digit.
    ^digit
    ]

    initialize [
    numer := denom := 1.
    k := accum := 0.
    ]

    extract [
    | tmp |
    numer > accum ifTrue: [^nil].
    tmp := numer + numer + numer + accum.
    tmp \\ denom >= (denom - numer) ifTrue: [^nil].
    ^tmp // denom
    ]

    eliminate: digit [
    accum := accum - (denom * digit).
    accum := accum * 10.
    numer := numer * 10
    ]

    step [
    | y2 |
    k := k + 1.
    y2 := k * 2 + 1.
    accum := (numer + numer + accum) * y2.
    numer := numer * k.
    denom := denom * y2.
    ]
]
