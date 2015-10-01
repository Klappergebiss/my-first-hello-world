//
//  ViewController.h
//  Challenge Pirate Adventure
//
//  Created by Tim Engel on 02.09.15.
//  Copyright (c) 2015 Tim Engel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCCharacter.h"

@interface ViewController : UIViewController

//instanceVars
@property (nonatomic) CGPoint currentPoint;
@property (strong, nonatomic) NSArray *tiles;
@property (strong, nonatomic) CCCharacter *playerCharacter;
@property (strong, nonatomic) CCCharacter *bossCharacter;

// properties
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (strong, nonatomic) IBOutlet UILabel *currentHealth;
@property (strong, nonatomic) IBOutlet UILabel *currentDamage;
@property (strong, nonatomic) IBOutlet UILabel *currentArmor;
@property (strong, nonatomic) IBOutlet UILabel *currentWeapon;
@property (strong, nonatomic) IBOutlet UILabel *storyText;
@property (strong, nonatomic) IBOutlet UIButton *actionButton;
@property (strong, nonatomic) IBOutlet UIButton *northButton;
@property (strong, nonatomic) IBOutlet UIButton *eastButton;
@property (strong, nonatomic) IBOutlet UIButton *southButton;
@property (strong, nonatomic) IBOutlet UIButton *westButton;
@property (strong, nonatomic) IBOutlet UIButton *resetButton;
// states
@property (nonatomic) BOOL actionButtonPressedOnce;

// IBActions
- (IBAction)actionButtonPressed:(UIButton *)sender;
- (IBAction)moveN:(UIButton *)sender;
- (IBAction)moveE:(UIButton *)sender;
- (IBAction)moveS:(UIButton *)sender;
- (IBAction)moveW:(UIButton *)sender;
- (IBAction)resetButtonPressed:(UIButton *)sender;

@end

