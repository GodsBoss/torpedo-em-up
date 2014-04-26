class View
	scale: 1

	constructor:(@canvas, @image)->
		@context = @canvas.getContext '2d'

	draw:(game)->
		if game.state is Game.STATES.MENU
			@context.drawImage @image, 0, 0, 320, 200, 0, 0, 320*@scale, 200*@scale

	setScale:(@scale)->
