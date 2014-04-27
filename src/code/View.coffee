class View

	@ALIGN_LEFT = 'left'
	@ALIGN_RIGHT = 'right'

	# Shortcuts
	floor = Math.floor

	scale: 1

	constructor:(@context, @sprites)->

	draw:(game)->
		if game.state is Game.STATES.MENU
			@drawImage 'title', 0, 0
			@showHighscore game.highscore
		if game.state is Game.STATES.PLAYING
			@world = game.world
			@drawBackground()
			@drawEntity @world.player
			@drawEntities @world.torpedos
			@drawEntities @world.enemies
			@drawEntities @world.powerUps
			@drawEntities @world.fx
			@showPoints()
			@showPlayerHealth()

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

	showPoints:()->
		@showNumber 320, 194, @world.points, View.ALIGN_RIGHT

	showPlayerHealth:()->
		@showNumber 10, 194, @world.player.life, View.ALIGN_LEFT

	showHighscore:(score)->
		@showNumber 35, 194, score, View.ALIGN_LEFT

	showNumber:(x, y, number, alignment)->
		chars = (number+'').split ''
		if alignment is View.ALIGN_LEFT
			start = x
		else
			start = x - chars.length * 6
		for i in [0..chars.length-1]
			@drawImage chars[i], start + i * 6, y
