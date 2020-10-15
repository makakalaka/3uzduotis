# frozen_string_literal: true

# class
class Person
  attr_accessor :gender, :height, :weight # nurodo, kad atributai bus public
  # konstruktorius
  def initialize(gender, height, weight)
    @gender = gender.to_i # priskiriu reiksmes objektui
    @height = height.to_f
    @weight = weight.to_f
  end
end

def target_index_finder(people)
  target_index = -1
  (0...people.length).each do |index|
    target_index = index if people[index].height.zero?
  end
  target_index
end

def unless_true(people, my_index, target_index)
  true if people[my_index].gender == people[target_index].gender && my_index != target_index
end

def euclidean_formula(people, my_index, target_index)
  Math.sqrt((people[my_index].weight - people[target_index].weight)**2)
end

def manhattan_formula(people, my_index, target_index)
  (people[my_index].weight - people[target_index].weight).abs
end

# metodas, ieskantis ugio
def euclidean(people, target_index, ratio_index, ratio)
  (0...people.length).each do |index|
    next unless unless_true(people, index, target_index)

    next unless euclidean_formula(people, index, target_index) < ratio

    ratio = euclidean_formula(people, index, target_index)
    ratio_index = index
  end
  puts "euclidean-Atitikmuo:  #{ratio_index} asmuo, ugis:#{people[ratio_index].height}"
end

# visi 3 metodai veikia analogiskai, skiriasi tik pagrindine formule
def manhattan(people, target_index, ratio_index, ratio)
  (0...people.length).each do |index|
    next unless unless_true(people, index, target_index)

    next unless manhattan_formula(people, index, target_index) < ratio

    ratio = manhattan_formula(people, index, target_index)
    ratio_index = index
  end
  puts "manhattan-Atitikmuo:  #{ratio_index} asmuo, ugis:#{people[ratio_index].height}"
end

def maximum(people, target_index, ratio_index, ratio)
  (0...people.length).each do |index|
    next unless unless_true(people, index, target_index)

    next unless manhattan_formula(people, index, target_index) < ratio

    ratio = manhattan_formula(people, index, target_index)
    ratio_index = index
  end
  puts "maximum-Atitikmuo:  #{ratio_index} asmuo, ugis:#{people[ratio_index].height}"
end

people = [] # sukuriamas masyvas
# masyvas uzpildomas zmonemis
people << Person.new(0, 165, 55)
people << Person.new(1, 201, 95)
people << Person.new(0, 171, 60)
people << Person.new(1, 194, 102)
people << Person.new(1, 0, 80)
people << Person.new(1, 189, 90)
puts 'ID : gender : height : weight---------------'
(0...people.length).each do |index| # spausdina pradinius duomenis
  puts " #{index + 1} : #{people[index].gender} : #{people[index].height} : #{people[index].weight}"
end
# vykdo algoritmus
target_index = target_index_finder(people)
ratio_index = -1
ratio = 99_999

euclidean(people, target_index, ratio_index, ratio)
manhattan(people, target_index, ratio_index, ratio)
maximum(people, target_index, ratio_index, ratio)
