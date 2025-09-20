!classDefinition: #Automobile category: #'1.Replace-if-Strategy-Solucion'!
Object subclass: #Automobile
	instanceVariableNames: 'speed engine'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Strategy-Solucion'!

!Automobile methodsFor: 'initialization' stamp: 'NR 9/16/2025 06:52:52'!
initializeWithEngine: anEngine
	
	engine := anEngine.
	speed := 0 * kilometer / hour! !


!Automobile methodsFor: 'move' stamp: 'NR 9/16/2025 07:00:30'!
accelerate
	
	speed := speed + (engine acceleration: speed)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Automobile class' category: #'1.Replace-if-Strategy-Solucion'!
Automobile class
	instanceVariableNames: ''!

!Automobile class methodsFor: 'instance creation' stamp: 'NR 9/16/2025 06:53:46'!
electric

	^ self new initializeWithEngine: ElectricEngine new

! !

!Automobile class methodsFor: 'instance creation' stamp: 'NR 9/16/2025 06:53:52'!
gasoline

	^ self new initializeWithEngine: GasolineEngine new! !

!Automobile class methodsFor: 'instance creation' stamp: 'NR 9/16/2025 06:53:58'!
jetFueled

	^ self new initializeWithEngine:  JetFueledEngine new! !


!classDefinition: #Engine category: #'1.Replace-if-Strategy-Solucion'!
Object subclass: #Engine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Strategy-Solucion'!

!Engine methodsFor: 'torque' stamp: 'NR 9/16/2025 06:49:41'!
acceleration: currentSpeed

	self subclassResponsibility ! !


!classDefinition: #ElectricEngine category: #'1.Replace-if-Strategy-Solucion'!
Engine subclass: #ElectricEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Strategy-Solucion'!

!ElectricEngine methodsFor: 'torque' stamp: 'NR 9/16/2025 06:49:57'!
acceleration: currentSpeed

	^ (currentSpeed + (5 * kilometer / hour)) * 2! !


!classDefinition: #GasolineEngine category: #'1.Replace-if-Strategy-Solucion'!
Engine subclass: #GasolineEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Strategy-Solucion'!

!GasolineEngine methodsFor: 'torque' stamp: 'NR 9/16/2025 06:50:14'!
acceleration: currentSpeed

	^ 10 * kilometer / hour! !


!classDefinition: #JetFueledEngine category: #'1.Replace-if-Strategy-Solucion'!
Engine subclass: #JetFueledEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Strategy-Solucion'!

!JetFueledEngine methodsFor: 'torque' stamp: 'NR 9/16/2025 06:50:28'!
acceleration: currentSpeed

	^ ((currentSpeed amount + 1) ^ 2) * kilometer / hour! !
