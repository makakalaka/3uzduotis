# frozen_string_literal: true

STDOUT.sync = true
STDIN.sync = true
# class
class Calculator
  def initialize(amount)
    # konstruktorius
    @amount = amount.to_f # priskiriu reiksme objektui
    @price = 0
  end

  def if_251
    return unless @amount > 250 # jei kiekis didesnis nei 250

    @price += (@amount - 250) * 1.5 # kaina = viskas kas virs 250 * 1.5
    @amount -= (@amount - 250) # is kilovatu sumos atima kilovatus, kuriuos padaugino
  end

  def if_250
    return unless @amount <= 250 && @amount > 150 # ta pati logika kaip ir pirmoje salygoje

    @price += (@amount - 150) * 1.2
    @amount -= (@amount - 150)
  end

  def if_150
    return unless @amount <= 150 && @amount > 50

    @price += (@amount - 50) * 0.75
    @amount -= (@amount - 50)
  end

  def if_50
    return unless @amount <= 50 # likes kilovatu likutis dauginamas

    @price += @amount * 0.5
    @amount = @amount - @amount - 50
  end

  # metodas skaiciuojantis kaina: kilovatai * kaina (kaina priklauso nuo kiekio, intervalais)
  def calculate_price
    # atskiri ifai, nes logika pagal eiles tvarka (po kiekvieno IF mazeja kw skaicius)
    if_251
    if_250
    if_150
    if_50
    @price # grazina kaina
  end
end

puts 'Iveskite KW skaiciu:'
kw = gets # read from console
calc = Calculator.new(kw) # sukuriamas objektas ir paduodama reiksme i konstruktoriu
puts "Moketi: #{calc.calculate_price}" # spausdinamas rezultatas
