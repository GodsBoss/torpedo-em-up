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
		@afterDeathBuffer = 0
		@highscore = 0

	start:()->
		@gameLoop ?= @repeater.create @tick, Game.FPS
		@gameLoop.start()

	tick:()=>
		@[Game.handlers[@state]]()
		@view.draw @

	handleMenu:()=>
		@afterDeathBuffer = Math.max 0, @afterDeathBuffer - 1 / Game.FPS
		if @keyboard.shoots() and @afterDeathBuffer is 0
			@state = Game.STATES.PLAYING
			@createWorld()

	createWorld:()=>
		@world = new World new Collider
		player = Player.createDefault @world
		collider = new Collider
		torpedoEnemyCollision = new CollisionSystem collider, new TorpedoEnemyCollision
		playerEnemyCollision = new CollisionSystem collider, new PlayerEnemyCollision
		playerPowerUpCollision = new CollisionSystem collider, new PlayerPowerUpCollision
		@world.addSystem torpedoEnemyCollision
		@world.addSystem playerEnemyCollision
		@world.addSystem playerPowerUpCollision
		@world.addSystem new EnemySystem 1/60
		@world.addSystem new RandomBubblesSystem 0.1
		@world.addPlayer player

	handlePlaying:()->
		@world.pass 1 / Game.FPS
		@handlePlayerMovement()
		@handlePlayerShoots()
		@handlePlayerDeath()

	handlePlayerMovement:()->
		@world.player.setMovement
			x: @keyboard.right() - @keyboard.left()
			y: @keyboard.down() - @keyboard.up()

	handlePlayerShoots:()->
		if @keyboard.shoots()
			@world.player.shoot()

	handlePlayerDeath:()->
		if @world.gameOver()
			@state = Game.STATES.MENU
			@afterDeathBuffer = 2
			@highscore = Math.max @highscore, @world.points
