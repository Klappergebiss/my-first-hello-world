//
//  ViewController.m
//  Challenge Pirate Adventure
//
//  Created by Tim Engel on 02.09.15.
//  Copyright (c) 2015 Tim Engel. All rights reserved.
//

#import "ViewController.h"
#import "CCFactory.h"
#import "CCTile.h"
#import "CCCharacter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CCFactory *factory = [[CCFactory alloc] init];
    self.playerCharacter = [factory character];
    self.bossCharacter = [factory character];
    self.tiles = [factory tiles:self.playerCharacter.charHealth];
    self.currentPoint = CGPointMake(0, 0);
    [self updateTile];
    [self updateButtons];
    [self updateStats];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - helper methods

-(void) updateTile {
    CCTile *tileModel = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    self.storyText.text = tileModel.story;
    self.backgroundImage.image = tileModel.background;
    [self.actionButton setTitle:tileModel.actionButtonName forState:UIControlStateNormal];
}

-(BOOL) tileOutOfReach:(CGPoint)point {
    if (point.x >= 0 && point.x < [self.tiles count] && point.y >= 0 && point.y < [[self.tiles objectAtIndex:point.x] count]) {
        return NO;
    } else {
        return YES;
    }
}

-(void) updateButtons {   
    self.northButton.hidden = [self tileOutOfReach:CGPointMake(self.currentPoint.x, self.currentPoint.y + 1)];
    self.southButton.hidden = [self tileOutOfReach:CGPointMake(self.currentPoint.x, self.currentPoint.y - 1)];
    self.westButton.hidden = [self tileOutOfReach:CGPointMake(self.currentPoint.x -1 , self.currentPoint.y)];
    self.eastButton.hidden = [self tileOutOfReach:CGPointMake(self.currentPoint.x + 1, self.currentPoint.y)];
    self.actionButtonPressedOnce = NO;
}

-(void) updateStats {
    self.currentHealth.text = [NSString stringWithFormat:@"%i", self.playerCharacter.charHealth];
    self.currentDamage.text = [NSString stringWithFormat:@"%i", self.playerCharacter.charDamage];
    self.currentArmor.text = self.playerCharacter.charArmor.armorName;
    self.currentWeapon.text = self.playerCharacter.charWeapon.weaponName;
    if (self.playerCharacter.charHealth <= 0) {
        UIAlertView *deathAlert = [[UIAlertView alloc] initWithTitle:@"Game over!" message:@"You died." delegate:self cancelButtonTitle:@"Restart" otherButtonTitles: nil];
        [deathAlert show];
    } else if (self.bossCharacter.charHealth <= 0) {
        UIAlertView *winAlert = [[UIAlertView alloc] initWithTitle:@"You won!" message:@"You have killed Blue-Beard." delegate:self cancelButtonTitle:@"Restart" otherButtonTitles: nil];
        [winAlert show];
    }
}

-(void) updateCharacter {
    self.playerCharacter.charDamage = self.playerCharacter.charWeapon.weaponDamage;
    self.playerCharacter.charHealth = self.playerCharacter.charHealth + self.playerCharacter.charArmor.armorHealth;
    self.playerCharacter.charArmor.armorHealth = 0;
    [self updateStats];
}

#pragma mark - IBActions

- (IBAction)moveN:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y + 1);
    [self updateTile];
    [self updateButtons];
}

- (IBAction)moveE:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x + 1, self.currentPoint.y);
    [self updateTile];
    [self updateButtons];
}

- (IBAction)moveS:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y - 1);
    [self updateTile];
    [self updateButtons];
}

- (IBAction)moveW:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x - 1, self.currentPoint.y);
    [self updateTile];
    [self updateButtons];
}

- (IBAction)resetButtonPressed:(UIButton *)sender {
    self.playerCharacter = nil;
    self.bossCharacter = nil;
    [self viewDidLoad];
}

- (IBAction)actionButtonPressed:(UIButton *)sender {
    if (!self.actionButtonPressedOnce) {
        CCTile *tileModel = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
        if (tileModel.armor != nil) {
            self.playerCharacter.charArmor = tileModel.armor;
        }
        if (tileModel.weapon != nil) {
            self.playerCharacter.charWeapon = tileModel.weapon;
        }
        if (!tileModel.healthEffect == 0) {
            self.playerCharacter.charHealth += tileModel.healthEffect;
            if (!tileModel.isBoss) {
                tileModel.healthEffect = 0;
                self.actionButtonPressedOnce = YES;
            } else {
                self.bossCharacter.charHealth -= self.playerCharacter.charDamage;
                tileModel.healthEffect = -((arc4random() % 30) + 10);
            }
        }
        [self updateCharacter];
    }
}
            
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        [self resetButtonPressed:nil];
    }
}

@end

