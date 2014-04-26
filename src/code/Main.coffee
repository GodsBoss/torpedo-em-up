class Main
	@WIDTH = 640
	@HEIGHT = 400
	@GFX = './gfx.png'

	constructor:(@window)->

	run:()->
		@document = @window.document
		@removeJsHint()
		@addCanvas()
		@initView()

	removeJsHint:()->
		jsHint = @document.getElementById 'enable-js'
		jsHint.parentNode.removeChild jsHint

	addCanvas:()->
		@canvas = @document.createElement 'canvas'
		@canvas.width = Main.WIDTH
		@canvas.height = Main.HEIGHT
		@document.body.appendChild @canvas

	initView:()->
		@image = @document.createElement 'img'
		@image.addEventListener 'load', @initGame, false
		@image.src = Main.GFX

	initGame:()=>
		keyboard = new Keyboard
		@window.addEventListener 'keydown', keyboard.keyDown, false
		@window.addEventListener 'keyup', keyboard.keyUp, false
		sprites = new Sprites @image, SpriteMap.create()
		sprites.setScale 2
		view = new View @canvas.getContext('2d'), sprites
		view.setScale 2
		@game = new Game Repeater, view, keyboard
		@runGame()

	runGame:()->
		@game.start()
