import Foundation

struct FlashyCard {
    var sideOne: String
    var sideTwo: String
}

struct FlashySet {
    var name: String?
    var cardsContained: [FlashyCard]
    
    init(nameOfFlashcardSet n: String?){
        self.name = n
        cardsContained = []
    }
    
    mutating func generateNewCard(sideOneOfCard s1: String, sideTwoOfCard s2: String) {
        self.cardsContained.append(FlashyCard(sideOne: s1, sideTwo: s2))
        // Will take in card strings provided by user and cast them into FlashyCards.
    }
    func randomizeCardSets() -> [FlashyCard]{
        let flashyCardsInSet: Int = self.cardsContained.count
        // Get count of cards in set
        
        var shuffledSetOfFlashyCards: [FlashyCard] = []
        // This array, while currently empty will be returned.
        
        var arrayOfAlreadyUsedCards: [Int] = []
        // I will use this array in the while loop to determine cards already in the shuffled set.
        
        while shuffledSetOfFlashyCards.count != flashyCardsInSet {
            let randomNumber = Int(arc4random_uniform(UInt32(flashyCardsInSet+1)))
            // Gen random number to be used in this level
            
            if arrayOfAlreadyUsedCards.contains(randomNumber) != true {
                shuffledSetOfFlashyCards.append(self.cardsContained[randomNumber])
                arrayOfAlreadyUsedCards.append(randomNumber)
                // If randomNumber is indeed in arrayOfAlreadyUsedCards and hence, in shuffledSetOfFlashyCards, ignore it and try again. There is probably some .shuffle method Apple uses for this particular reson but where's the fun in that?
            }
            
        }
        
        return shuffledSetOfFlashyCards
        //Now that shuffledSetOfFlashyCards has the full contents of self.cardsContained, we can return it.
    }
}






