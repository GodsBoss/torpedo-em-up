class World
	constructor:()->
		@time = 0

	addPlayer:(@player)->

	pass:(time)->
		@time += time
		@player.pass time
