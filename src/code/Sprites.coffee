class Sprites
	scale: 1

	constructor:(@source, @map)->
		@cache =
			'1': {}

	get:(id)->
		@cache[@scale][id] ?= @generate id

	generate:(id)->
		# Spaghetti code ahead!
		[x, y, w, h] = [@map[id].x, @map[id].y, @map[id].w, @map[id].h]
		[destWidth, destHeight] = [w*@scale, h*@scale]
		canvas = document.createElement 'canvas'
		canvas.width = destWidth
		canvas.height = destHeight
		context = canvas.getContext '2d'
		context.drawImage @source, x, y, w, h, 0, 0, w, h
		sourceData = context.getImageData 0, 0, w, h
		targetData = context.createImageData destWidth, destHeight
		for targetX in [0..destWidth]
			for targetY in [0..destHeight]
				sourceX = Math.floor targetX / @scale
				sourceY = Math.floor targetY / @scale
				sourceIndex = (sourceY*w + sourceX)*4
				targetIndex = (targetY*destWidth + targetX)*4
				for offset in [0..3]
					targetData.data[targetIndex+offset] = sourceData.data[sourceIndex+offset]
		context.putImageData targetData, 0, 0
		canvas

	setScale:(@scale)->
		@cache[@scale] ?= {}
