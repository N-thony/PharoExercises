Class {
	#name : #SetTestCase,
	#superclass : #TestCase,
	#category : #ExercisesSolution1
}

{ #category : #tests }
SetTestCase >> testCompactToSparseMatrix [

   | tpSparseMatrix tpCompactMatrix tpExpectedSparseMatrix tpMatrixTrans |

   tpMatrixTrans:= MatrixTrans new.
   tpCompactMatrix:= tpMatrixTrans getCompactMatrix.

   "Call the function to be tested"
   tpSparseMatrix:= tpMatrixTrans convertCompactToSparse.

   "Define the expected compact matrix"
   tpExpectedSparseMatrix:=  #( #(0 0 3 0 4) #(0 0 5 7 0) #(0 0 0 0 0) #(0 2 6 0 0) ).

   "Check the result matches the expect value"
   self assert: ( tpSparseMatrix = tpExpectedSparseMatrix )
]

{ #category : #tests }
SetTestCase >> testGenerateDocumentationForPackage [

     | tpPackageName pharoDoc result |
     
     pharoDoc:= PharoDoc new.
     "Replace Exercice with your desired package name"
     tpPackageName:= 'ExercisesSolution1'.
   
     "Result from the method to generateDocumentationForPackage"
     result:= pharoDoc generateDocumentationForPackage: tpPackageName.

    "Add assertions to verify the expected behavior"
     self assert: (result includesSubstring: 'Documentation for package: ', tpPackageName).
     "Add more assertions as needed based on the expected output of the method"  
]

{ #category : #tests }
SetTestCase >> testSparseToCompactMatrix [

   | tpSparseMatrix tpCompactMatrix tpExpectedCompactMatrix tpMatrixTrans |

   tpMatrixTrans:= MatrixTrans new.
   tpSparseMatrix:= tpMatrixTrans getSparseMatrix.

   "Call the function to be tested"
   tpCompactMatrix:= tpMatrixTrans convertSparseToCompact.

   "Define the expected compact matrix"
   tpExpectedCompactMatrix:= #( #(0 0 1 1 3 3) #(2 4 2 3 1 2) #(3 4 5 7 2 6) ).

   "Check the result matched the expected value"
   self assert: ( tpCompactMatrix = tpExpectedCompactMatrix )
]
