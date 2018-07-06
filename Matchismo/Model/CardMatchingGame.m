//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Josep on 05/07/2018.
//  Copyright © 2018 Epeuva. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

// we only put readwrite when we want to rewrite a public readonly property on the private scope
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of Card

@end

@implementation CardMatchingGame

// Lazy instanzation
- (NSMutableArray *) cards  {
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

// Designated initializer
- (instancetype) initWithCardCount: (NSUInteger)count
                         usingDeck:(Deck *)deck {
    self = [super init];
    
    if (self) {
        for (int i=0; i<count;i++) {
            Card *card =[deck drawRandomCard];
            if(card) {
                //self.cards[i] = card;
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

- (Card *) cardAtIndex: (NSUInteger)index {
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void) chooseCardAtIndex: (NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            // match against another card
            for (Card *othercard in self.cards) {
                if (othercard.isChosen && !othercard.isMatched) {
                    int matchScore = [card match:@[othercard]];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        othercard.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        card.matched = NO;
                        othercard.matched = NO;
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }

}
// Default method des not include the proper init, so we return nil *number of cards and deck
- (instancetype) init {
    return nil;
}


             
             
@end
