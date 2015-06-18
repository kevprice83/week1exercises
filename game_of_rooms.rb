class Room
    attr_accessor :description, :exits

    def initialize (description) 
        @description = description
        @exits = {}
    end

        def create_exit(exit, room)
        @exits[exit] = room
    end
end

class Character
    attr_accessor :location, :name

    def initialize(location)
        @name = ""
        @location = location
    end

    def choose_character
        p "To quit the game at any moment type q. Now! Choose your character. Type 1 for The Dark Knight or type 2 for Ultimate Warrior."
        choice = gets.chomp
            if choice == "1"
            @name = "The Dark Knight"
            elsif choice == "2"
            @name = "Ultimate Warrior"
            end
    end
end

class Game

    def initialize(character, world)
        @status = true
        @world = world
        @character = character
    end

    def run_game
        @character.choose_character
        p "You have chosen to become #{@character.name}. Good luck on your Journey!"
        while @status
            p @character.location.description
            input = gets.chomp
            if @character.location.exits[input]
                @character.location = @character.location.exits[input]
            else input == "q" 
                @status = false 
            p "That direction is not possible please try another way."
            end 
        end
    end 
end

castle_tower = Room.new("You are in a castle tower. It's cold and dark. There is an exit to the East and the South. Type N, E, S or W to move in the desired direction.")
main_hall = Room.new("You are in a large hall with burning lanterns. There are some dead bodies hanging on the walls. There is a stairway leading down to the South. Type N, E, S or W to move.")
dungeon = Room.new("There is no light in here. You are feeling your way around a creepy dungeon with your hands but you find three small exits. Which one would you like to take? Type N, E, S or W to take one of these exits or return to the last room.")
cave = Room.new("After crawling through a narrow passage you find yourself in a big cave. You can see light at an exit through a small hole in the rocks. Type N, E, S or W to move to squeeze through the rocks.")
forest = Room.new("You have found your way outside and you are standing in the middle of a forest. There are two paths. Which direction would you like to go next? Type N, E, S or W.")
swamp = Room.new("This place stinks! What is that smell? It's like rotting flesh...Which direction would you like to go? Type N, E, S or W to move in a direction.")

castle_tower.create_exit("E", main_hall)
castle_tower.create_exit("S", swamp)

main_hall.create_exit("S", dungeon)
main_hall.create_exit("W", castle_tower)

dungeon.create_exit("S", cave)
dungeon.create_exit("W", swamp)
dungeon.create_exit("N", main_hall)

cave.create_exit("W", forest)
cave.create_exit("N", dungeon)

forest.create_exit("N", swamp)
forest.create_exit("E", cave)

swamp.create_exit("E", dungeon)
swamp.create_exit("N", castle_tower)
swamp.create_exit("S", forest)
    
world = [castle_tower, main_hall, dungeon, cave, forest]

your_character = Character.new(world.sample)

your_game = Game.new(your_character, world)

your_game.run_game
