//
//  CCCharacter.h
//  Challenge Pirate Adventure
//
//  Created by Tim Engel on 05.09.15.
//  Copyright (c) 2015 Tim Engel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCWeapon.h"
#import "CCArmor.h"

@interface CCCharacter : NSObject

@property (nonatomic) int charHealth;
@property (nonatomic) int charDamage;
@property (strong, nonatomic) CCWeapon *charWeapon;
@property (strong, nonatomic) CCArmor *charArmor;

@end
