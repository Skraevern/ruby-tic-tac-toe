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
        puts "#{@game_pos_array[1]} | #{@game_pos_array[2]} | #{@game_pos_array[3]}     "
        puts "#{@game_pos_array[4]} | #{@game_pos_array[5]} | #{@game_pos_array[6]}"
        puts "#{@game_pos_array[7]} | #{@game_pos_array[8]} | #{@game_pos_array[9]}"
    end
    def play
        while !@game_over
            puts "#{@active_player.name} pick a number!"
            @picked_number = gets.chomp
            
            ## Check if input is a number between 1 and 9
            while !@picked_number.to_i.between?(1,9)
                puts "Wrong number try agin"
                @picked_number = gets.chomp
            end
            
            @game_over = true
        end
    end

end

class Player
    attr_accessor :name
    def initialize(player_number)
        @player_number = player_number
        @picked_nubers_array = []
        @name = nil
        @symbol = nil
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
p1 = Player.new(1)
p2 = Player.new(2)
game = Game.new(p1, p2)
