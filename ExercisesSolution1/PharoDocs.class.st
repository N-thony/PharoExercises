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
	        class instVarNames do:[ :instVar | 
		           Transcript show: '++++++++++++++++++++++++++++++++';cr.
		           Transcript show: 'Instance variable: ', instVar;cr.
		     "Transcript show: 'Method reference: ', (instVar methodReference name);cr. "   
		     ].
	       class methodDictionary keys do: [ :method |
		          | senders |
		          Transcript show: '*********************************';cr.
		          Transcript show: 'Method: ', method;cr.
		          senders:= SystemNavigation default allCallsOn: method.
		          Transcript show: 'Senders: ', (senders collect:[ :sender | sender name ]) asString;cr.
		 ].
	 ]
]
