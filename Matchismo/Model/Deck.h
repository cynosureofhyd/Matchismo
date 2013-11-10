//
//  Deck.h
//  Matchismo
//
//  Created by Cynosure on 4/21/13.
//  Copyright (c) 2013 Cynosure. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
@interface Deck : NSObject
-(void)addCard:(Card *)card atTop:(BOOL) atTop;

-(Card *)drawRandomCard;
@end
