//
//  CCTile.h
//  Challenge Pirate Adventure
//
//  Created by Tim Engel on 02.09.15.
//  Copyright (c) 2015 Tim Engel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CCArmor.h"
#import "CCWeapon.h"

@interface CCTile : NSObject

@property (strong, nonatomic) NSString *story;
@property (strong, nonatomic) UIImage *background;
@property (strong, nonatomic) NSString *actionButtonName;
@property (strong, nonatomic) CCArmor *armor;
@property (strong, nonatomic) CCWeapon *weapon;
@property (nonatomic) int healthEffect;
@property (nonatomic) BOOL isBoss;

@end
