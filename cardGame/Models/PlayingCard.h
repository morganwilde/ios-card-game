//
//  PlayingCard.h
//  cardGame
//
//  Created by Morgan Wilde on 02/05/2014.
//  Copyright (c) 2014 morganwilde. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSArray *)rankStrings;
+ (NSUInteger)maxRank;

@end
