Object subclass: Pidigit [

    Pidigit class >> pidigits4 [
        self pidigitsTo: 6000 width: 10 to: stdout
    ]

    Pidigit class >> pidigitsTo: v width: width to: output [
    | n i pidigits |
   n := v.
   i := 0.
   pidigits := PiDigitSpigot new.
   [n > 0] whileTrue:
      [n < width
         ifTrue:
            [n timesRepeat: [output nextPut: (Character digitValue: pidigits next)].
            n to: width do: [:each | output space].
            i := i + n]
         ifFalse:
            [width timesRepeat: [output nextPut: (Character digitValue: pidigits next)].
            i := i + width].

      output tab; nextPut: $:; print: i; nl.

      n := n - width]
    ]

]

Eval [
    | t |
    t := Time millisecondsToRun: [ Pidigit pidigits4 ].
    (t asString, ' milliseconds to run') displayNl
]

