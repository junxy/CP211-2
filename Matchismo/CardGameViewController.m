//
//  CardGameViewController.m
//  Matchismo
//
//  Created by xu yijun on 8/2/14.
//  Copyright (c) 2014 Junior xu. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "Deck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation CardGameViewController

- (IBAction)resetButton:(UIButton *)sender {
    UIAlertView *resetConfirm = [[UIAlertView alloc] initWithTitle:@"Reset Confirm"
                                                           message:@"Are you sure?"
                                                          delegate:self
                                                 cancelButtonTitle:@"Cancel"
                                                 otherButtonTitles:@"OK", nil];
    [resetConfirm show];
}

// ref: http://code.tutsplus.com/tutorials/ios-sdk-working-with-uialertview-and-uialertviewdelegate--mobile-3159
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    NSLog(@"Button %@ was selected.",title);
    if ([title isEqualToString:@"OK"]) {
        //TODO: reset
        NSLog(@"todo reset");
    }
}

- (CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                         usingDeck:[self createDeck]];
    // 少了个金叹号，找了半天BUG啊，，，好在 Xcode 调试起来还不错
//    NSLog(@"game => %@",_game);
    return _game;
}

- (Deck *)deck
{
    if(!_deck) _deck = [self createDeck];
    return _deck;
}

- (Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"flipCount changed to %d", self.flipCount);
}

- (IBAction)touchCardButton:(UIButton *)sender
{
//    if ([sender.currentTitle length]) {
//        [sender setBackgroundImage:[UIImage imageNamed:@"CardBack"]
//                          forState:UIControlStateNormal];
//        [sender setTitle:@"" forState:UIControlStateNormal];
//    } else {
//        Card *randomCard = [self.deck drawRandomCard];
//        if (randomCard) {
//            [sender setBackgroundImage:[UIImage imageNamed:@"CardFront"]
//                              forState:UIControlStateNormal];
//            [sender setTitle:randomCard.contents forState:UIControlStateNormal];
//        }
//    }
    
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
    self.flipCount++;
}

- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState: UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    }
}

- (NSString *) titleForCard:(Card *)card
{
    NSString *result = card.isChosen ? card.contents : @"";
//    NSString *result = card.isChosen ? @"current" : @"";
    NSLog(@"card title => current :%@, origin: %@", result, card.contents);
    return result;
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    NSLog(@"card isChosen => %d, content => %@", card.isChosen, card.contents);
    return [UIImage imageNamed: card.isChosen ? @"CardFront" : @"CardBack"];
}

@end
