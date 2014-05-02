//
//  Deck.h
//  cardGame
//
//  Created by Morgan Wilde on 02/05/2014.
//  Copyright (c) 2014 morganwilde. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;
- (Card *)drawRandomCard;

@end
