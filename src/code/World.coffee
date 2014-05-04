class World
	constructor:(@collider)->
		@time = 0
		@enemyBuffer = 0
		@bubbleBuffer = 0
		@torpedos = []
		@enemies = []
		@fx = []
		@points = 0
		@powerUps = []
		@systems = []

	addSystem:(system)->
		@systems.push system

	addPlayer:(@player)->

	pass:(time)->
		@addTime time
		@player.pass time
		for entities in ['torpedos', 'enemies', 'powerUps']
			@[entities].forEach (entity) -> entity.pass time
			@[entities] = @[entities].filter (entity) -> not entity.isObsolet()
		@handleFx time
		for system in @systems
			system.handle @, time

	addTime:(time)->
		@time += time

	createTorpedo:(x, y, vx, vy)->
		torpedo = new Torpedo
		torpedo.setPosition x, y
		torpedo.setVelocity vx, vy
		torpedo.setStrength @player.attack
		@torpedos.push torpedo
		@addBubbles torpedo

	handleFx:(time)->
		@fx.forEach (fx)-> fx.pass time
		@fx = @fx.filter (fx) -> not fx.isObsolet()

	addBubbles:(position)->
		bubbles = new Bubbles
		bubbles.setPosition position.x, position.y
		@fx.push bubbles

	getEntities:(type)->
		switch type
			when 'player' then [@player]
			when 'torpedo' then @torpedos
			when 'enemy' then @enemies
			when 'powerUp' then @powerUps
			else []
