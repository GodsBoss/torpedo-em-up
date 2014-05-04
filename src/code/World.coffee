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

	addPlayer:(@player)->

	pass:(time)->
		@addTime time
		@addEnemies()
		@player.pass time
		@torpedos.forEach (torpedo)-> torpedo.pass time
		@torpedos = @torpedos.filter (torpedo)->torpedo.x < 330 and not torpedo.exploded
		@enemies.forEach (enemy) -> enemy.pass time
		@enemies = @enemies.filter (enemy)->enemy.lives() and enemy.x > -50
		@powerUps.forEach (powerUp) -> powerUp.pass time
		@powerUps = @powerUps.filter (powerUp) -> not powerUp.isObsolet()
		@handleEnemyTorpedoCollisions()
		@handleEnemyPlayerCollisions()
		@handlePlayerPowerUpCollisions()
		@handleFx time

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
		bubbles = new Bubbles
		bubbles.setPosition x, y
		@fx.push bubbles

	handleEnemyTorpedoCollisions:()->
		for enemy in @enemies
			for torpedo in @torpedos
				@enemyTorpedoCollide enemy, torpedo

	enemyTorpedoCollide:(enemy, torpedo)->
		if not torpedo.exploded and @collider.collide enemy, torpedo
			enemy.receiveDamage torpedo.strength
			if not enemy.lives()
				@points += enemy.points
				if Math.random() < enemy.bonusChance
					@powerUps.push PowerUp.createRandom enemy
			torpedo.exploded = true
			bubbles = new Bubbles
			bubbles.setPosition torpedo.x, torpedo.y
			@fx.push bubbles

	handleEnemyPlayerCollisions:()->
		for enemy in @enemies
			if @collider.collide @player, enemy
				@player.receiveDamage enemy.getPlayerDamage()
				enemy.kill()

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
				powerUp.used = true
				if powerUp.type is PowerUp.TYPE_POINTS
					@points += 100
				if powerUp.type is PowerUp.TYPE_HEALTH
					@player.life += 10
				if powerUp.type is PowerUp.TYPE_TORPEDO
					@player.attack++
