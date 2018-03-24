VALID_CHOICES = %w(rock paper scissors lizard spock)

ABBREVIATIONS = %w(r p s l sp)

def prompt(message)
	Kernel.puts("=> #{message}")
end

def win?(first, second)
	(first == 'p' && (second == 'r' || second == 'sp')) ||
	(first == 'r' && (second == 's' || second == 'l')) ||
	(first == 's' && (second == 'p' || second == 'l')) ||
	(first == 'l' && (second == 'sp' || second == 'p')) ||
	(first == 'sp' && (second == 's' || second == 'r'))
end


def display_results(player, computer)
	if win?(player,computer)
	  prompt("You won!")
	elsif win?(computer, player)
	  prompt("Computer won!")
	else 
	  prompt("It's a tie!")
	end 
end


loop do
	choice = ''
	loop do
		prompt("Choose one: #{VALID_CHOICES.join(', ')}")
		prompt("Type (#{ABBREVIATIONS[0..3].join(', ')} or #{ABBREVIATIONS[4]})")


		choice = Kernel.gets().chomp()

		if ABBREVIATIONS.include?(choice)
			break
		else
			prompt("That's not a valid choice.")
		end
	end

	computer_choice = ABBREVIATIONS.sample

	prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

	display_results(choice, computer_choice)

	prompt("Do you want to play again?")
	answer = Kernel.gets().chomp()
	break unless answer.downcase().start_with?('y')
end 

prompt("Thank you for playing. Good bye!")
