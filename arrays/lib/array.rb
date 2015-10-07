class Array

  def my_uniq
    unique = []
    self.each do |el|
       unique << el unless unique.include?(el)
    end

    unique
  end

  def two_sum
    return [] if self.length < 2
    [].tap do |sum_indices|
      (0...self.length - 1).each do |i|
        (i+1...self.length).each do |j|
          sum_indices << [i, j] if self[i] + self[j] == 0
        end
      end
    end
  end

end

def my_transpose(array)
  Array.new(array[0].length) { Array.new(array.length) }.tap do |transposed|
    (0...array.length).each do |row|
      (0...array[0].length).each do |col|
        transposed[col][row] = array[row][col]
      end
    end
  end
end

def stock_picker(array)
  profitable_days = []
  max_profit = 0
  (0...array.length - 1).each do |i|
    (i+1...array.length).each do |j|
      if array[j] - array[i] > max_profit
        max_profit = array[j] - array[i]
        profitable_days = [i, j]
      end
    end
  end
  profitable_days
end

class TowersOfHanoi
  attr_accessor :towers

  DISCS = [6,5,4,3,2,1]

  def initialize
    tower_1 = DISCS
    tower_2 = []
    tower_3 = []
    @towers = [tower_1, tower_2, tower_3]
  end

  def render
    puts "Tower 1 : #{towers[0]}"
    puts "Tower 2 : #{towers[1]}"
    puts "Tower 3 : #{towers[2]}"
    towers
  end

  def place_disc
    puts "start, end tower"
    input = gets.chomp.split(",")
    start = input[0].to_i
    end_tower = input[1].to_i
    if towers[start].last.nil?
      "Pick another position"
      place_disc
    elsif towers[end_tower].last.nil? ||towers[start].last < towers[end_tower].last
      remove_piece = towers[start].pop
      towers[end_tower] << remove_piece
    else
      "Pick another position"
      place_disc
    end

  end


  def won?
    towers[1..2].each { |tower| return true if tower == DISCS }

    false
  end


  def play_turn
    until won?
      render
      place_disc
      play_turn
    end
    puts "You win. yay."
  end

  # private
  #
  # def towers=(towers)
  #   @towers = towers
  # end

end
