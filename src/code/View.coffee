class View
	scale: 1

	constructor:(@context, @sprites)->

	draw:(game)->
		if game.state is Game.STATES.MENU
			@context.drawImage @sprites.get('title'), 0, 0

	setScale:(@scale)->
