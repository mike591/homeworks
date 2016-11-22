require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    place_stones

  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups = Array.new(14){[:stone, :stone, :stone, :stone]}

    @cups[6] = []
    @cups[13] = []
  end

  def valid_move?(start_pos)
    possible_pos = [0, 1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 12]
    raise "Invalid starting cup" unless possible_pos.include?(start_pos)
    raise "Invalid starting cup" if @cups[start_pos] == []
    return true
  end

  def make_move(start_pos, current_player_name)
    pebbles = @cups[start_pos].dup
    @cups[start_pos] = []

    avoid = get_avoid(current_player_name)

    pos = start_pos + 1
    until pebbles.empty? do
      if pos != avoid
        @cups[pos % @cups.count] << pebbles.shift
      end
      pos += 1
    end
    system("clear")
    render

    # byebug
    ending_pos = (pos-1) % @cups.count
    return next_turn(ending_pos, current_player_name)
  end

  def next_turn(ending_cup_idx, current_player_name)
    # helper method to determine what #make_move returns
    avoid = get_avoid(current_player_name)
    current_player_cup = 6 if avoid == 13
    current_player_cup = 13 if avoid == 6

    return :prompt if ending_cup_idx == current_player_cup
    return :switch if @cups[ending_cup_idx].count == 1
    return ending_cup_idx
  end

  def get_avoid(current_player_name)
    avoid = 6 unless current_player_name == @name1
    avoid = 13 unless current_player_name == @name2
    return avoid
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[1..5].flatten.empty?
    return true if @cups[7..12].flatten.empty?
    return false
  end

  def winner
    return :draw if @cups[6].count == @cups[13].count
    return @name1 if @cups[6].count > @cups[13].count
    return @name2
  end
end
