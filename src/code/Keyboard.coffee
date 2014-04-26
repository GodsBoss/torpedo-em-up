class Keyboard

	UP = false
	DOWN = true

	KEY_LEFT = 37
	KEY_UP = 38
	KEY_RIGHT = 39
	KEY_DOWN = 40

	KEY_W = 87
	KEY_A = 65
	KEY_S = 83
	KEY_D = 68

	KEY_SPACE = 32

	KEY_1 = 49
	KEY_9 = 57

	constructor:()->
		@keyStates = {}
		@lastNumberKey = KEY_1

	keyDown:(event)=>
		@setKeyValue event.keyCode, DOWN
		@handleNumberKey event.keyCode

	keyUp:(event)=>
		@setKeyValue event.keyCode, UP

	setKeyValue:(code, value)->
		@keyStates[code] = value

	handleNumberKey:(code)->
		if code >= KEY_1 and code <= KEY_9
			@lastNumberKey = code - KEY_1 + 1

	shoots:()->
		@keyStates[KEY_SPACE]

	up:()->
		!!(@keyStates[KEY_UP] or @keyStates[KEY_W])

	down:()->
		!!(@keyStates[KEY_DOWN] or @keyStates[KEY_S])

	left:()->
		!!(@keyStates[KEY_LEFT] or @keyStates[KEY_A])

	right:()->
		!!(@keyStates[KEY_RIGHT] or @keyStates[KEY_D])
