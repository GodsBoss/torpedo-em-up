class PlayerEnemyCollision extends CollisionAction
	firstType: 'player'
	secondType: 'enemy'

	collide:(world, player, enemy)->
		player.receiveDamage enemy.getPlayerDamage()
		enemy.kill()
