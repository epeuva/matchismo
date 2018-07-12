//
//  ViewController.h
//  Matchismo
//
//  Created by Josep on 03/07/2018.
//  Copyright © 2018 Epeuva. All rights reserved.
//
// Abstract class. Must implement mothods as describen below.

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface ViewController : UIViewController

// protected
// for subclasses
- (Deck *)createDeck; // abstract

@end

