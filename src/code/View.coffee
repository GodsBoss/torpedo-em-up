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

	drawBackground:()->
		@context.fillStyle = '#00f'
		@context.fillRect 0, 0, @context.canvas.width, @context.canvas.height

	drawPlayer:()->
		position = @center @world.player
		@drawImage 'player', position.x, position.y, floor(@world.time % 2)

	drawImage:(id, x, y, frame = 0)->
		[x, y] = [floor(x), floor(y)]
		@context.drawImage @sprites.get(id, frame), x * @scale, y * @scale

	center:(obj)->
		x: obj.x - obj.width / 2
		y: obj.y - obj.height / 2

	setScale:(@scale)->
