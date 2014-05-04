class EnemySystem extends System
	constructor:(@enemyGrowthFactor)->

	handle:(world, time)->
		world.enemyBuffer += time * (1 + world.time * @enemyGrowthFactor)
		@addEnemies world

	addEnemies:(world)->
		if world.enemyBuffer > (1 + Math.random()) * 5
			world.enemyBuffer -= 5
			if Math.random() < 0.9
				@addFish world
			else
				@addJellyfish world

	addFish:(world)->
		fish = new Fish
		fish.setPosition 330, Math.random() * 200
		fish.chooseDirection()
		world.enemies.push fish

	addJellyfish:(world)->
		jelly = new Jellyfish
		jelly.setPosition 330, Math.random() * 160 + 20
		jelly.setVelocity -10, 0
		world.enemies.push jelly
