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
			@drawPlayer()
			@drawTorpedos()
			@drawEnemies()

	drawBackground:()->
		@context.fillStyle = '#00f'
		@context.fillRect 0, 0, @context.canvas.width, @context.canvas.height

	drawPlayer:()->
		position = @center @world.player
		@drawImage 'player', position.x, position.y, @world.time

	drawTorpedos:()->
		for torpedo in @world.torpedos
			@drawTorpedo torpedo

	drawTorpedo:(torpedo)->
		position = @center torpedo
		@drawImage 'torpedo', position.x, position.y, torpedo.lifetime * 8

	drawEnemies:()->
		for enemy in @world.enemies
			@drawEnemy enemy

	drawEnemy:(enemy)->
		position = @center enemy
		@drawImage enemy.type, position.x, position.y, enemy.time

	drawImage:(id, x, y, animationTime = 0)->
		[x, y] = [floor(x), floor(y)]
		frame = floor animationTime % @sprites.frames id
		@context.drawImage @sprites.get(id, frame), x * @scale, y * @scale

	center:(obj)->
		x: obj.x - obj.width / 2
		y: obj.y - obj.height / 2

	setScale:(@scale)->
