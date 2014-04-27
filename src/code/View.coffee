class View

	# Shortcuts
	floor = Math.floor

	scale: 1

	constructor:(@context, @sprites)->

	draw:(game)->
		if game.state is Game.STATES.MENU
			@drawImage 'title', 0, 0
		if game.state is Game.STATES.PLAYING
			@world = game.world
			@drawBackground()
			@drawEntity @world.player
			@drawEntities @world.torpedos
			@drawEntities @world.enemies
			@drawEntities @world.fx

	drawBackground:()->
		offset = - floor @world.time * 5 % 320
		@drawImage 'background', offset, 0
		@drawImage 'background', 320+offset, 0

	drawEntities:(entities)->
		for entity in entities
			@drawEntity entity

	drawEntity:(entity)->
		position = @center entity
		@drawImage entity.type, position.x, position.y, entity.time

	drawImage:(id, x, y, time = 0)->
		[x, y] = [floor(x), floor(y)]
		frame = floor time * @sprites.speed(id) % @sprites.frames id
		@context.drawImage @sprites.get(id, frame), x * @scale, y * @scale

	center:(obj)->
		x: obj.x - obj.width / 2
		y: obj.y - obj.height / 2

	setScale:(@scale)->
