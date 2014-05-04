class PlayerPowerUpCollision extends CollisionAction
	firstType: 'player'
	secondType: 'powerUp'

	collide:(world, player, powerUp)->
		powerUp.use world
