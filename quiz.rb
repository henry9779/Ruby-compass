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
# - so the sequence of arrows again, but nicely displayed.
# - you may use the unicode array for output: ['↑', '↗', '→', '↘', '↓', '↙', '←', '↖']

begin
  unicode = {
    '1' => '↑',
    '1-l' => '↖',
    '1-r' => '↗',
    '2' => '→',
    '2-l' => '↗',
    '2-r' => '↘',
    '3' => '↓',
    '3-l' => '↘',
    '3-r' => '↙',
    '4' => '←',
    '4-l' => '↙',
    '4-r' => '↖',
  }

  print('Enter an integer between 1 and 4 and a positive integer: ')
  initial_direction, directions = gets.split()
  if initial_direction.size != 1 || directions.size > 1 && directions[0] == '0'
      raise ArgumentError
  end

  initial_direction = initial_direction.to_i
  directions = directions.to_i
  base_3 = directions.to_s(3).to_i
  if ![1, 2, 3, 4].include?(initial_direction) || directions < 0
      raise ArgumentError
  end

  # base_3 為單個數時
  if [1].include?(initial_direction) && base_3.size >= 0
    case
      when base_3 == 0
        puts ""
        puts "Ok, you want to first look this way: #{unicode['1']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{unicode['1']}"
        puts ""
        puts "Let's go then!"
        puts unicode['1']
      when base_3 == 1
        puts ""
        puts "Ok, you want to first look this way: #{unicode['1']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{unicode['1-l']}"
        puts ""
        puts "Let's go then!"
        puts unicode['1-l']
      when base_3 == 2
        puts ""
        puts "Ok, you want to first look this way: #{unicode['1']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{unicode['1-r']}"
        puts ""
        puts "Let's go then!"
        puts unicode['1-r']
    end
  end

  if [2].include?(initial_direction) && base_3 >= 0
    case
      when base_3 == 0
        puts ""
        puts "Ok, you want to first look this way: #{unicode['2']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{unicode['2']}"
        puts ""
        puts "I don't want to have the sun in my eyes, but by all means have a go at it!"
      when base_3 == 1
        puts ""
        puts "Ok, you want to first look this way: #{unicode['2']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{unicode['2-l']}"
        puts ""
        puts "I don't want to have the sun in my eyes, but by all means have a go at it!"
      when base_3 == 2
        puts ""
        puts "Ok, you want to first look this way: #{unicode['2']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{unicode['2-r']}"
        puts ""
        puts "I don't want to have the sun in my eyes, but by all means have a go at it!"
    end
  end

  if [3].include?(initial_direction) && base_3 >= 0
    case
      when base_3 == 0
        puts ""
        puts "Ok, you want to first look this way: #{unicode['3']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{unicode['3']}"
        puts ""
        puts "Let's go then!"
        puts unicode['3']
      when base_3 == 1
        puts ""
        puts "Ok, you want to first look this way: #{unicode['3']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{unicode['3-l']}"
        puts ""
        puts "Let's go then!"
        puts unicode['3-l']
      when base_3 == 2
        puts ""
        puts "Ok, you want to first look this way: #{unicode['3']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{unicode['3-r']}"
        puts ""
        puts "Let's go then!"
        puts unicode['3-r']
    end
  end

  if [4].include?(initial_direction) && base_3 >= 0
    case
      when base_3 == 0
        puts ""
        puts "Ok, you want to first look this way: #{unicode['4']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{unicode['4']}"
        puts ""
        puts "I don't want to have the sun in my eyes, but by all means have a go at it!"
      when base_3 == 1
        puts ""
        puts "Ok, you want to first look this way: #{unicode['4']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{unicode['4-l']}"
        puts ""
        puts "I don't want to have the sun in my eyes, but by all means have a go at it!"
      when base_3 == 2
        puts ""
        puts "Ok, you want to first look this way: #{unicode['4']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{unicode['4-r']}"
        puts ""
        puts "I don't want to have the sun in my eyes, but by all means have a go at it!"
    end
  end

  base_3_arr = base_3.to_s.split('').to_a
  # 判斷 base_3 為多個數時
  if [1].include?(initial_direction) && base_3_arr.size > 2
    base_3_arr.each do |n|
      case
      when n == '0'
        puts unicode['1']
      when n == '1'
        puts unicode['1-l']
      when n == '2'
        puts unicode['1-r']
      end
    end
  end

  if [2].include?(initial_direction) && base_3_arr.size > 2
    base_3_arr.each do |n|
      case
      when n == '0'
        puts unicode['2']
      when n == '1'
        puts unicode['2-l']
      when n == '2'
        puts unicode['2-r']
      end
    end
  end

  if [3].include?(initial_direction) && base_3_arr.size > 2
    base_3_arr.each do |n|
      case
      when n == '0'
        puts unicode['3']
      when n == '1'
        puts unicode['3-l']
      when n == '2'
        puts unicode['3-r']
      end
    end
  end

  if [4].include?(initial_direction) && base_3_arr.size > 2
    base_3_arr.each do |n|
      case
      when n == '0'
        puts unicode['4']
      when n == '1'
        puts unicode['4-l']
      when n == '2'
        puts unicode['4-r']
      end
    end
  end

rescue ArgumentError => e
  print("Incorrect input, giving up.\n")
  exit
end
