require_relative "board"

class Game
    def initialize
        @board = Board.new
        turn
    end
    def turn
        while !game_over?
            print "Please enter a number from 1-9 to add to the sudoku "
            num = gets.chomp.to_i
            if valid_num?(num.to_i)
                print "Choose a coordinate for this number (e.g. 0 0) "
                coordinate = gets.chomp.split(" ")

                if valid_row?(coordinate,num) && valid_col?(coordinate,num)
                    puts "valid space"
                    edit_tile(coordinate,num)
                else
                    puts "invalid space"
                end
            else
                print "Invalid number. Please enter a number from 1-9 "
            end
        end
    end

    def edit_tile(coordinate,num)
        @board[coordinate] = num.to_s
    end

    def valid_num?(num)
        (1..9).include?(num)
    end

    def valid_row?(coordinate, num)
        x = coordinate[0]
        @board.view_row(x).each do |tile|
            if tile.val.to_s == num.to_s
                return false
            end
        end
        return true
    end

    def valid_col?(coordinate, num)
        y = coordinate[1]
        @board.view_col(y).each do |tile|
            if tile.val.to_s == num.to_s
                return false
            end
        end
        return true
    end

    # def valid_square?(coordinate, num)
    #     @board.view_square(coordinate)
    # end

    def game_over?
        !@board.view_board.include?("0")
    end
end

g = Game.new
