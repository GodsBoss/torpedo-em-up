class CollisionSystem extends System
	constructor:(@collider, @action)->

	handle:(world, time)->
		for entity1 in world.getEntities @action.getFirstType()
			for entity2 in world.getEntities @action.getSecondType()
				if @collider.collide entity1, entity2
					@action.collide world, entity1, entity2
