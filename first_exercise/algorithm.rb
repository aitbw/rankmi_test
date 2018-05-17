def get_indexes(ary, pair, target)
  idx1 = ary.index(pair[0])
  idx2 = ary.index(pair[1])
  puts "Los valores del array ingresado para obtener #{target} se encuentran en las posiciones #{idx1} y #{idx2}"
end

def calculate_args_for_target(ary, target)
  combinations = ary.combination(2).to_a
  combinations.map { |pair| get_indexes(ary, pair, target) if pair.reduce(:+) == target }
end

def reject_invalid_numbers(ary, target)
  new_ary = ary.reject { |n| n > target }

  if new_ary.empty?
    puts "Todos los números que conforman el array son mayores a #{target}"
  elsif new_ary.size == 1
    puts 'El array contiene un solo elemento válido'
  elsif new_ary.size == 2
    if new_ary.reduce(:+) == target
      puts "Los valores #{new_ary} que conforman el array permiten obtener #{target}"
    else
      puts "Los valores #{new_ary} que conforman el array no permiten obtener #{target}"
    end
  else
    calculate_args_for_target(new_ary, target)
  end
end

def user_input
  print 'Ingrese un array de números enteros (separados entre sí): '
  ary = gets.split(' ').map(&:to_i)

  print 'Ingrese el resultado esperado: '
  target = gets.chomp.to_i

  reject_invalid_numbers(ary, target)
end

user_input
