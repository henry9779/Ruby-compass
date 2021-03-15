# Prompts the user for two integesteps.
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
# - so the sequence of arrows again, but nicely displayed.
# - you may use the unicode array for output: ['↑', '↗', '→', '↘', '↓', '↙', '←', '↖']

begin
  # 將箭頭用 hash 存起來，之後用 key 得出箭頭
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

  print('Enter an integer between 1 and 4 and a positive integer: ')
  initial_direction, directions = gets.split()
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
  route = route_table[initial_direction]
  steps = base_3_arr.map{ |n| route[n]}

  puts ""
  puts "Ok, you want to first look this way: #{route['0']}"
  puts ""
  puts "In base 3, the second input reads as: #{base_3}"
  puts "So that's how you want to go: #{steps.join}"
  puts ""

  def go(steps)
    puts "Let's go then!"
    i = 0
    space = ""
    case
    when ['↖','↙'].include?(steps)
      i -= 1
    when ['↗','↘'].include?(steps)
      i += 1
    end
    puts i
  end

  if [1, 3].include?(initial_direction) && !directions.nil?
    case
    when initial_direction == 1
      steps.reverse!
      go(steps)
    when initial_direction == 3
      # go(steps)
    end
  end

  if [2, 4].include?(initial_direction) && !directions.nil?
    puts "I don't want to have the sun in my eyes, but by all means have a go at it!"
  end

rescue ArgumentError => e
  print("Incorrect input, giving up.\n")
  exit
end
