!classDefinition: #OOStackTest category: #'Stack-Solution-1b'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Solution-1b'!

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 19:00:40'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := self createStack.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 19:00:51'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := self createStack.
	stack push: 'Something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 19:00:55'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := self createStack.
	stack push: 'Something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 19:01:00'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := self createStack.
	pushedObject := 'Something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 19:01:04'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := self createStack.
	firstPushedObject := 'First'.
	secondPushedObject := 'Second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 19:01:10'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := self createStack.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 19:01:14'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := self createStack.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 19:01:20'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := self createStack.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 19:01:27'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := self createStack.
	stack push: 'Something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 19:01:33'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := self createStack.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!OOStackTest methodsFor: 'setup' stamp: 'HAW 4/14/2017 19:04:08'!
createStack

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackTest class' category: #'Stack-Solution-1b'!
OOStackTest class
	instanceVariableNames: ''!

!OOStackTest class methodsFor: 'testing' stamp: 'HAW 4/14/2017 19:02:34'!
isAbstract

	^true! !


!classDefinition: #OOLimitedStackTest category: #'Stack-Solution-1b'!
OOStackTest subclass: #OOLimitedStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Solution-1b'!

!OOLimitedStackTest methodsFor: 'setup' stamp: 'HAW 4/14/2017 19:04:53'!
createStack

	^OOLimitedStack to: 10! !


!OOLimitedStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 19:07:43'!
test11LimitMustBeStrictlyPositive

	self 
		should: [ OOLimitedStack to: 0 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: OOLimitedStack limitMustBeStrictlyPositiveErrorMessage]! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 19:09:25'!
test12LimitMustBeInteger

	self 
		should: [ OOLimitedStack to: 1.5 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: OOLimitedStack limitMustBeIntegerErrorMessage]! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 19:12:08'!
test13CanNotPushWhenStackIsFull

	| stack |
	
	stack := OOLimitedStack to: 1.
	stack push: 10.
	
	self 
		should: [ stack push: 20 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: OOLimitedStack stackIsFullErrorMessage.
			self assert: stack size equals: 1.
			self assert: stack top equals: 10 ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOLimitedStackTest class' category: #'Stack-Solution-1b'!
OOLimitedStackTest class
	instanceVariableNames: ''!

!OOLimitedStackTest class methodsFor: 'testing' stamp: 'HAW 4/14/2017 19:04:33'!
isAbstract

	^false! !


!classDefinition: #OOUnlimitedStackTest category: #'Stack-Solution-1b'!
OOStackTest subclass: #OOUnlimitedStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Solution-1b'!

!OOUnlimitedStackTest methodsFor: 'setup' stamp: 'HAW 4/14/2017 19:03:17'!
createStack

	^OOUnlimitedStack new! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOUnlimitedStackTest class' category: #'Stack-Solution-1b'!
OOUnlimitedStackTest class
	instanceVariableNames: ''!

!OOUnlimitedStackTest class methodsFor: 'testing' stamp: 'HAW 4/14/2017 19:03:41'!
isAbstract

	^false! !


!classDefinition: #OOStack category: #'Stack-Solution-1b'!
Object subclass: #OOStack
	instanceVariableNames: 'contents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Solution-1b'!

!OOStack methodsFor: 'initialization' stamp: 'HAW 4/14/2017 17:58:07'!
initialize

	contents := OrderedCollection new! !


!OOStack methodsFor: 'testing' stamp: 'NR 4/25/2024 16:32:43'!
isEmpty

	^contents isEmpty ! !

!OOStack methodsFor: 'testing' stamp: 'HAW 4/14/2017 19:19:00'!
isFull

	self subclassResponsibility ! !

!OOStack methodsFor: 'testing' stamp: 'HAW 4/14/2017 19:18:46'!
notEmpty
	
	^self isEmpty not! !

!OOStack methodsFor: 'testing' stamp: 'HAW 4/14/2017 19:19:09'!
notFull

	^self isFull not! !


!OOStack methodsFor: 'operations' stamp: 'HAW 4/14/2017 17:59:14'!
pop

	| top |
	
	top := self top.
	contents removeLast.
	
	^ top ! !

!OOStack methodsFor: 'operations' stamp: 'HAW 4/14/2017 22:38:28'!
push: anObject

	self subclassResponsibility ! !

!OOStack methodsFor: 'operations' stamp: 'HAW 4/14/2017 17:59:45'!
top

	^ self state top! !


!OOStack methodsFor: 'size' stamp: 'HAW 4/14/2017 17:58:24'!
size

	^ contents size! !


!OOStack methodsFor: 'private' stamp: 'HAW 4/14/2017 18:00:04'!
state 

	^OOStackState stateFor: self! !

!OOStack methodsFor: 'private' stamp: 'HAW 4/14/2017 18:09:34'!
topWhenEmpty
	
	^self error: self class stackEmptyErrorDescription! !

!OOStack methodsFor: 'private' stamp: 'HAW 4/14/2017 18:07:54'!
topWhenNotEmpty
	
	^contents last! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Solution-1b'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOLimitedStack category: #'Stack-Solution-1b'!
OOStack subclass: #OOLimitedStack
	instanceVariableNames: 'limit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Solution-1b'!

!OOLimitedStack methodsFor: 'initialization' stamp: 'HAW 4/14/2017 19:05:57'!
initializeTo: aLimit

	limit := aLimit ! !


!OOLimitedStack methodsFor: 'testing' stamp: 'HAW 4/14/2017 19:14:28'!
isFull
	
	^self size = limit! !


!OOLimitedStack methodsFor: 'private' stamp: 'NR 4/25/2024 06:00:24'!
pushWhenEmpty: anObject

	^contents add: anObject ! !

!OOLimitedStack methodsFor: 'private' stamp: 'HAW 4/14/2017 19:15:20'!
pushWhenFull: anObject

	self error: self class stackIsFullErrorMessage! !

!OOLimitedStack methodsFor: 'private' stamp: 'NR 4/25/2024 16:23:11'!
pushWhenNotEmpty: anObject

	^self pushWhenEmpty: anObject ! !

!OOLimitedStack methodsFor: 'private' stamp: 'NR 4/25/2024 16:21:52'!
topWhenFull
	
	^self topWhenNotEmpty ! !


!OOLimitedStack methodsFor: 'operations' stamp: 'HAW 4/14/2017 22:37:43'!
push: anObject

	^self state push: anObject! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOLimitedStack class' category: #'Stack-Solution-1b'!
OOLimitedStack class
	instanceVariableNames: ''!

!OOLimitedStack class methodsFor: 'instance creation' stamp: 'HAW 4/14/2017 19:09:58'!
to: aLimit

	aLimit strictlyPositive ifFalse: [ self error: self limitMustBeStrictlyPositiveErrorMessage ].
	aLimit isInteger ifFalse: [ self error: self limitMustBeIntegerErrorMessage ].
	
	^self new initializeTo: aLimit! !


!OOLimitedStack class methodsFor: 'error messages' stamp: 'HAW 4/14/2017 19:10:17'!
limitMustBeIntegerErrorMessage
	
	^'Limit must be integer'! !

!OOLimitedStack class methodsFor: 'error messages' stamp: 'HAW 4/14/2017 19:08:57'!
limitMustBeStrictlyPositiveErrorMessage
	
	^'Limit must be strictly positive'! !

!OOLimitedStack class methodsFor: 'error messages' stamp: 'HAW 4/14/2017 19:15:36'!
stackIsFullErrorMessage
	
	^'Stack is Full'! !


!classDefinition: #OOUnlimitedStack category: #'Stack-Solution-1b'!
OOStack subclass: #OOUnlimitedStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Solution-1b'!

!OOUnlimitedStack methodsFor: 'testing' stamp: 'HAW 4/14/2017 19:16:38'!
isFull
	
	^false! !



!OOUnlimitedStack methodsFor: 'operations' stamp: 'HAW 4/14/2017 22:38:13'!
push: anObject

	contents add: anObject ! !


!classDefinition: #OOStackState category: #'Stack-Solution-1b'!
Object subclass: #OOStackState
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Solution-1b'!

!OOStackState methodsFor: 'initialization' stamp: 'HAW 4/14/2017 18:06:20'!
initializeFor: aStack

	stack := aStack ! !


!OOStackState methodsFor: 'stack operations' stamp: 'HAW 4/14/2017 18:55:05'!
push: anObject
	
	self subclassResponsibility ! !

!OOStackState methodsFor: 'stack operations' stamp: 'HAW 4/14/2017 18:12:08'!
top
	
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackState class' category: #'Stack-Solution-1b'!
OOStackState class
	instanceVariableNames: ''!

!OOStackState class methodsFor: 'state selection' stamp: 'HAW 4/14/2017 18:02:20'!
canHandle: aStack

	self subclassResponsibility ! !

!OOStackState class methodsFor: 'state selection' stamp: 'HAW 4/14/2017 18:02:07'!
stateFor: aStack

	^(self subclasses detect: [:aStackStateClass | aStackStateClass canHandle: aStack ]) for: aStack! !


!OOStackState class methodsFor: 'instance creation' stamp: 'HAW 4/14/2017 18:12:47'!
for: aStack

	^self new initializeFor: aStack! !


!classDefinition: #OOEmptyStackState category: #'Stack-Solution-1b'!
OOStackState subclass: #OOEmptyStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Solution-1b'!

!OOEmptyStackState methodsFor: 'stack operations' stamp: 'HAW 4/14/2017 18:53:13'!
push: anObject

	^stack pushWhenEmpty: anObject! !

!OOEmptyStackState methodsFor: 'stack operations' stamp: 'HAW 4/14/2017 18:08:58'!
top
	
	^stack topWhenEmpty! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOEmptyStackState class' category: #'Stack-Solution-1b'!
OOEmptyStackState class
	instanceVariableNames: ''!

!OOEmptyStackState class methodsFor: 'state selection' stamp: 'HAW 4/14/2017 18:02:53'!
canHandle: aStack

	^aStack isEmpty! !


!classDefinition: #OOFullStackState category: #'Stack-Solution-1b'!
OOStackState subclass: #OOFullStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Solution-1b'!

!OOFullStackState methodsFor: 'stack operations' stamp: 'HAW 4/14/2017 19:13:24'!
push: anObject

	^stack pushWhenFull: anObject! !

!OOFullStackState methodsFor: 'stack operations' stamp: 'HAW 4/14/2017 19:13:34'!
top
	
	^stack topWhenFull! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOFullStackState class' category: #'Stack-Solution-1b'!
OOFullStackState class
	instanceVariableNames: ''!

!OOFullStackState class methodsFor: 'state selection' stamp: 'HAW 4/14/2017 19:12:52'!
canHandle: aStack

	^aStack isFull! !


!classDefinition: #OONotEmptyAndNotFullStackState category: #'Stack-Solution-1b'!
OOStackState subclass: #OONotEmptyAndNotFullStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Solution-1b'!

!OONotEmptyAndNotFullStackState methodsFor: 'stack operations' stamp: 'HAW 4/14/2017 18:54:20'!
push: anObject

	^stack pushWhenNotEmpty: anObject ! !

!OONotEmptyAndNotFullStackState methodsFor: 'stack operations' stamp: 'HAW 4/14/2017 18:07:35'!
top
	
	^stack topWhenNotEmpty! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OONotEmptyAndNotFullStackState class' category: #'Stack-Solution-1b'!
OONotEmptyAndNotFullStackState class
	instanceVariableNames: ''!

!OONotEmptyAndNotFullStackState class methodsFor: 'state selection' stamp: 'HAW 4/14/2017 19:13:05'!
canHandle: aStack

	^aStack notEmpty and: [ aStack notFull]! !
