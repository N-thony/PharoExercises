Class {
	#name : #PharoDocs,
	#superclass : #Object,
	#category : #ExercisesSolution1
}

{ #category : #'as yet unclassified' }
PharoDocs >> generateDocumentationForPackage: packageName [
  
      | tmpPackage lstClasses |
      tmpPackage:= packageName asPackage.
      lstClasses:= tmpPackage classes.
      Transcript show: 'Documentation for package:', packageName;cr.
      lstClasses do:[ :class |
	        Transcript show: '==============================================';cr.
	        Transcript show: 'Class: ', class name ; cr.
	        Transcript show: 'Superclass: ', class superclass name;cr.
	        Transcript show: 'Subclasses: ', (class subclasses collect:[ :subclass | subclass name ]) asString;cr.
	        Transcript show: 'Instance variable: ', (class instVarNames collect:[ :instVar | instVar name ]) asString;cr.
	        class methodDictionary keys do: [ :method |
		          Transcript show: '*********************************';cr.
		          Transcript show: 'Method: ', method selector;cr.
		          Transcript show: 'okkk';cr.
		          Transcript show: 'Senders: ', (method senders collect: [ :sender | sender methodClass name, '>>', sender selector ]);cr.
		          Transcript show: 'Instances Variables methodes reference: ', (method literals select: [ :literal | (literal isVariableBinding and: [ class instVarNames includes: literal key ]) ]) keys asString;cr.
		          
		 ].
	 ].
]
