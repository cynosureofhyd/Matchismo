//
//  PlayingCard.h
//  Matchismo
//
//  Created by Cynosure on 4/21/13.
//  Copyright (c) 2013 Cynosure. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;

@property  (nonatomic) NSUInteger rank;

+(NSArray *) validSuits;

+(NSUInteger) maxRank;
@end
