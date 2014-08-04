//
//  Card.h
//  Matchismo
//
//  Created by xu yijun on 8/2/14.
//  Copyright (c) 2014 Junior xu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

// strong 同生同灭
// nonatomic 不需要使用线程安全，提高性能
@property (strong, nonatomic) NSString *contents;

// 基础数据类型，非引用类型，无需 strong
@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;

@end
