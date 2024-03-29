
Integer extend [

    tinyBenchmarks [
        <category: 'benchmarks'>

        | t1 t2 r n1 n2 |
        n1 := 1 bitShift: self.
        [ t1 := Time millisecondsToRun: [ n1 benchmark ].
          t1 < 5000 ] whileTrue:[ n1 := n1 * 2 ].

        n2 := 24 + self.
        [ t2 := Time millisecondsToRun: [r := n2 benchFib].
          t2 < 5000] whileTrue:[ n2 := n2 + 1 ].

        ^((n1 * 500000 * 1000) // t1) printString, ' bytecodes/sec; ', ((r * 1000) // t2) printString, ' sends/sec'
    ]

    benchFib [
        <category: 'benchmarks'>

        ^ self < 2
	    ifTrue: [ 1 ] 
	    ifFalse: [ (self - 1) benchFib + (self - 2) benchFib + 1 ]
    ]

    benchmark [
        <category: 'benchmarks'>

        | size flags prime k count |
        size := 8190.
        flags := Array new: size.
        self timesRepeat: [
	    count := 0.
	    flags atAllPut: true.
	    1 to: size do:
	        [:i | (flags at: i) ifTrue:
		    [prime := i + 1.
		    k := i + prime.
		    [k <= size] whileTrue:
		        [flags at: k put: false.
		        k := k + prime].
		    count := count + 1]]].
        ^ count
    ]
]

Eval [
    Transcript showCr: 12 tinyBenchmarks
]

