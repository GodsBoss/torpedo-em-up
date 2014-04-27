class Torpedo extends PhysicsObject
	width: 14
	height: 5
	strength: 5
	exploded: false
	time: 0
	type: 'torpedo'

	pass:(time)->
		super time
		@time += time

	explode:()->
		@exploded = true
