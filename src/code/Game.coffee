class Game
	@FPS = 25
	@STATES =
		MENU: 1
		PLAYING: 2

	state: Game.STATES.MENU

	constructor:(@repeater, @view, @keyboard)->

	start:()->
		@gameLoop ?= @repeater.create @tick, Game.FPS
		@gameLoop.start()

	tick:()=>
		@view.draw @
