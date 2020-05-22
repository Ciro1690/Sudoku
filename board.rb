require 'colorize'
require_relative "tile"

class Board
    def initialize
        @board = []
        File.open("sudoku1.txt", "r") do |f|
            f.each_line do |line|
                row = []
                line.each_char do |char|
                    if char != "\n" 
                        row << Tile.new(char)
                    end
                end
                @board << row
            end
        end
    end

    def [](pos)
        x,y = pos
        p @board[x.to_i][y.to_i]
    end

    def []=(pos,num)
        x,y = pos
        @board[x.to_i][y.to_i].val = num        
    end

    def view_row(pos)
        x,y = pos
        @board[x.to_i]
    end

    def view_col(pos)
        x,y = pos
        col_array = []
        @board.each do |row|
            col_array << row[y.to_i]
        end
        col_array
    end

    # def assign_square(pos)
    #     x,y = pos
    #     new_x = x.to_i/3
    #     new_y = y.to_i/3

    #     if new_x == 0 && new_y == 0
    #         return "top left"
    #     elsif new_x == 1 && new_y == 0
    #         return "top mid"
    #     elsif new_x == 2 && new_y == 0
    #         return "top right"
    #     elsif new_x == 0 && new_y == 1
    #         return "mid left"
    #     elsif new_x == 1 && new_y == 1
    #         return "mid"
    #     elsif new_x == 2 && new_y == 1
    #         return "center right"
    #     elsif new_x == 0 && new_y == 2
    #         return "bottom left"
    #     elsif new_x == 1 && new_y == 2
    #         return "bottom mid"
    #     elsif new_x == 2 && new_y == 2
    #         return "bottom right"
    #     end
    # end

    def view_board
        tiles = []
        (0...@board.length).each do |row|
           @board[row].each do |tile_obj|
                if tile_obj.given
                    tile_obj.val = tile_obj.val.blue
                end
                tiles << tile_obj.val
            end
        end
        i = 0
        root = Math.sqrt(tiles.length).to_i
        while i <= tiles.length-1
            puts tiles[i...i+root]
        i+=root
        end
        return tiles
    end
end



# puts "the color blue".colorize(:blue)
b = Board.new


