require 'pry'

class Owner

  @@all = []

  # code goes here
  
  attr_reader :species, :name

    
  
    def initialize(name)
      @name = name
      @species = "human"
      @@all << self
      

    end

    def say_species
      "I am a #{species}."

    end

    def self.all
      @@all
    end

    def self.count
      @@all.count
    end

    def self.reset_all
      @@all.clear
    end

    def cats
      Cat.all.select { | cats | cats.owner == self}
    end

    def dogs
      Dog.all.select { | dogs | dogs.owner == self}
    end

    def buy_cat(name)
      #instance variable?
      Cat.new(name, self)
    end

    def buy_dog(name)
      Dog.new(name, self)
    end

    def walk_dogs
      dogs.each { |dog| dog.mood = "happy"}

    end

    def feed_cats
      cats.each { | cat | cat.mood = "happy"}
    end

    def sell_pets
      cats.each do | cat | 
        cat.mood = "nervous" 
        cat.owner = nil
      end
      
      dogs.each do | dog |
        dog.mood = "nervous"
        dog.owner = nil
      end

    end

    def list_pets
      "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
    end



end


