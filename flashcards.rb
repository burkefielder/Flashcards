module Flashcards
  class Application
    def initialize
      @decks = []
    end

    def << deck
      @decks << deck
    end

    def play
      display_decks
      puts "Pick a deck: "
      deck = get_deck
      deck.play
    end

    def display_decks
      @decks.each { |deck| puts deck.name }
    end

    def get_deck
      name = gets.chomp
      @decks.detect { |deck| deck.name == name }
    end
  end

  class Card
    attr_accessor :front, :back

    def initialize(front, back)
      @front = front
      @back = back
    end

    def correct? guess
      guess == @back
    end

    def play
      puts "#{front} > "
      guess = gets.chomp
      if correct? guess
        puts "Correct"
      else
        puts "Incorrect. The answer was #{back}."
      end
    end
  end

  class MultipleAnswerCard < Card
    def correct? guess
      answers = @back.split(",")
      answers.any? { |answer| answer == guess }
    end
  end

  class Deck
    attr_reader :name, :cards
    def initialize(name)
      @name = name
      @cards = []
    end

    def << card
      @cards << card
    end

    def play
      shuffle
      @cards.each(&:play)
    end

    def shuffle
      @cards.shuffle!
    end
  end
end

card1 = Flashcards::Card.new("cat", "gato")
card2 = Flashcards::Card.new("dog", "cachorro")
card3 = Flashcards::Card.new("car", "carro")
card4 = Flashcards::MultipleAnswerCard.new("Violin", "baoirin, viiorin")

deck = Flashcards::Deck.new("Portuguese")
deck << card1
deck << card2
deck << card3
deck << card4

deck2 = Flashcards::Deck.new("Japanese")

app = Flashcards::Application.new
app << deck
app << deck2
app.play
