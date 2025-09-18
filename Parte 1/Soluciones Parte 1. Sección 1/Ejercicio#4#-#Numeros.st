!classDefinition: #I category: 'Ejercicio 4 - Numeros'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4 - Numeros'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: 'Ejercicio 4 - Numeros'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'private' stamp: 'ARM 6/27/2020 19:13:48'!
dividendoConUnoComoDivisor
	
	^self! !

!I class methodsFor: 'private' stamp: 'ARM 12/5/2020 23:43:03'!
divisionSiendoLaDiferenciaMasUnoEntre: dividendo y: divisor

	^I! !

!I class methodsFor: 'private' stamp: 'ARM 6/27/2020 13:48:25'!
multiplicarPorNumeroMayorAUno: unNumeroMayorAUno 

	^unNumeroMayorAUno! !

!I class methodsFor: 'private' stamp: 'ARM 6/27/2020 13:51:07'!
sustraerDe: minuendo 
	
	^minuendo previous! !

!I class methodsFor: 'private' stamp: 'ARM 12/5/2020 23:19:58'!
vecesDivideA: dividend 
	^dividend! !


!I class methodsFor: 'next & previous' stamp: 'ARM 3/19/2018 15:37:31'!
next
	^ II.! !

!I class methodsFor: 'next & previous' stamp: 'ARM 3/19/2018 15:30:11'!
previous

	self error: 'El uno es el primer numero natural'! !


!I class methodsFor: 'operaciones aritmeticas' stamp: 'ARM 9/5/2025 18:23:26'!
* multiplicando

	^multiplicando! !

!I class methodsFor: 'operaciones aritmeticas' stamp: 'ARM 9/5/2025 18:28:49'!
+ sumando

	^sumando next! !

!I class methodsFor: 'operaciones aritmeticas' stamp: 'ARM 9/5/2025 18:29:00'!
- sustraendo

	self error: self descripcionDeErrorDeNumerosNegativosNoSoportados! !

!I class methodsFor: 'operaciones aritmeticas' stamp: 'ARM 6/27/2020 19:13:48'!
/ dividendo

	dividendo dividendoConUnoComoDivisor! !

!I class methodsFor: 'operaciones aritmeticas' stamp: 'ARM 3/19/2018 16:38:01'!
<= aNumber 
	^true! !


!I class methodsFor: 'error' stamp: 'ARM 9/18/2025 18:00:47'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^'No se puede dividir por un número mayor'! !

!I class methodsFor: 'error' stamp: 'ARM 3/26/2018 12:44:24'!
descripcionDeErrorDeNumerosNegativosNoSoportados

	^'En el dominio de los naturales, no se puede restar un numero - otro numero mayor o igual'! !


!classDefinition: #II category: 'Ejercicio 4 - Numeros'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4 - Numeros'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: 'Ejercicio 4 - Numeros'!
II class
	instanceVariableNames: 'previous next'!

!II class methodsFor: 'operaciones aritmeticas' stamp: 'ARM 9/5/2025 18:23:32'!
* multiplicando

	^multiplicando multiplicarPorNumeroMayorAUno: self! !

!II class methodsFor: 'operaciones aritmeticas' stamp: 'ARM 9/5/2025 18:24:03'!
+ sumando

	^self previous + sumando next! !

!II class methodsFor: 'operaciones aritmeticas' stamp: 'ARM 6/27/2020 13:51:52'!
- sustraendo

	^sustraendo sustraerDe: self! !

!II class methodsFor: 'operaciones aritmeticas' stamp: 'ARM 9/18/2025 18:00:47'!
/ divisor

	divisor <= self ifFalse:[self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].

	^divisor vecesDivideA: self! !


!II class methodsFor: 'operaciones privadas' stamp: 'ARM 3/19/2018 16:41:39'!
<= aNumber 
	aNumber = I ifTrue: [^false].
	^self previous <= aNumber previous! !

!II class methodsFor: 'operaciones privadas' stamp: 'ARM 6/27/2020 19:13:48'!
dividendoConUnoComoDivisor

		self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor! !

!II class methodsFor: 'operaciones privadas' stamp: 'ARM 6/27/2020 13:35:43'!
dividirPorUno: anI 
	self shouldBeImplemented.! !

!II class methodsFor: 'operaciones privadas' stamp: 'ARM 12/5/2020 23:42:48'!
divisionSiendoLaDiferenciaMasUnoEntre: dividendo y: divisor

	^(dividendo - divisor) / divisor + I! !

!II class methodsFor: 'operaciones privadas' stamp: 'ARM 9/5/2025 18:23:51'!
multiplicarPorNumeroMayorAUno: multiplicandoMayorAUno 


		^multiplicandoMayorAUno + (multiplicandoMayorAUno * self previous)! !

!II class methodsFor: 'operaciones privadas' stamp: 'ARM 9/9/2025 19:39:22'!
sustraerDe: minuendo
 
	^minuendo previous - self previous	! !

!II class methodsFor: 'operaciones privadas' stamp: 'ARM 12/5/2020 23:42:12'!
vecesDivideA: dividend

	^(dividend + I - self) divisionSiendoLaDiferenciaMasUnoEntre: dividend y: self! !


!II class methodsFor: 'error' stamp: 'ARM 9/18/2025 18:01:41'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^I descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor! !


!II class methodsFor: 'next & previous' stamp: 'ARM 3/20/2018 11:02:43'!
clearNext

	next clearNext.
	next collapse.
	next := nil.
! !

!II class methodsFor: 'next & previous' stamp: 'ARM 4/6/2021 15:28:17'!
nameOfNext
	(self name endsWith: 'CMXCIX') ifTrue:[^(self name withoutSuffix: 'CMXCIX'), 'M'].
	(self name endsWith: 'DCCCXCIX') ifTrue:[^(self name withoutSuffix: 'DCCCXCIX'), 'CM'].
	(self name endsWith: 'CDXCIX') ifTrue:[^(self name withoutSuffix: 'CDXCIX'), 'D'].
	(self name endsWith: 'CCCXCIX') ifTrue:[^(self name withoutSuffix: 'CCCXCIX'), 'CD'].
	(self name endsWith: 'XCIX') ifTrue:[^(self name withoutSuffix: 'XCIX'), 'C'].
	(self name endsWith: 'LXXXIX') ifTrue:[^(self name withoutSuffix: 'LXXXIX'), 'XC'].
	(self name endsWith: 'XLIX') ifTrue:[^(self name withoutSuffix: 'XLIX'), 'L'].
	(self name endsWith: 'XXXIX') ifTrue:[^(self name withoutSuffix: 'XXXIX'), 'XL'].
	(self name endsWith: 'IX') ifTrue:[^(self name withoutSuffix: 'IX'), 'X'].
	(self name endsWith: 'VIII') ifTrue:[^(self name withoutSuffix: 'VIII'), 'IX'].
	(self name endsWith: 'III') ifTrue:[^(self name withoutSuffix: 'III'), 'IV'].
	(self name endsWith: 'IV') ifTrue:[^(self name withoutSuffix: 'IV'), 'V'].
	^self name, 'I'! !

!II class methodsFor: 'next & previous' stamp: 'ARM 9/9/2025 19:48:46'!
next

	next ifNotNil: [^next].
	next := self createChildNamed: self nameOfNext.
	next previous: self.
	
	^next
! !

!II class methodsFor: 'next & previous' stamp: 'ARM 3/19/2018 15:38:06'!
previous

	^previous! !

!II class methodsFor: 'next & previous' stamp: 'ARM 3/19/2018 16:21:49'!
previous: aNumber 
	
	previous := aNumber! !

!II class methodsFor: 'next & previous' stamp: 'ARM 3/20/2018 11:29:48'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]
! !



!II class methodsFor: 'convertion' stamp: 'ARM 9/9/2025 14:51:35'!
adaptToNumber: integer andSend: operation 
	^(self asRomanNumber: integer) perform: operation with: self! !

!II class methodsFor: 'convertion' stamp: 'ARM 9/9/2025 14:51:35'!
asRomanNumber: integer 
	|asRoman|
	asRoman := I.
	integer timesRepeat: [asRoman := asRoman next].
	^asRoman previous ! !


!II class methodsFor: '--** private fileout/in **--' stamp: 'ARM 9/18/2025 18:03:54'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := I.
	next := III.! !


!classDefinition: #III category: 'Ejercicio 4 - Numeros'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4 - Numeros'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: 'Ejercicio 4 - Numeros'!
III class
	instanceVariableNames: ''!

!III class methodsFor: '--** private fileout/in **--' stamp: 'ARM 9/18/2025 18:03:54'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := II.
	next := IV.! !


!classDefinition: #IV category: 'Ejercicio 4 - Numeros'!
III subclass: #IV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4 - Numeros'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IV class' category: 'Ejercicio 4 - Numeros'!
IV class
	instanceVariableNames: ''!

!IV class methodsFor: '--** private fileout/in **--' stamp: 'ARM 9/18/2025 18:03:54'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := III.
	next := nil.! !


!classDefinition: #NumerosNaturalesTest category: 'Ejercicio 4 - Numeros'!
DenotativeObject subclass: #NumerosNaturalesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4 - Numeros'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NumerosNaturalesTest class' category: 'Ejercicio 4 - Numeros'!
NumerosNaturalesTest class
	instanceVariableNames: ''!

!NumerosNaturalesTest class methodsFor: 'tests' stamp: 'ARM 3/26/2018 12:51:26'!
test01UnoMasUnSumandoEsElProximoDelSumando

	Assert that: I + II isEqualTo: II next.! !

!NumerosNaturalesTest class methodsFor: 'tests' stamp: 'ARM 9/18/2025 17:59:17'!
test02NumerosMayoresaUnoSumanBien

	Assert that: II + II isEqualTo: IV.
! !

!NumerosNaturalesTest class methodsFor: 'tests' stamp: 'ARM 3/26/2018 13:12:19'!
test03UnNumeroMenosUnoEsElPrevioDelNumero

	Assert that: II - I isEqualTo: II previous.! !

!NumerosNaturalesTest class methodsFor: 'tests' stamp: 'ARM 9/18/2025 17:59:25'!
test04NumerosMayoresaUnoRestanBien

	Assert that: IV - II isEqualTo: II.! !

!NumerosNaturalesTest class methodsFor: 'tests' stamp: 'ARM 3/26/2018 12:51:02'!
test05RestaNoSoportaNumerosNegativos

	Assert should: [ I - II ] signal: Error withDescription: I descripcionDeErrorDeNumerosNegativosNoSoportados.
! !

!NumerosNaturalesTest class methodsFor: 'tests' stamp: 'ARM 3/26/2018 13:15:53'!
test06UnNumeroMultiplicadoPorUnoEsIgualAlNumero

	Assert that: II * I isEqualTo: II.! !

!NumerosNaturalesTest class methodsFor: 'tests' stamp: 'ARM 9/18/2025 17:59:28'!
test07NumerosMayoresaUnoMultiplicanBien

	Assert that: II * II isEqualTo: IV.! !

!NumerosNaturalesTest class methodsFor: 'tests' stamp: 'ARM 3/26/2018 13:16:46'!
test08UnoMultiplicadoUnoEsIgualAUno

	Assert that: I * I isEqualTo: I.! !

!NumerosNaturalesTest class methodsFor: 'tests' stamp: 'ARM 9/18/2025 17:59:32'!
test09NumerosMayoresaUnoDividenBien

	Assert that: IV / II isEqualTo: II.! !

!NumerosNaturalesTest class methodsFor: 'tests' stamp: 'ARM 3/26/2018 13:17:28'!
test10UnNumeroDivididoUnoEsIgualAlNumero

	Assert that: II / I isEqualTo: II.! !

!NumerosNaturalesTest class methodsFor: 'tests' stamp: 'ARM 3/26/2018 13:17:38'!
test11UnoDivididoUnoEsIgualAUno

	Assert that: I / I isEqualTo: I.! !

!NumerosNaturalesTest class methodsFor: 'tests' stamp: 'ARM 9/18/2025 18:00:47'!
test12DivisionNoSoportaDividirPorUnNumeroMayor

	Assert should: [ III /  IV ] signal: Error withDescription: II descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor.

	Assert should: [ I /  II] signal: Error withDescription: I descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
! !

II initializeAfterFileIn!
III initializeAfterFileIn!
IV initializeAfterFileIn!