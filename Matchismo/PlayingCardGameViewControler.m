//
//  PlayingCardGameViewControlerViewController.m
//  Matchismo
//
//  Created by Peiro Bonet, Jose Antonio on 12/07/2018.
//  Copyright © 2018 Epeuva. All rights reserved.
//

#import "PlayingCardGameViewControler.h"
#import "PlayingCardDeck.h"

@interface PlayingCardGameViewControler ()

@end

@implementation PlayingCardGameViewControler

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}


@end
