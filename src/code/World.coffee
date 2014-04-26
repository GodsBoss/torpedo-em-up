class World
	constructor:()->
		@time = 0
		@torpedos = []

	addPlayer:(@player)->

	pass:(time)->
		@time += time
		@player.pass time
		@torpedos.forEach (torpedo)-> torpedo.pass time
		@torpedos = @torpedos.filter (torpedo)->torpedo.x < 330

	createTorpedo:(x, y, vx, vy)->
		@torpedos.push new Torpedo x, y, vx, vy
