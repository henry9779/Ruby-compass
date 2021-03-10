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
  # 將箭頭用 hash 存起來，之後用 key 得出箭頭
  unicode = {
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

  base_3 = directions.to_s(3).to_i
  # 將 directions 做 3 進位

  # base_3 為單個數且數字大於等於0時
  if [1].include?(initial_direction) && base_3 >= 0
    case
      when base_3 == 0
        puts ""
        puts "Ok, you want to first look this way: #{unicode['N']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{unicode['N']}"
        puts ""
        puts "Let's go then!"
        puts unicode['N']
      when base_3 == 1
        puts ""
        puts "Ok, you want to first look this way: #{unicode['N']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{unicode['WN']}"
        puts ""
        puts "Let's go then!"
        puts unicode['WN']
      when base_3 == 2
        puts ""
        puts "Ok, you want to first look this way: #{unicode['N']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{unicode['NE']}"
        puts ""
        puts "Let's go then!"
        puts unicode['NE']
    end
  end

  if [2].include?(initial_direction) && base_3 >= 0
    case
      when base_3 == 0
        puts ""
        puts "Ok, you want to first look this way: #{unicode['E']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{unicode['E']}"
        puts ""
        puts "I don't want to have the sun in my eyes, but by all means have a go at it!"
      when base_3 == 1
        puts ""
        puts "Ok, you want to first look this way: #{unicode['E']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{unicode['NE']}"
        puts ""
        puts "I don't want to have the sun in my eyes, but by all means have a go at it!"
      when base_3 == 2
        puts ""
        puts "Ok, you want to first look this way: #{unicode['E']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{unicode['ES']}"
        puts ""
        puts "I don't want to have the sun in my eyes, but by all means have a go at it!"
    end
  end

  if [3].include?(initial_direction) && base_3 >= 0
    case
      when base_3 == 0
        puts ""
        puts "Ok, you want to first look this way: #{unicode['S']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{unicode['S']}"
        puts ""
        puts "Let's go then!"
        puts unicode['S']
      when base_3 == 1
        puts ""
        puts "Ok, you want to first look this way: #{unicode['S']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{unicode['ES']}"
        puts ""
        puts "Let's go then!"
        puts unicode['ES']
      when base_3 == 2
        puts ""
        puts "Ok, you want to first look this way: #{unicode['S']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{unicode['SW']}"
        puts ""
        puts "Let's go then!"
        puts unicode['SW']
    end
  end

  if [4].include?(initial_direction) && base_3 >= 0
    case
      when base_3 == 0
        puts ""
        puts "Ok, you want to first look this way: #{unicode['W']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{unicode['W']}"
        puts ""
        puts "I don't want to have the sun in my eyes, but by all means have a go at it!"
      when base_3 == 1
        puts ""
        puts "Ok, you want to first look this way: #{unicode['W']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{unicode['SW']}"
        puts ""
        puts "I don't want to have the sun in my eyes, but by all means have a go at it!"
      when base_3 == 2
        puts ""
        puts "Ok, you want to first look this way: #{unicode['W']}"
        puts ""
        puts "In base 3, the second input reads as: #{base_3}"
        puts "So that's how you want to go: #{unicode['WN']}"
        puts ""
        puts "I don't want to have the sun in my eyes, but by all means have a go at it!"
    end
  end

  base_3_arr = base_3.to_s.split('').to_a
  i = 0
  rs = []
  # 判斷 base_3 為多個數且陣列數量大於2時
  if [1].include?(initial_direction) && base_3_arr.size > 2
    puts "Ok, you want to first look this way: #{unicode['N']}"
    puts ""
    puts "In base 3, the second input reads as: #{base_3}"
    puts "So that's how you want to go: #{rs.join}"
    puts ""
    puts "Let's go then!"
    base_3_arr.each do |n|
      case
      when n == '0'
        arr = []
        (i).times { arr.push(" ")}
        arr.push(unicode['N'])
        puts arr.join

      when n == '1'
        arr = []
        (i + 1).times { arr.push(" ")}
        arr.push(unicode['WN'])
        puts arr.join
        i += 1

      when n == '2'
        arr = []
        (i + 1).times { arr.push(" ")}
        arr.push(unicode['NE'])
        puts arr.join
        i -= 1
      end
    end
  end

  if [2].include?(initial_direction) && base_3_arr.size > 2
    base_3_arr.each do |n|
      case
      when n == '0'
        rs << unicode['E']
      when n == '1'
        rs << unicode['NE']
      when n == '2'
        rs << unicode['ES']
      end
    end
    puts "Ok, you want to first look this way: #{unicode['E']}"
    puts ""
    puts "In base 3, the second input reads as: #{base_3}"
    puts "So that's how you want to go: #{rs.join}"
    puts ""
    puts "I don't want to have the sun in my eyes, but by all means have a go at it!"
  end

  if [3].include?(initial_direction) && base_3_arr.size > 2
    puts "Ok, you want to first look this way: #{unicode['S']}"
    puts ""
    puts "In base 3, the second input reads as: #{base_3}"
    puts "So that's how you want to go: #{rs.join}"
    puts "Let's go then!"
    base_3_arr.each do |n|
      case
      when n == '0'
        arr = []
        (i).times { arr.push(" ")}
        arr.push(unicode['S'])
        puts arr.join

      when n == '1'
        arr = []
        (i + 1).times { arr.push(" ")}
        arr.push(unicode['ES'])
        puts arr.join
        i += 1

      when n == '2'
        arr = []
        (i + 1).times { arr.push(" ")}
        arr.push(unicode['SW'])
        puts arr.join
        i += 1
      end
      # 先抓出最小值
      # 如果最小值為負數歸零
    end
  end

  if [4].include?(initial_direction) && base_3_arr.size > 2
    base_3_arr.each do |n|
      case
      when n == '0'
        rs << unicode['W']
      when n == '1'
        rs << unicode['SW']
      when n == '2'
        rs << unicode['WN']
      end
    end
      puts "Ok, you want to first look this way: #{unicode['W']}"
      puts ""
      puts "In base 3, the second input reads as: #{base_3}"
      puts "So that's how you want to go: #{rs.join}"
      puts ""
      puts "I don't want to have the sun in my eyes, but by all means have a go at it!"
  end

rescue ArgumentError => e
  print("Incorrect input, giving up.\n")
  exit
end
