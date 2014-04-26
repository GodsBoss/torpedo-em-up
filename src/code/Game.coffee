class Game
	@FPS = 25

	@STATES =
		MENU: 1
		PLAYING: 2

	@handlers = {}
	@handlers[@STATES.MENU] = 'handleMenu'
	@handlers[@STATES.PLAYING] = 'handlePlaying'

	state: Game.STATES.MENU

	constructor:(@repeater, @view, @keyboard)->

	start:()->
		@gameLoop ?= @repeater.create @tick, Game.FPS
		@gameLoop.start()

	tick:()=>
		@[Game.handlers[@state]]()
		@view.draw @

	handleMenu:()=>
		if @keyboard.shoots()
			@state = Game.STATES.PLAYING
			@createWorld()

	createWorld:()=>
		@world = new World()
		player = Player.createDefault()
		@world.addPlayer player

	handlePlaying:()->
