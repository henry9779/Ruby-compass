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
  routes = {
    'N' => '↑',
    'NE' => '↗',
    'E' => '→',
    'ES' => '↘',
    'S' => '↓',
    'SW' => '↙',
    'W' => '←',
    'WN' => '↖'
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


  def direction_view(routes, initial_direction, directions)
    # 將 directions 做 3 進位
    base_3 = directions.to_s(3).to_i
    maps = get_directions_maps(initial_direction, directions)
    go_maps = maps[1]
    base_3_arr = base_3.to_s.split('')
    # steps = []
    # base_3_arr.each do |n|
    #   steps << go_maps[n]
    # end
    # steps.map { |step| routes[step] }
    base_3_arr.map { |n| routes[go_maps[n]] }.join('')
  end

  def get_directions_maps(initial_direction, directions)
    config = {
      '10': ['N', ['N', 'WN', 'NE']],
      '11': ['WN', []],
      '12': ['NE', []]
    }
    config["#{initial_direction}#{directions}"]
  end

  expect = ->(a = [], b = '') do
    rs = direction_view(routes, a[0], a[1])
    p rs
    p rs == b
  end

  expect.([1, 0], '0121021')

  # base_3 為單個數且數字大於等於0時
  if [1].include?(initial_direction) && base_3 >= 0
    case
      when base_3 == 0
        puts ""
        puts "Ok, you want to first look this way: #{routes['N']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{routes['N']}"
        puts ""
        puts "Let's go then!"
        puts routes['N']
      when base_3 == 1
        puts ""
        puts "Ok, you want to first look this way: #{routes['N']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{routes['WN']}"
        puts ""
        puts "Let's go then!"
        puts routes['WN']
      when base_3 == 2
        puts ""
        puts "Ok, you want to first look this way: #{routes['N']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{routes['NE']}"
        puts ""
        puts "Let's go then!"
        puts routes['NE']
    end
  end

  if [2].include?(initial_direction) && base_3 >= 0
    case
      when base_3 == 0
        puts ""
        puts "Ok, you want to first look this way: #{routes['E']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{routes['E']}"
        puts ""
        puts "I don't want to have the sun in my eyes, but by all means have a go at it!"
      when base_3 == 1
        puts ""
        puts "Ok, you want to first look this way: #{routes['E']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{routes['NE']}"
        puts ""
        puts "I don't want to have the sun in my eyes, but by all means have a go at it!"
      when base_3 == 2
        puts ""
        puts "Ok, you want to first look this way: #{routes['E']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{routes['ES']}"
        puts ""
        puts "I don't want to have the sun in my eyes, but by all means have a go at it!"
    end
  end

  if [3].include?(initial_direction) && base_3 >= 0
    case
      when base_3 == 0
        puts ""
        puts "Ok, you want to first look this way: #{routes['S']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{routes['S']}"
        puts ""
        puts "Let's go then!"
        puts routes['S']
      when base_3 == 1
        puts ""
        puts "Ok, you want to first look this way: #{routes['S']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{routes['ES']}"
        puts ""
        puts "Let's go then!"
        puts routes['ES']
      when base_3 == 2
        puts ""
        puts "Ok, you want to first look this way: #{routes['S']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{routes['SW']}"
        puts ""
        puts "Let's go then!"
        puts routes['SW']
    end
  end

  if [4].include?(initial_direction) && base_3 >= 0
    case
      when base_3 == 0
        puts ""
        puts "Ok, you want to first look this way: #{routes['W']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{routes['W']}"
        puts ""
        puts "I don't want to have the sun in my eyes, but by all means have a go at it!"
      when base_3 == 1
        puts ""
        puts "Ok, you want to first look this way: #{routes['W']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{routes['SW']}"
        puts ""
        puts "I don't want to have the sun in my eyes, but by all means have a go at it!"
      when base_3 == 2
        puts ""
        puts "Ok, you want to first look this way: #{routes['W']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{routes['WN']}"
        puts ""
        puts "I don't want to have the sun in my eyes, but by all means have a go at it!"
    end
  end

  base_3_arr = base_3.to_s.split('')
  steps = []
  i = 0

  # 判斷 base_3 為多個數且陣列數量大於2時
  if [1].include?(initial_direction) && base_3_arr.size > 2
    base_3_arr.each do |n|
      case
      when n == '0'
        steps.push(routes['N'])

      when n == '1'
        steps.push(routes['WN'])

      when n == '2'
        steps.push(routes['NE'])
      end
    end

    puts "Ok, you want to first look this way: #{routes['N']}"
    puts ""
    puts "In base 3, the second input reads as: #{base_3}"
    puts "So that's how you want to go: #{steps.join}"
    puts ""
    puts "Let's go then!"

    i = (steps.count('↖') - steps.count('↗')).abs

    base_3_arr.reverse!.each do |n|
      case
      when n == '0'
      arr = []
      (i).times { arr << (" ") }
      arr << routes['N']
      puts arr.join

      when n == '1'
      arr = []
      (i + 1).times { arr << (" ") }
      arr << routes['WN']
      puts arr.join
      i += 1

      when n == '2'
      arr = []
      (i - 1).times { arr << (" ") }
      arr << routes['NE']
      puts arr.join
      i -= 1
      end
    end
  end

  if [2].include?(initial_direction) && base_3_arr.size > 2
    base_3_arr.each do |n|
      case
      when n == '0'
        steps << routes['E']
      when n == '1'
        steps << routes['NE']
      when n == '2'
        steps << routes['ES']
      end
    end
    puts "Ok, you want to first look this way: #{routes['E']}"
    puts ""
    puts "In base 3, the second input reads as: #{base_3}"
    puts "So that's how you want to go: #{steps.join}"
    puts ""
    puts "I don't want to have the sun in my eyes, but by all means have a go at it!"
  end

  if [3].include?(initial_direction) && base_3_arr.size > 2
    base_3_arr.each do |n|
      case
      when n == '0'
        steps << routes['S']

      when n == '1'
        steps << routes['ES']

      when n == '2'
        steps << routes['SW']

      end
    end

    puts "Ok, you want to first look this way: #{routes['S']}"
    puts ""
    puts "In base 3, the second input reads as: #{base_3}"
    puts "So that's how you want to go: #{steps.join}"
    puts "Let's go then!"

    i = (steps.count('↙')-steps.count('↘')).abs

    base_3_arr.each do |n|
      case
      when n == '0'
      arr = []
      (i).times { arr << (" ") }
      arr << routes['S']
      puts arr.join

      when n == '1'
      arr = []
      (i + 1).times { arr << (" ") }
      arr << routes['ES']
      puts arr.join
      i += 1

      when n == '2'
      arr = []
      (i - 1).times { arr << (" ") }
      arr << routes['SW']
      puts arr.join
      i -= 1
      end
    end
  end

  if [4].include?(initial_direction) && base_3_arr.size > 2
    base_3_arr.each do |n|
      case
      when n == '0'
        steps << routes['W']
      when n == '1'
        steps << routes['SW']
      when n == '2'
        steps << routes['WN']
      end
    end
    puts "Ok, you want to first look this way: #{routes['W']}"
    puts ""
    puts "In base 3, the second input reads as: #{base_3}"
    puts "So that's how you want to go: #{steps.join}"
    puts ""
    puts "I don't want to have the sun in my eyes, but by all means have a go at it!"
  end

rescue ArgumentError => e
  print("Incorrect input, giving up.\n")
  exit
end
