require 'colorize'

class Tile

attr_accessor :val, :given

    def initialize(val)
        @val = val
        @given = given?(val)
    end

    def given?(val)
        val == "0" ? false : true
    end
end