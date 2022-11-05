require "d_to_html"

class Creature
  def initialize name
    @name = name
    @asleep = false
    @maxhealth = 100
    @health = @maxhealth - rand(21)
    @defence = 0
    @armor = 0
    @saturation = 10 - rand(6)
    @digested = 7 - rand(8)

    p "#{@name} is bought."
    p "HP: #{@health} DEF: #{@defence} ARM: #{@armor} SAT: #{@saturation}, DIG: #{@digested}"
  end

  def train
    p "#{@name} hits the combat dummy!"
    if @saturation >= 7
      @maxhealth = @maxhealth + 1 + rand(5)
      p "Creature become stronger!"
    end
    if @maxhealth > 200
      @maxhealth = 200
    end
    @defence = @defence + 1
    passageOfTime
    p "HP: #{@health} DEF: #{@defence} ARM: #{@armor} SAT: #{@saturation}, DIG: #{@digested}"
  end

  def hunt
    p "#{@name} hunts."
    @health = @health + @defence + @armor - rand(11)
    @armor = @armor - rand(6)
    if @armor < 0
      @armor = 0
    end
    passageOfTime
    p "HP: #{@health} DEF: #{@defence} ARM: #{@armor} SAT: #{@saturation}, DIG: #{@digested}"
  end

  def quest
    p "#{@name} helps you complete the quest."
    @health = @health + @defence + @armor - 20 - rand(21)
    @armor = @armor - rand(21)
    if @armor < 0
      @armor = 0
    end
    2.times do
      passageOfTime
    end
    p "HP: #{@health} DEF: #{@defence} ARM: #{@armor} SAT: #{@saturation}, DIG: #{@digested}"
  end

  def elite_quest
    p "#{@name} helps you complete the elite quest."
    @health = @health + @defence + @armor - 20 - rand(51)
    @armor = @armor - rand(36)
    if @armor < 0
      @armor = 0
    end
    if @health >= 30
      @armor = @armor + rand(11)
      p "#{@name} found new armor!"
    end
    3.times do
      passageOfTime
    end
    p "HP: #{@health} DEF: #{@defence} ARM: #{@armor} SAT: #{@saturation}, DIG: #{@digested}"
  end

  def eat
    p "#{@name} eats raw meat."
    @health = @health + 1
    if @health > @maxhealth
      @health = @maxhealth
    end
    @saturation = @saturation + 2
    if @saturation > 10
      @saturation = 10
    end
    passageOfTime
    p "HP: #{@health} DEF: #{@defence} ARM: #{@armor} SAT: #{@saturation}, DIG: #{@digested}"
  end

  def feed
    p "#{@name} eats the cooked food."
    @health = @health + 5
    if @health > @maxhealth
      @health = @maxhealth
    end
    @saturation = @saturation + 4
    if @saturation > 10
      @saturation = 10
    end
    passageOfTime
    p "HP: #{@health} DEF: #{@defence} ARM: #{@armor} SAT: #{@saturation}, DIG: #{@digested}"
  end

  def heal
    p "#{@name} is healed."
    @health = @health + 20
    if @health > @maxhealth
      @health = @maxhealth
    end
    2.times do
      passageOfTime
    end
    p "HP: #{@health} DEF: #{@defence} ARM: #{@armor} SAT: #{@saturation}, DIG: #{@digested}"
  end

  def craft
    p "#{@name} improves armor."
    @armor = @armor + 1 * rand(3)
    if @armor > 50
      @armor = 50
    end
    passageOfTime
    p "HP: #{@health} DEF: #{@defence} ARM: #{@armor} SAT: #{@saturation}, DIG: #{@digested}"
  end

  def sleep
    p "#{@name} sleeps."
    @health = @health + 10
    if @health > @maxhealth
      @health = @maxhealth
    end
    @asleep = true
    3.times do
      if @asleep
        passageOfTime
      end
    end
    if @asleep
      @asleep = false
      p "#{@name} awaken."
    end
    p "HP: #{@health} DEF: #{@defence} ARM: #{@armor} SAT: #{@saturation}, DIG: #{@digested}"
  end

  def help
    p "Ігрові команди"
    p "t - приручена істота буде покращувати свій захист і міць."
    p "h - під час полювання істота може отримати незначні поранення."
    p "q - приручена істота буде допомагати вам проходити завдання."
    p "eq - істота буде допомагати вам проходити елітне завдання."
    p "e - приручена істота стане їсти сире м'ясо."
    p "f - істота буде їсти приготовлену їжу."
    p "hl - приручена істота стане зцілюватися."
    p "c - істота стане робити чи вдосконалювати наявні обладунки."
    p "s - приручена істота почне спати."
    p "exit - вихід з гри."
  end

  private

  def hungry?
    @saturation <= 3
  end

  def stool?
    @digested >= 8
  end

  def passageOfTime
    if @saturation > 0
      @saturation = @saturation - 1
      @digested = @digested + 1
    else
      if @asleep
        @asleep = false
        p "Creature suddenly awakes!"
      end
      p "#{@name} is hungry! Сreature charges and kills you!"
      p "GAME OVER"
      exit
    end

    if @health <= 0
      p "Oh no! Your #{@name} is dead!"
      p "HP: #{@health} DEF: #{@defence} ARM: #{@armor} SAT: #{@saturation}, DIG: #{@digested}"
      p "GAME OVER"
      exit
    end

    if hungry?
      if @asleep
        @asleep = false
        @health = @health - rand(6)
        p "Creature awakes and look at you with tired eyes."
      end
      p "The #{@name} rumbles..."
    end

    if stool?
      if @asleep
        @asleep = false
        p "Creature suddenly awakes!"
      end
      p "#{@name} runs into the bushes."
      @digested = @digested - 2 * rand(4)
    end

    Page.save(info_html, bypass_html: true)
    if @health >= 40
      @life_unicode_status = '&#10084;'
    elsif @health < 40 && @health >= 0
      @life_unicode_status = '&#128148;'
    else
      @life_unicode_status = '&#9760;'
    end
  end

  def info_html
    <<~HTML
      <p style="color:#5499C7; text-align: center; font-size: 32px; font-family: Menlo, serif">Name: #{@name}</p>
      <p style="color:#5499C7; text-align: center; font-size: 32px; font-family: Menlo, serif">HP:   #{@health}</p>
      <p style="color:#5499C7; text-align: center; font-size: 32px; font-family: Menlo, serif">DEF:  #{@defence}</p>
      <p style="color:#5499C7; text-align: center; font-size: 32px; font-family: Menlo, serif">ARM:  #{@armor}</p>
      <p style="color:#5499C7; text-align: center; font-size: 32px; font-family: Menlo, serif">SAT:  #{@saturation}</p>
      <p style="color:#5499C7; text-align: center; font-size: 32px; font-family: Menlo, serif">DIG:  #{@digested}</p>
      <p style="text-align: center; font-size: 64px">#{@life_unicode_status}</p>
    HTML
  end
end

p "What creature do you want to buy?"

name = gets.chomp
pet = Creature.new(name)

p "help - довідка."

command = nil

until command == "exit" do
  command = gets.chomp

  case command
  when 't'
    pet.train
  when 'h'
    pet.hunt
  when 'q'
    pet.quest
  when 'eq'
    pet.elite_quest
  when 'e'
    pet.eat
  when 'f'
    pet.feed
  when 'hl'
    pet.heal
  when 'c'
    pet.craft
  when 's'
    pet.sleep
  when 'help'
    pet.help
  when 'exit'
      exit
  end
end
