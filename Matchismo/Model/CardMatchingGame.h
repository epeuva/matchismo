//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Josep on 05/07/2018.
//  Copyright © 2018 Epeuva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

//designated initializer
- (instancetype) initWithCardCount: (NSUInteger)count usingDeck:(Deck *)deck;

- (void) chooseCardAtIndex: (NSUInteger)index;
- (Card *) cardAtIndex: (NSUInteger)index;


@property (nonatomic, readonly) NSInteger score;


@end
