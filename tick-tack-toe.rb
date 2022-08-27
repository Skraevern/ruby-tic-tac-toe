class Game
    def initialize(p1, p2)
        @p1 = p1
        @p2 = p2
        @game_pos_array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        @game_over = false
        @active_player = @p1
        @picked_number = nil
        clear
        show_board
        play
    end

    def show_board
        puts "#############################"
        puts "####### Tick Tack Toe #######"
        puts "#############################"
        puts "#{@game_pos_array[1]} | #{@game_pos_array[2]} | #{@game_pos_array[3]}     X : #{@p1.name}"
        puts "#{@game_pos_array[4]} | #{@game_pos_array[5]} | #{@game_pos_array[6]}     O : #{@p2.name}"    
        puts "#{@game_pos_array[7]} | #{@game_pos_array[8]} | #{@game_pos_array[9]}"
    end
    def play
        while !@game_over
            clear
            show_board
            puts "#{@active_player.name} pick a number!"
            @picked_number = gets.chomp

            # Check if input is a number
            while @picked_number.to_i == 0
                puts "Not a number. Try again"
                @picked_number = gets.chomp
            end
            
            ## Check if input is a number that is left in array
            while !@game_pos_array.include?(@picked_number.to_i)
                puts "Wrong number try agin"
                @picked_number = gets.chomp
            end
            puts "Correct"

            ## Adds active player symbol to correct position
            @game_pos_array.each_with_index { |num, i|  
                if num == @picked_number.to_i
                    @game_pos_array[i] = @active_player.symbol
                end
            }

            @active_player.picked_numbers_array.push(@picked_number.to_i)

            check_winner
        end
    end

    def check_winner
        win_arr = [
            [1, 2, 3],
            [4, 5, 7],
            [7, 8, 9],
            [1, 4, 7],
            [2, 5, 8],
            [3, 6, 9],
            [1, 5, 9],
            [3, 5, 7]
          ]
        win_arr.each { |arr| 
            score = 0
            arr.each_with_index { |num, i| 
                if num == @active_player.picked_numbers_array[i]
                    score = score + 1
                end
                if score == 3
                    display_winner
                end
            }
        }

        if @active_player.player_number == 1
            @p1 = @active_player
            @active_player = @p2
        else
            @p2 = @active_player
            @active_player = @p1
        end
    end

    def display_winner
        clear
        show_board
        puts "Congratulations #{@active_player.name}!"
        @game_over = true
    end
end

class Player
    attr_reader :name, :symbol, :player_number
    attr_accessor :picked_numbers_array
    def initialize(player_number, symbol)
        @player_number = player_number
        @picked_numbers_array = []
        @name = nil
        @symbol = symbol
        ask_names
    end
    def ask_names
        if @player_number == 1
            puts "Welcome!"
        end
        puts "What is your name player #{@player_number}?"
        @name = gets.chomp
    end
end

def clear()
    print "\e[2J\e[H"
end

clear()
puts "#############################"
puts "####### Tick Tack Toe #######"
puts "#############################"
p1 = Player.new(1, "X")
p2 = Player.new(2, "O")
game = Game.new(p1, p2)
