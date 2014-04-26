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
		player = Player.createDefault @world
		@world.addPlayer player

	handlePlaying:()->
		@world.pass 1 / Game.FPS
		@handlePlayerMovement()
		@handlePlayerShoots()

	handlePlayerMovement:()->
		@world.player.setMovement
			x: @keyboard.right() - @keyboard.left()
			y: @keyboard.down() - @keyboard.up()

	handlePlayerShoots:()->
		if @keyboard.shoots()
			@world.player.shoot()
