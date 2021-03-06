Gem::Specification.new do |s|
	s.name = 'tic_tac_totally_employable'
	s.version = '0.0.1'
	s.summary = 'a gem that plays tic tac toe'
	s.authors = ['alexander garrow']
	s.required_ruby_version = '~> 2.4.1'
	s.files = [
		"lib/tic_tac_toe.rb", 
		"lib/tic_tac_toe/board.rb",
		"lib/tic_tac_toe/board_state.rb",
		"lib/tic_tac_toe/computer.rb",
		"lib/tic_tac_toe/constants.rb",
		"lib/tic_tac_toe/game.rb",
		"lib/tic_tac_toe/human.rb",
		"lib/tic_tac_toe/input.rb",
		"lib/tic_tac_toe/player.rb",
		"lib/tic_tac_toe/tic_tac_toe.rb",
		"lib/tic_tac_toe/view.rb"
	]
	s.executables << 'tic_tac_totally_employable'
	s.add_development_dependency 'minitest'
	s.add_development_dependency 'pry-byebug'
	s.add_development_dependency 'mocha'
end