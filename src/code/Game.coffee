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
		if @state is Game.STATES.MENU
			@handleMenu()
		if @state is Game.STATES.PLAYING
			@handlePlaying()
		@view.draw @

	handleMenu:()->
		if @keyboard.shoots()
			@time = 0
			@state = Game.STATES.PLAYING

	handlePlaying:()->
