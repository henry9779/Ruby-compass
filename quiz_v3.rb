# Prompts the user for two integers.
# - The first one should be between 1 and 4, with
#   * 1 meaning initially looking North,
#   * 2 meaning initially looking East,
#   * 3 meaning initially looking South,
#   * 4 meaning initially looking West.
# - The second one should be positive. When written in base 3, its consecutive
#   digits read from left to right represent the directions to take, with
#   * 0 meaning going in the direction one is initially looking at,
#   * 1 meaning 45 degrees left of the direction one is initially looking at,
#   * 2 meaning 45 degrees right of the direction one is initially looking at.
#
# Prints out:
# - the direction one is originally looking at, as an arrow,
# - the representation of the second digit in base 3,
# - the corresponding sequence of directions to take, as arrows,
# - in case one is originally looking North or South, the path,
#   so the sequence of arrows again, but nicely displayed.
# - you may use the unicode array for output: ['↑', ':arrow_upper_right:', '→', ':arrow_lower_right:', '↓', ':arrow_lower_left:', '←', ':arrow_upper_left:']
require 'byebug'

# class DrawManager
#   def initialize(steps: , position: )
#     @steps = steps
#     @position = position
#   end

#   def perform
#     puts "Let's go then!"

#     @steps.each do |step|
#       string = ""
#       @position.times{ string += " " }
#       string += step

#       case
#       when ['↙', '↗'].include?(step)
#         @position = @position - 1
#       when ['↘', '↖'].include?(step)
#         @position = @position + 1
#       end

#       puts string
#     end
#   end
# end

def go(steps: , position: )

  puts "Let's go then!"

  steps.each do |step|
    string = ""
    position.times{ string += " " }
    string += step

    case
    when ['↙', '↗'].include?(step)
      position = position - 1
    when ['↘', '↖'].include?(step)
      position = position + 1
    end

    puts string
  end
end

begin
  print('Enter an integer between 1 and 4 and a positive integer: ')

  #initial_direction, directions = gets.split()
  initial_direction, directions = ['1', '1097393690']
  # initial_direction, directions = ['3', '2943856728']
  # initial_direction, directions = ['2', '9848289250']
  # initial_direction, directions = ['4', '6578987643']

  if initial_direction.size != 1 || directions.size > 1 && directions[0] == '0'
    raise ArgumentError
  end

  initial_direction = initial_direction.to_i
  directions = directions.to_i
  if ![1, 2, 3, 4].include?(initial_direction) || directions < 0
    raise ArgumentError
  end

  base_3 = directions.to_s(3).to_i

  base_3_arr = base_3.to_s.split('')


  # key 的名稱最好是能直接跟程式對上，原本寫的 1-l 不能直接對上會很難處理
  route_table = {
    1 => {
      '0' => '↑',
      '1' => '↖',
      '2' => '↗',
    },
    2 => {
      '0' => '→',
      '1' => '↗',
      '2' => '↘',
    },
    3 => {
      '0' => '↓',
      '1' => '↘',
      '2' => '↙',
    },
    4 => {
      '0' => '←',
      '1' => '↙',
      '2' => '↖',
    }
  }

  route = route_table[initial_direction]

  # steps 是這樣的陣列 ↙↘↘↙↘↓↘↘↘↓↘↘↓↙↓↙↓↙↓↓
  # 要盡快把 21121011101102020200 轉成符號後面會比較好處理
  steps =  base_3_arr.map{|e| route[e]}
  # puts "steps: #{steps}"

  puts "Ok, you want to first look this way: #{route['0']}"
  puts ""
  puts "In base 3, the second input reads as: #{base_3}"
  puts "So that's how you want to go: #{steps.join }"
  puts ""

  case
  when initial_direction == 1
    steps.reverse!

    position = steps.count('↖')

    # draw_manager = DrawManager.new(steps: steps, position: position)
    # draw_manager.perform
    go(steps: steps, position: position)


  when initial_direction == 3
    position = steps.count('↙')
    # draw_manager = DrawManager.new(steps: steps, position: position)
    # draw_manager.perform

    go(steps: steps, position: position)

  when [2, 4].include?(initial_direction)
    puts "I don't want to have the sun in my eyes, but by all means have a go at it!"
  end

rescue ArgumentError => e
  print("Incorrect input, giving up.\n")
  exit
end
