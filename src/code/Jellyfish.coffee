class Jellyfish extends Enemy
	@LIFE = 40

	width: 32
	height: 46
	type: 'jellyfish'
	life: Jellyfish.LIFE
	points: 25
	bonusChance: 0.33

	constructor:()->
		super()
		@float = Math.random() * Math.PI * 2

	pass:(time)->
		super time
		@setVelocity @vx, 3 * Math.sin @time + @float
