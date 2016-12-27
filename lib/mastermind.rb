
class Mastermind
  def initialize
    @counter = 0
    @time_start = Time.now
    @time_end = 0
  end
  def welcome_message
    puts "\n Welcome to MASTERMIND \n
    Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    menu_input = gets.chomp!.downcase
    opener_input(menu_input)
  end

  def opener_input(menu_input)
    if menu_input == "p" || menu_input == "play"
      start_game
    elsif menu_input == "i" || menu_input == "instructions"
      instructions
    elsif menu_input == "q" || menu_input == "quit"
      end_game
    else
      puts "Please enter corresponding letters (p,i,q)\n\n"
      @time_start
      welcome_message
    end
  end

    def start_game
      puts "I have generated a beginner sequence with four elements made up of: (r)ed,
      (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
      What's your guess?"
      user_guess = gets.chomp!
      correct_letter(user_guess)
    end

    def try_again
      puts "That was incorrect!!! \n Your guess of #{user_guess}

      What's your guess? \n
      Use (q)uit at any time to end the game."
      #need to call math method for comparing guess to secret code
      user_guess = gets.chomp!
      correct_letter(user_guess)
    end

    def correct_letter(user_guess)
      if  user_guess == "q" || user_guess == "quit"
        end_game
      elsif user_guess == "c" || user_guess == "cheat"
        print secret_code
      elsif user_guess.length < 4
        puts "need moar letters!!!\n"
        user_guess = gets.downcase.chomp!
        correct_letter(user_guess)
      elsif user_guess.length > 4
        puts "too many letters\n"
        user_guess = gets.downcase.chomp!
        correct_letter(user_guess)
        end_game_flow
      else
        brain_game(user_guess)
      end
    end

    def time_end
      Time.now
    end

    def time_math
      time_end.to_i - @time_start.to_i
    end

    def end_game_flow
      puts "Congratulations! You guessed the secret sequence ( #{secret_code} )
      in #{@counter} attempts, It took you #{time_math} seconds!!!
      Do you want to (p)lay again or (q)uit?"
      end_game_input = gets.downcase.chomp!
      restart_game(end_game_input)
    end

    def restart_game(end_game_input)
      if end_game_input == "q" || end_game_input == "quit"
        end_game
      elsif end_game_input == "p" || end_game_input == "play"
        start_game
      else
        "Do you want to (p)lay again or (q)uit?"
        end_game_input = gets.downcase.chomp!
        restart_game
      end
    end

    def end_game
      puts "goodbye!"
      exit
    end

    def brain_game(user_guess)
      @counter += 1
      if user_guess == secret_code
        puts "Victory!"
        end_game_flow
      elsif user_guess != secret_code
        puts "that was incorrect!"
        start_game
      end
    end

    def secret_code
      "rrrr"
      # "The secret code is: #{["g", "b", "y", "r"].sample(4).join}\n\n"
    end

end

mastermind = Mastermind.new
mastermind.welcome_message
