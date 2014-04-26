class Game
	@FPS = 25
	@STATES =
		MENU: 1

	state: Game.STATES.MENU

	constructor:(@repeater, @view)->

	start:()->
		@gameLoop ?= @repeater.create @tick, Game.FPS
		@gameLoop.start()

	tick:()=>
		@view.draw @
