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
		bubble:
			x: 497
			y: 1
			w: 9
			h: 9
		bubbles:
			x: 516
			y: 1
			w: 9
			h: 11
			frames: 3
			speed: 8
		powerUpPoints:
			x: 532
			y: 31
			w: 13
			h: 13
		powerUpHealth:
			x: 532
			y: 16
			w: 13
			h: 13
		powerUpTorpedo:
			x: 532
			y: 1
			w: 13
			h: 13
