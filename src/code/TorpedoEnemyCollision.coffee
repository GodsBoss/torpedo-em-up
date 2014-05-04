class TorpedoEnemyCollision extends CollisionAction
	firstType: 'torpedo'
	secondType: 'enemy'

	collide:(world, torpedo, enemy)->
		if not torpedo.exploded and enemy.lives()
			enemy.receiveDamage torpedo.strength
			if not enemy.lives()
				world.points += enemy.points
				if Math.random() < enemy.bonusChance
					world.powerUps.push PowerUp.createRandom enemy
			torpedo.exploded = true
			world.addBubbles torpedo
