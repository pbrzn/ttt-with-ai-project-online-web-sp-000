module Players
  class Human < Player
    def move(board)
      puts "Welcome to Tic Tac Toe"
      puts "What is your move?"
      input=gets.strip
    end

  end
end