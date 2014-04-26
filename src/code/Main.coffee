class Main
	constructor:(@window)->

	run:()->
		jsHint = @window.document.getElementById 'enable-js'
		jsHint.parentNode.removeChild jsHint
