class Collider

	sgn = (value)->
		if value < 0
			return -1
		if value > 0
			return 1
		0

	collide:(object1, object2)->
		@overlapHorizontal(object1, object2) and @overlapVertical(object1, object2)

	overlapHorizontal:(object1, object2)->
		@overlap1d object1, object2, 'x', 'width'

	overlapVertical:(object1, object2)->
		@overlap1d object1, object2, 'y', 'height'

	overlap1d:(o1, o2, c, s)->
		sgn1 = sgn (o1[c] - o1[s] / 2) - (o2[c] + o2[s] / 2)
		sgn2 = sgn (o1[c] + o1[s] / 2) - (o2[c] - o2[s] / 2)
		sgn1 is 0 or sgn2 is 0 or sgn1 isnt sgn2
