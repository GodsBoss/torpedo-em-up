class Torpedo
	width: 14
	height: 5

	constructor:(@x, @y, @vx, @vy)->
		@lifetime = 0

	pass:(time)->
		@x += @vx
		@y += @vy
		@lifetime += time
