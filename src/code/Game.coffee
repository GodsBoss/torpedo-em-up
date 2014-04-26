class Game
	@FPS = 25

	constructor:(@repeater)->

	start:()->
		@gameLoop ?= @repeater.create @tick, Game.FPS
		@gameLoop.start()

	tick:()=>
