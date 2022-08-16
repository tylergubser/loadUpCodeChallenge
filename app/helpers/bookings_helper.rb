module BookingsHelper

    def price_engine (animal_type, requested_hours)
        
        if animal_type.downcase == "dog"
           (requested_hours * 10) + 20
        elsif animal_type.downcase == "cat"
            (requested_hours * 5) + 20
        else
            nil
        end
    end
end
