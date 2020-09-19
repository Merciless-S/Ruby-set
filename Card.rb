class Card
    
    #Shading means if the shading of the card. solid = 0, striped = 1, open = 2.
    #Color means the color of the card, Red = 0, blue = 1, yellow = 2, etc
    #shape means the shape of the card. Circle = 0, rectangle = 1, triangle = 2, etc
    #number means number of the card. 
    def initialize()
	@shading = rand(0..2)
        @color = rand(0..2)
        @shape = rand(0..2)
        @number = rand(1..3)
    end
        
    def shading
	@shading
    end

    def color
        @color
    end
    
    def shape
        @shape
    end
    
    def number
        @number
    end
end
