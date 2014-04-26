class Main
	@WIDTH = 640
	@HEIGHT = 400

	constructor:(@window)->

	run:()->
		@document = @window.document
		@removeJsHint()
		@addCanvas()
		@initGame()
		@runGame()

	removeJsHint:()->
		jsHint = @document.getElementById 'enable-js'
		jsHint.parentNode.removeChild jsHint

	addCanvas:()->
		@canvas = @document.createElement 'canvas'
		@canvas.width = Main.WIDTH
		@canvas.height = Main.HEIGHT
		@document.body.appendChild @canvas

	initGame:()->
		view = new View @canvas
		@game = new Game Repeater, view

	runGame:()->
		@game.start()
