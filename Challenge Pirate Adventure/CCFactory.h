//
//  CCFactory.h
//  Challenge Pirate Adventure
//
//  Created by Tim Engel on 02.09.15.
//  Copyright (c) 2015 Tim Engel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCCharacter.h"

@interface CCFactory : NSObject

-(NSArray *)tiles:(int)playerHealth;
-(CCCharacter *)character;

//weapons
-(CCWeapon *)createWeaponFists;
-(CCWeapon *)createWeaponWoodenSword;
-(CCWeapon *)createWeaponSteelSword;
-(CCWeapon *)createWeaponPistols;

//armor
-(CCArmor *)createArmorSailorShirt;
-(CCArmor *)createArmorLeatherArmor;
-(CCArmor *)createArmorSteelArmor;

@end
