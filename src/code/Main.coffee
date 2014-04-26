class Main
	constructor:(@window)->

	run:()->
		jsHint = @window.document.getElementById 'enable-js'
		jsHint.parentNode.removeChild jsHint
		canvas = @window.document.createElement 'canvas'
		canvas.width = 640
		canvas.height = 400
		@window.document.body.appendChild canvas
