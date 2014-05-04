class World
	BUBBLES_PER_SECOND = 0.1
	ENEMY_GROWTH_FACTOR = 1/60

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
		@addEnemies()
		@player.pass time
		for entities in ['torpedos', 'enemies', 'powerUps']
			@[entities].forEach (entity) -> entity.pass time
			@[entities] = @[entities].filter (entity) -> not entity.isObsolet()
		@handlePlayerPowerUpCollisions()
		@handleFx time
		for system in @systems
			system.handle @, time

	addTime:(time)->
		@time += time
		@enemyBuffer += time * (1 + @time * ENEMY_GROWTH_FACTOR)
		@bubbleBuffer += time

	addEnemies:()->
		if @enemyBuffer > (1 + Math.random()) * 5
			@enemyBuffer -= 5
			if Math.random() < 0.9
				@addFish()
			else
				@addJellyfish()

	addFish:()->
		fish = new Fish
		fish.setPosition 330, Math.random() * 200
		fish.chooseDirection()
		@enemies.push fish

	addJellyfish:()->
		jelly = new Jellyfish
		jelly.setPosition 330, Math.random() * 160 + 20
		jelly.setVelocity -10, 0
		@enemies.push jelly

	createTorpedo:(x, y, vx, vy)->
		torpedo = new Torpedo
		torpedo.setPosition x, y
		torpedo.setVelocity vx, vy
		torpedo.setStrength @player.attack
		@torpedos.push torpedo
		@addBubbles torpedo

	handleFx:(time)->
		if @bubbleBuffer > 1 / BUBBLES_PER_SECOND
			@bubbleBuffer -= 1 / BUBBLES_PER_SECOND
			bubble = new Bubble
			bubble.setPosition Math.random() * 320, 220
			@fx.push bubble
		@fx.forEach (fx)-> fx.pass time
		@fx = @fx.filter (fx) -> not fx.isObsolet()

	handlePlayerPowerUpCollisions:()->
		for powerUp in @powerUps
			if @collider.collide @player, powerUp
				powerUp.use @

	addBubbles:(position)->
		bubbles = new Bubbles
		bubbles.setPosition position.x, position.y
		@fx.push bubbles

	getEntities:(type)->
		switch type
			when 'player' then [@player]
			when 'torpedo' then @torpedos
			when 'enemy' then @enemies
			else []
