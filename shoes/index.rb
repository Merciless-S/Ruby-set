require_relative '../Utility.rb'
arr = Utility.generate_all_cards()
cards = Utility.generateCard!(arr)
puts cards[0].to_s
Shoes.app do
    @shoes = stack do
        flow do
            image(
                "../images/"+cards[0].to_s+".png",
            )
            button "select"
            image(
                "../images/"+cards[1].to_s+".png",
            )
            button "select"
            image(
                "../images/"+cards[2].to_s+".png",
            )
            button "select"
        end

        flow do
            image(
                "../images/"+cards[3].to_s+".png",
            )
            button "select"
            image(
                "../images/"+cards[4].to_s+".png",
            )
            button "select"
            image(
                "../images/"+cards[5].to_s+".png",
            )
            button "select"
        end

        flow do
            image(
                "../images/"+cards[6].to_s+".png",
            )
            button "select"
            image(
                "../images/"+cards[7].to_s+".png",
            )
            button "select"
            image(
                "../images/"+cards[8].to_s+".png",
            )
            button "select"
        end
        flow do
            image(
                "../images/"+cards[9].to_s+".png",
            )
            button "select"
            image(
                "../images/"+cards[10].to_s+".png",
            )
            button "select"
            image(
                "../images/"+cards[11].to_s+".png",
            )
            button "select"
        end
    end
end