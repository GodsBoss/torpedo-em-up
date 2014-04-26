class Main
	@WIDTH = 640
	@HEIGHT = 400

	constructor:(@window)->

	run:()->
		@document = @window.document
		@removeJsHint()
		@addCanvas()

	removeJsHint:()->
		jsHint = @document.getElementById 'enable-js'
		jsHint.parentNode.removeChild jsHint

	addCanvas:()->
		@canvas = @document.createElement 'canvas'
		@canvas.width = Main.WIDTH
		@canvas.height = Main.HEIGHT
		@document.body.appendChild @canvas
