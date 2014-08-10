//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by xu yijun on 8/9/14.
//  Copyright (c) 2014 Junior xu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

// designated initializer
- (instancetype)initWithCardCount:(NSInteger)count usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;

@end
