Class {
	#name : #MatrixTrans,
	#superclass : #Object,
	#instVars : [
		'sparseMatrix',
		'compactMatrix'
	],
	#category : #ExercisesSolution1
}

{ #category : #initialization }
MatrixTrans >> convertCompactToSparse [
"This function convert a compact matric to a sparse matrix"
      | tpCompactMatrix tpSparseMatrix rows columns sizeCompactMatrix |
      
      tpCompactMatrix:= compactMatrix.
      "Assuming a sparse matrix of size 4x5"
      rows:= 4.
      columns:= 5.
      
      "Initialize the sparse matrix with zeros"
      tpSparseMatrix:= ( rows to:1 by: -1 ) collect: [ :i |
	       ( columns to:1 by: -1 ) collect: [ :j | 0 ].
	   ].
     
     sizeCompactMatrix:= (tpCompactMatrix at:1) size.
     "Fill in the non zeros values in sparse matrix from the compact matrix"
     1 to: sizeCompactMatrix do:[ :i |
	         | row col element iRow iCol |
	         row:= (tpCompactMatrix at:1) at: i.
	         col:= (tpCompactMatrix at:2) at: i.
	         element:= (tpCompactMatrix at:3) at: i.
	         "iRow and iCol Needed to get the correct index in the sparse matrix"
	         iRow:= row + 1.
	         iCol:= col + 1.
	         element ~=0 ifTrue: [ 
		          (tpSparseMatrix at: iRow) at:iCol put: element  
		      ]
	  ].
^tpSparseMatrix






















      
]

{ #category : #initialization }
MatrixTrans >> convertSparseToCompact [	
"This function convert a sparse matrix to a compact matrix"	
	| tpSparse tpCompact rows columns size k |
	 
	tpSparse:= sparseMatrix.
	rows:= tpSparse size.
	columns:= (tpSparse at:1) size.
	
	size:=0.
   1 to:rows do:[ :i |
	  1 to: columns do:[ :j |
		   | element |
		   element:= (tpSparse at:i) at:j.
		   element ~=0 ifTrue:[ size:= size + 1]
		 ].
	].

   "Assuming a sparse matrix of 3xSize and initialize it with zeros"
    tpCompact:= ( 3 to:1 by: -1 ) collect: [ :i |
	       ( size to:1 by: -1 ) collect: [ :j | 0 ].
	].
   
"   tpCompact:= Array new:3.
   1 to: 3 do:[ :i |
       tpCompact at: i put: (Array new: size)	
	 ]."
   
   k:=1.
   1 to: rows do:[ :i |
	   1 to: columns do:[ :j | 
		   | element |
		   element:= (tpSparse at:i) at:j.
		   element ~=0 ifTrue: [ 
			   (tpCompact at:1) at:k put: (i - 1).
			   (tpCompact at:2) at:k put: (j - 1).
			   (tpCompact at:3) at:k put:element.
			   Transcript show: element;cr.
			   k:= k + 1.
			]
		].
	].

^tpCompact






   
]

{ #category : #initialization }
MatrixTrans >> initialize [
     super initialize.
     sparseMatrix:= #( #(0 0 3 0 4) #(0 0 5 7 0) #(0 0 0 0 0) #(0 2 6 0 0) ).
     compactMatrix:= #( #(0 0 1 1 3 3) #(2 4 2 3 1 2) #(3 4 5 7 2 6) )
]
