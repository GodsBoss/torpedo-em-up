class RandomBubblesSystem extends System
	constructor:(@bubblesPerSecond)->

	handle:(world, time)->
		world.bubbleBuffer += time
		if world.bubbleBuffer > 1 / @bubblesPerSecond
			world.bubbleBuffer -= 1 / @bubblesPerSecond
			bubble = new Bubble
			bubble.setPosition Math.random() * 320, 220
			world.fx.push bubble
