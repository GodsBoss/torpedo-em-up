class Torpedo
	width: 14
	height: 5
	strength: 5
	exploded: false

	constructor:(@x, @y, @vx, @vy)->
		@lifetime = 0

	pass:(time)->
		@x += @vx
		@y += @vy
		@lifetime += time

	explode:()->
		@exploded = true
