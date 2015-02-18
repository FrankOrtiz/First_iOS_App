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
    int lowerBound = 1;
    int upperBound = 7;
    
    int rndValue1 = lowerBound + arc4random() % (upperBound - lowerBound);
    int rndValue2 = lowerBound + arc4random() % (upperBound - lowerBound);
    int rndValue3 = lowerBound + arc4random() % (upperBound - lowerBound);
    int rndValue4 = lowerBound + arc4random() % (upperBound - lowerBound);
    int rndValue5 = lowerBound + arc4random() % (upperBound - lowerBound);
    
    if (self.rollCount > 0){
        if (self.die1.tag == 1){
            self.die1Value = rndValue1;
            NSString* rndString1 = [@(rndValue1) stringValue];
            [self.die1 setTitle:rndString1 forState:UIControlStateNormal];
        }
        if(self.die2.tag == 1){
            self.die2Value = rndValue2;
            NSString* rndString2 = [@(rndValue2) stringValue];
            [self.die2 setTitle:rndString2 forState:UIControlStateNormal];
        }
        if(self.die3.tag == 1){
            self.die3Value = rndValue3;
            NSString* rndString3 = [@(rndValue3) stringValue];
            [self.die3 setTitle:rndString3 forState:UIControlStateNormal];
        }
        if(self.die4.tag == 1){
            self.die4Value = rndValue4;
            NSString* rndString4 = [@(rndValue4) stringValue];
            [self.die4 setTitle:rndString4 forState:UIControlStateNormal];
        }
        if(self.die5.tag == 1){
            self.die5Value = rndValue5;
            NSString* rndString5 = [@(rndValue5) stringValue];
            [self.die5 setTitle:rndString5 forState:UIControlStateNormal];
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
    if (self.die1.tag == 1){
        self.die1.tag = 2;
    }
}
- (IBAction)die2Press:(id)sender {
    if (self.die2.tag == 1){
        self.die2.tag = 2;
    }
}
- (IBAction)die3Press:(id)sender {
    if (self.die3.tag == 1){
        self.die3.tag = 2;
    }
}
- (IBAction)die4Press:(id)sender {
    if (self.die4.tag == 1){
        self.die4.tag = 2;
    }
}
- (IBAction)die5Press:(id)sender {
    if (self.die5.tag == 1){
        self.die5.tag = 2;
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

@end
