class World
	constructor:()->
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
		@torpedos = @torpedos.filter (torpedo)->torpedo.x < 330
		@enemies.forEach (enemy) -> enemy.pass time
		@enemies = @enemies.filter (enemy)->enemy.lives() and enemy.x > -50

	addTime:(time)->
		@time += time
		@enemyBuffer += time

	addEnemies:()->
		if @enemyBuffer > 1
			@enemyBuffer -= 1
			fish = new Fish 330, Math.random() * 200
			fish.chooseDirection()
			@enemies.push fish

	createTorpedo:(x, y, vx, vy)->
		@torpedos.push new Torpedo x, y, vx, vy
