class CollisionAction
	firstType: ''
	secondType: ''

	getFirstType:()->
		@firstType

	getSecondType:()->
		@secondType

	collide:(world, firstEntity, secondEntity)->
