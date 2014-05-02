//
//  CardMatchingGame.m
//  cardGame
//
//  Created by Morgan Wilde on 02/05/2014.
//  Copyright (c) 2014 morganwilde. All rights reserved.
//

#define PENALTY 1
#define BONUS 4

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards;
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return self.cards[index];
}

- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    NSLog(@"card. = %d", [self.cards count]);
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore * BONUS;
                        otherCard.matched = YES;
                        card.matched = YES;
                    } else {
                        self.score -= PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
            self.score -= PENALTY;
            card.chosen = YES;
        }
    }
}

@end
