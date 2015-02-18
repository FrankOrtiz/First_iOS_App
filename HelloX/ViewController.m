//
//  ViewController.m
//  HelloX
//
//  Created by Frank Ortiz on 2/17/15.
//  Copyright (c) 2015 Wyncode. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *die1;
@property (weak, nonatomic) IBOutlet UIButton *die2;
@property (weak, nonatomic) IBOutlet UIButton *rollDie;
@property (weak, nonatomic) IBOutlet UIButton *die3;
@property (weak, nonatomic) IBOutlet UIButton *die4;
@property (weak, nonatomic) IBOutlet UIButton *die5;
@property (weak, nonatomic) IBOutlet UIButton *resetGame;
@property (weak, nonatomic) IBOutlet UILabel *totalScore;
@property int die1Value;
@property int die2Value;
@property int die3Value;
@property int die4Value;
@property int die5Value;
@property int rollCount;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    [self.die1 setBackgroundColor:[UIColor orangeColor]];
//    self.die2.backgroundColor=[UIColor purpleColor];
    self.rollCount = 3;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)diceRoll:(id)sender {
    //  Dice roll start
    if (self.rollCount > 0){
        if (self.die1.tag == 1){
            self.die1Value = self.rndValue;
            [self setTheDieToRandomValue:self.die1 :self.die1Value];
        }
        if(self.die2.tag == 1){
            self.die2Value = self.rndValue;
            [self setTheDieToRandomValue:self.die2 :self.die2Value];
        }
        if(self.die3.tag == 1){
            self.die3Value = self.rndValue;
            [self setTheDieToRandomValue:self.die3 :self.die3Value];
        }
        if(self.die4.tag == 1){
            self.die4Value = self.rndValue;
            [self setTheDieToRandomValue:self.die4 :self.die4Value];
        }
        if(self.die5.tag == 1){
            self.die5Value = self.rndValue;
            [self setTheDieToRandomValue:self.die5 :self.die5Value];
        }
        NSString* diceValues = [@(self.die1Value + self.die2Value + self.die3Value + self.die4Value + self.die5Value) stringValue];
        self.totalScore.text = diceValues;
        
        self.rollCount--;
        NSString *rollsLeft = [@"Roll ( "stringByAppendingString:[@(self.rollCount) stringValue]];
        NSString *rollTitle = [rollsLeft stringByAppendingString:@" )"];
        [self.rollDie setTitle:rollTitle forState:UIControlStateNormal];
        
    }
}  //  Dice roll end
- (IBAction)die1Press:(id)sender {
    [self disableRoll:self.die1];
}
- (IBAction)die2Press:(id)sender {
    [self disableRoll:self.die2];
}
- (IBAction)die3Press:(id)sender {
    [self disableRoll:self.die3];
}
- (IBAction)die4Press:(id)sender {
    [self disableRoll:self.die4];
}
- (IBAction)die5Press:(id)sender {
    [self disableRoll:self.die5];
}
-(void)disableRoll:(UIButton *)die{
    if(die.tag == 1){
        die.tag = 2;
    }
}
- (IBAction)startGame:(id)sender {
    self.die1.tag = 1;
    self.die2.tag = 1;
    self.die3.tag = 1;
    self.die4.tag = 1;
    self.die5.tag = 1;
    self.rollCount = 3;
    NSString *rollsLeft = [@"Roll ( "stringByAppendingString:[@(self.rollCount) stringValue]];
    NSString *rollTitle = [rollsLeft stringByAppendingString:@" )"];
    [self.rollDie setTitle:rollTitle forState:UIControlStateNormal];
}
-(void)setTheDieToRandomValue:(UIButton *)die :(int)rnd{
    NSString *title = [NSString stringWithFormat:@"%li",(long)rnd];
    [die setTitle:title forState:UIControlStateNormal];
}
-(int)rndValue{
    return (rand() % 6) + 1;
}
@end
