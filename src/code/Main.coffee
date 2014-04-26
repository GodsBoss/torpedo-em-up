class Main
	@WIDTH = 640
	@HEIGHT = 400

	constructor:(@window)->

	run:()->
		@removeJsHint()
		@addCanvas()

	removeJsHint:()->
		jsHint = @window.document.getElementById 'enable-js'
		jsHint.parentNode.removeChild jsHint

	addCanvas:()->
		@canvas = @window.document.createElement 'canvas'
		@canvas.width = Main.WIDTH
		@canvas.height = Main.HEIGHT
		@window.document.body.appendChild @canvas
