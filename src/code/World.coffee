class World
	constructor:(@collider)->
		@time = 0
		@enemyBuffer = 0
		@torpedos = []
		@enemies = []

	addPlayer:(@player)->

	pass:(time)->
		@addTime time
		@addEnemies()
		@player.pass time
		@torpedos.forEach (torpedo)-> torpedo.pass time
		@torpedos = @torpedos.filter (torpedo)->torpedo.x < 330 and not torpedo.exploded
		@enemies.forEach (enemy) -> enemy.pass time
		@enemies = @enemies.filter (enemy)->enemy.lives() and enemy.x > -50
		@handleEnemyTorpedoCollisions()
		@handleEnemyPlayerCollisions()

	addTime:(time)->
		@time += time
		@enemyBuffer += time

	addEnemies:()->
		if @enemyBuffer > 1 + Math.random()
			@enemyBuffer -= 1
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
		@torpedos.push torpedo

	handleEnemyTorpedoCollisions:()->
		for enemy in @enemies
			for torpedo in @torpedos
				@enemyTorpedoCollide enemy, torpedo

	enemyTorpedoCollide:(enemy, torpedo)->
		if not torpedo.exploded and @collider.collide enemy, torpedo
			enemy.receiveDamage torpedo.strength
			torpedo.exploded = true

	handleEnemyPlayerCollisions:()->
		for enemy in @enemies
			if @collider.collide @player, enemy
				@player.receiveDamage enemy.getPlayerDamage()
				enemy.kill()
