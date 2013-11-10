//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Cynosure on 4/21/13.
//  Copyright (c) 2013 Cynosure. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject
- (id) initWithCardCount : (NSUInteger) cardCount
               usingDeck : (Deck *) deck;

-(void) flipCardAtIndex : (NSUInteger) index;

-(Card *) cardAtIndex : (NSUInteger) index;

-(void) resetUI;

@property (nonatomic, readonly) int score;
@end
