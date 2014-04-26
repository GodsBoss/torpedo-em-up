class Game
	@FPS = 25

	constructor:(@repeater, @view)->

	start:()->
		@gameLoop ?= @repeater.create @tick, Game.FPS
		@gameLoop.start()

	tick:()=>
		@view.draw @
