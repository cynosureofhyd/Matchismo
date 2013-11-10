//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Cynosure on 4/21/13.
//  Copyright (c) 2013 Cynosure. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property  (strong, nonatomic) Deck *deck;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
- (IBAction)dealClicked:(UIButton *)sender;
@property (strong, nonatomic) CardMatchingGame *game;
@end

@implementation CardGameViewController

-(Deck *) deck
{
    if(!_deck) _deck = [[PlayingCardDeck alloc] init];
    return _deck;
}

- (IBAction)dealClicked:(UIButton *)sender {
    self.game = nil;
    
    [self updateUI];
}

-(CardMatchingGame *)game
{
    if(!_game) _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count usingDeck:self.deck];
    return _game;
}

- (IBAction)flipCard:(UIButton *)sender {
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    [self updateUI];
}

-(void) resetUI
{
    if(_game) _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count usingDeck:self.deck];
    
    if(!_game) _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count usingDeck:self.deck];
    
    
    for(UIButton *cardButton in self.cardButtons)
    {
        Card *card = [self.deck drawRandomCard];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = 1.0;
//        [cardButton setTitle:card.contents forState:UIControlStateDisabled | UIControlStateSelected];
    }
//    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", 0];
}


-(void) updateUI
{
    for(UIButton *cardButton in self.cardButtons)
    {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected | UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        
        cardButton.alpha = card.isUnplayable ? 0.2 : 1.0;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score : %d", self.game.score];
}


-(void) setFlipCount: (int) flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"flips updated to %d", self.flipCount);
}

@end
