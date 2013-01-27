Object subclass: TreeNode [

    TreeNode class >> left: leftChild right: rightChild item: anItem [
        ^(self new) 
            left: leftChild right: rightChild item: anItem
    ]

    TreeNode class >> bottomUpTree: anItem depth: anInteger [
        ^(anInteger > 0) 
            ifTrue: [
                self 
                    left: (self bottomUpTree: 2*anItem - 1 depth: anInteger - 1) 
                    right: (self bottomUpTree: 2*anItem depth: anInteger - 1)  
                    item: anItem ]
            ifFalse: [self left: nil right: nil item: anItem]
    ]
    | left right item |

    left: leftChild right: rightChild item: anItem [
        left := leftChild.
        right := rightChild.
        item := anItem
    ]

    itemCheck [
        ^left isNil 
            ifTrue: [item] ifFalse: [item + (left itemCheck - right itemCheck)]
    ]
]
