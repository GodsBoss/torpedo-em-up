class SpriteMap
	@create = ()->
		title:
			x: 0
			y: 0
			w: 320
			h: 200
		player:
			x: 320
			y: 0
			w: 44
			h: 23
			frames: 2
		torpedo:
			x: 371
			y: 1
			w: 14
			h: 5
			frames: 4
			speed: 8
		fish:
			x: 426
			y: 4
			w: 32
			h: 17
			frames: 2
		jellyfish:
			x: 462
			y: 1
			w: 32
			h: 46
			frames: 2
		background:
			x: 0
			y: 201
			w: 320
			h: 200
