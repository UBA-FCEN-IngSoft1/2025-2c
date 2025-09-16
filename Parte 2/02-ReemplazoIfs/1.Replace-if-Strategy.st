!classDefinition: #Automobile category: '1.Replace-if-Strategy'!
Object subclass: #Automobile
	instanceVariableNames: 'speed engineType'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Strategy'!

!Automobile methodsFor: 'initialization' stamp: 'NR 9/16/2025 06:35:07'!
initializeWithEngineType: anEngineType
	
	engineType := anEngineType.
	speed := 0 * kilometer / hour! !


!Automobile methodsFor: 'move' stamp: 'NR 9/16/2025 06:40:40'!
accelerate
	
	engineType = #ElectricEngine ifTrue: [ speed := speed + ((speed + (5 * kilometer / hour))* 2) ].
	engineType = #GasolineEngine ifTrue: [ speed := speed + (10 * kilometer / hour) ].
	engineType = #JetFueledEngine ifTrue: [ speed := speed + (((speed amount + 1) ^ 2) * kilometer / hour) ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Automobile class' category: '1.Replace-if-Strategy'!
Automobile class
	instanceVariableNames: ''!

!Automobile class methodsFor: 'instance creation' stamp: 'NR 9/16/2025 06:27:44'!
electric

	^ self new initializeWithEngineType: #ElectricEngine

! !

!Automobile class methodsFor: 'instance creation' stamp: 'NR 9/16/2025 06:28:02'!
gasoline

	^ self new initializeWithEngineType: #GasolineEngine! !

!Automobile class methodsFor: 'instance creation' stamp: 'NR 9/16/2025 06:28:18'!
jetFueled

	^ self new initializeWithEngineType:  #JetFueledEngine ! !
