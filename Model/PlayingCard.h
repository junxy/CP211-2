//
//  PlayingCard.h
//  Matchismo
//
//  Created by xu yijun on 8/4/14.
//  Copyright (c) 2014 Junior xu. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger) maxRank;

@end
