class Repeater

	@create = (callback, interval)->
		new @ callback, interval

	constructor:(@callback, @interval)->
		@running = false

	start:()->
		if not @running
			@running = true
			@step()

	stop:()->
		@running = false

	step:()=>
		if @running
			window.setTimeout @step, @interval
			@callback()
