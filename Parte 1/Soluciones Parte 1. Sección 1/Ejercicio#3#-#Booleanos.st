!classDefinition: #BooleanosTest category: 'Ejercicio 3 - Booleanos'!
DenotativeObject subclass: #BooleanosTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 3 - Booleanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BooleanosTest class' category: 'Ejercicio 3 - Booleanos'!
BooleanosTest class
	instanceVariableNames: ''!

!BooleanosTest class methodsFor: 'test' stamp: 'ARM 3/26/2018 19:39:46'!
test01NegacionDeVerdaderoEsFalso

	Assert that: Verdadero no isEqualTo: Falso! !

!BooleanosTest class methodsFor: 'test' stamp: 'ARM 3/26/2018 19:49:39'!
test02NegacionDeFalsoEsVerdadero

	Assert that: Falso no isEqualTo: Verdadero! !

!BooleanosTest class methodsFor: 'test' stamp: 'ARM 3/26/2018 20:00:38'!
test03VerdaderoYFalsoEsFalso

	Assert that: (Verdadero y: Falso) isEqualTo: Falso! !

!BooleanosTest class methodsFor: 'test' stamp: 'ARM 3/26/2018 20:03:54'!
test04VerdaderoYVerdaderoEsVerdadero

	Assert that: (Verdadero y: Verdadero) isEqualTo: Verdadero! !

!BooleanosTest class methodsFor: 'test' stamp: 'ARM 3/26/2018 20:06:19'!
test05FalsoYVerdaderoEsFalso

	Assert that: (Falso y: Verdadero) isEqualTo: Falso! !

!BooleanosTest class methodsFor: 'test' stamp: 'ARM 3/26/2018 20:15:58'!
test06FalsoOVerdaderoEsVerdadero

	Assert that: (Falso o: Verdadero) isEqualTo: Verdadero! !

!BooleanosTest class methodsFor: 'test' stamp: 'ARM 3/26/2018 20:21:45'!
test07VerdaderoOFalsoEsVerdadero

	Assert that: (Verdadero o: Falso) isEqualTo: Verdadero! !

!BooleanosTest class methodsFor: 'test' stamp: 'ARM 9/5/2025 20:56:47'!
test08VerdaderoSiVerdaderoEvaluaClosure
	
	Verdadero siVerdadero: [^self].
	
	Assert fail
	! !

!BooleanosTest class methodsFor: 'test' stamp: 'ARM 9/5/2025 21:01:06'!
test09VerdaderoSiFalsoNoEvaluaClosure

	Verdadero siFalso: [Assert fail]! !

!BooleanosTest class methodsFor: 'test' stamp: 'ARM 9/5/2025 18:22:36'!
test10FalsoSiFalsoEvaluaClosure

	| evaluación |

	evaluación := #NoRealizada.
	
	Falso siFalso: [evaluación := #Realizada].

	Assert that: evaluación isEqualTo: #Realizada! !

!BooleanosTest class methodsFor: 'test' stamp: 'ARM 9/5/2025 18:22:57'!
test11FalsoSiVerdaderoNoEvaluaClosure

	| evaluación |

	evaluación := #NoRealizada.
	
	Falso siVerdadero: [evaluación := #Realizada].

	Assert that: evaluación isEqualTo: #NoRealizada! !


!classDefinition: #Falso category: 'Ejercicio 3 - Booleanos'!
DenotativeObject subclass: #Falso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 3 - Booleanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Falso class' category: 'Ejercicio 3 - Booleanos'!
Falso class
	instanceVariableNames: ''!

!Falso class methodsFor: 'operación' stamp: 'ARM 3/26/2018 19:53:56'!
no
	^Verdadero! !

!Falso class methodsFor: 'operación' stamp: 'ARM 3/26/2018 20:21:09'!
o: unBooleano 
	^unBooleano! !

!Falso class methodsFor: 'operación' stamp: 'ARM 3/26/2018 20:12:19'!
y: unBooleano

	^self! !


!Falso class methodsFor: 'condición' stamp: 'ARM 9/5/2025 18:19:42'!
siFalso: accionARealizar 
	accionARealizar value! !

!Falso class methodsFor: 'condición' stamp: 'ARM 9/5/2025 18:20:06'!
siVerdadero: accionAIgnorar 
	! !


!classDefinition: #Verdadero category: 'Ejercicio 3 - Booleanos'!
DenotativeObject subclass: #Verdadero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 3 - Booleanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Verdadero class' category: 'Ejercicio 3 - Booleanos'!
Verdadero class
	instanceVariableNames: ''!

!Verdadero class methodsFor: 'operación' stamp: 'ARM 3/26/2018 19:47:04'!
no
	^Falso! !

!Verdadero class methodsFor: 'operación' stamp: 'ARM 3/26/2018 20:23:21'!
o: unBooleano 
	^self! !

!Verdadero class methodsFor: 'operación' stamp: 'ARM 3/26/2018 19:59:46'!
y
	self shouldBeImplemented.! !

!Verdadero class methodsFor: 'operación' stamp: 'ARM 3/26/2018 20:04:42'!
y: unBooleano 
	^unBooleano! !


!Verdadero class methodsFor: 'condición' stamp: 'ARM 9/5/2025 18:19:58'!
siFalso: accionAIgnorar! !

!Verdadero class methodsFor: 'condición' stamp: 'ARM 9/5/2025 21:00:04'!
siVerdadero: accionARealizar

	accionARealizar value! !
