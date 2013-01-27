Object subclass: BinaryTree [

    BinaryTree class >> binarytrees [
        self new
            binarytrees: 16 to: stdout
    ]

    binarytrees: n to: output [
   | minDepth maxDepth stretchDepth check longLivedTree iterations |
   minDepth := 4.
   maxDepth := minDepth + 2 max: n.
   stretchDepth := maxDepth + 1.

   check := (TreeNode bottomUpTree: 0 depth: stretchDepth) itemCheck.
   output
      nextPutAll: 'stretch tree of depth '; print: stretchDepth; tab;
      nextPutAll: ' check: '; print: check; nl.

   longLivedTree := TreeNode bottomUpTree: 0 depth: maxDepth.
   minDepth to: maxDepth by: 2 do: [:depth|
      iterations := 1 bitShift: maxDepth - depth + minDepth.

      check := 0.
      1 to: iterations do: [:i|
         check := check + (TreeNode bottomUpTree: i depth: depth) itemCheck.
         check := check + (TreeNode bottomUpTree: -1*i depth: depth) itemCheck
         ].
      output
         print:  (2*iterations); tab;
         nextPutAll: ' trees of depth '; print: depth; tab;
         nextPutAll: ' check: '; print: check; nl
      ].

   output
      nextPutAll: 'long lived tree of depth '; print: maxDepth; tab;
      nextPutAll: ' check: '; print: longLivedTree itemCheck; nl
    ]
]

Eval [
    | t |
    t := Time millisecondsToRun: [ BinaryTree binarytrees ].
    (t asString, ' milliseconds to run') displayNl.
    "ObjectMemory current edenSize printNl.
    ObjectMemory current edenUsedBytes printNl.
    ObjectMemory current survSpaceSize printNl.
    ObjectMemory current survSpaceUsedBytes printNl.
    ObjectMemory current fixedSpaceSize printNl.
    ObjectMemory current fixedSpaceUsedBytes printNl.
    ObjectMemory current oldSpaceSize printNl.
    ObjectMemory current oldSpaceUsedBytes printNl.
    'Number of scavenges: ' display.
    ObjectMemory current numScavenges printNl.
    'Number of global GCs: ' display.
    ObjectMemory current numGlobalGCs printNl.
    'Number of compactions: ' display.
    ObjectMemory current numCompactions printNl.
    ObjectMemory current timeToScavenge printNl.
    ObjectMemory current timeToCollect printNl.
    ObjectMemory current timeToCompact printNl.
    ObjectMemory current allocFailures printNl.
    ObjectMemory current allocMatches printNl."
]

