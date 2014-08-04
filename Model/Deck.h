//
//  Deck.h
//  Matchismo
//
//  Created by xu yijun on 8/4/14.
//  Copyright (c) 2014 Junior xu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
