//
//  CCFactory.m
//  Challenge Pirate Adventure
//
//  Created by Tim Engel on 02.09.15.
//  Copyright (c) 2015 Tim Engel. All rights reserved.
//

#import "CCFactory.h"
#import "CCTile.h"

@implementation CCFactory

-(NSArray *)tiles:(int)playerHealth {
    CCTile *tile1 = [[CCTile alloc] init];
    tile1.story = @"G'mornin, Cap'n. Let's get to new horizons. Here's your wooden sword. ";
    tile1.background = [UIImage imageNamed:@"PirateStart.jpg"];
    tile1.actionButtonName = @"Take the wooden sword";
    tile1.weapon = [self createWeaponWoodenSword];
    
    CCTile *tile2 = [[CCTile alloc] init];
    tile2.story = @"The Blacksmith just finished your steel sword, Sir. I hope you like it. ";
    tile2.background = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    tile2.actionButtonName = @"Take steel sword";
    tile2.weapon = [self createWeaponSteelSword];
    
    CCTile *tile3 = [[CCTile alloc] init];
    tile3.story = @"We're getting attacked by pirates. We have to fight them to survive but it will be a risky battle. ";
    tile3.background = [UIImage imageNamed:@"PirateAttack.jpg"];
    tile3.actionButtonName = @"Fight the Pirates";
    tile3.healthEffect = -40;
    
    NSMutableArray *firstColumn = [[NSMutableArray alloc] init];
    [firstColumn addObject:tile1];
    [firstColumn addObject:tile2];
    [firstColumn addObject:tile3];
    
    CCTile *tile4 = [[CCTile alloc] init];
    tile4.story = @"A parrot says something of a hidden treasure in the east. ";
    tile4.background = [UIImage imageNamed:@"PirateParrot.jpg"];
    tile4.actionButtonName = @"Feed the parrot";
    
    CCTile *tile5 = [[CCTile alloc] init];
    tile5.story = @"The crew is getting angry. The want you to walk the plank. ";
    tile5.background = [UIImage imageNamed:@"PiratePlank.jpg"];
    tile5.actionButtonName = @"Walk the plank";
    tile5.healthEffect = -50;
    
    CCTile *tile6 = [[CCTile alloc] init];
    tile6.story = @"We found some old pistols. It seems they are still working. ";
    tile6.background = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    tile6.actionButtonName = @"Grab a pistol";
    tile6.weapon = [self createWeaponPistols];
    
    NSMutableArray *secondColumn = [[NSMutableArray alloc] init];
    [secondColumn addObject:tile4];
    [secondColumn addObject:tile5];
    [secondColumn addObject:tile6];
    
    CCTile *tile7 = [[CCTile alloc] init];
    tile7.story = @"The parrot was right. The treasure is worth a lot. Now we can buy whatever we want. ";
    tile7.background = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    tile7.actionButtonName = @"Take all the gold";
    
    CCTile *tile8 = [[CCTile alloc] init];
    tile8.story = @"We found a friendly Dock. We can rest a while and learn some fighting skills. ";
    tile8.background = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    tile8.actionButtonName = @"Rest and learn Karate";
    tile8.healthEffect = 120 - playerHealth;
    
    CCTile *tile9 = [[CCTile alloc] init];
    tile9.story = @"There's treasure out there, they said. Seems they were right. But we have to dive a bit. Watch out for sharks. ";
    tile9.background = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    tile9.actionButtonName = @"Try to get the treasure. ";
    tile9.healthEffect = - 15;
    tile9.armor = [self createArmorSteelArmor];
    
    NSMutableArray *thirdColumn = [[NSMutableArray alloc] init];
    [thirdColumn addObject:tile7];
    [thirdColumn addObject:tile8];
    [thirdColumn addObject:tile9];
    
    CCTile *tile10 = [[CCTile alloc] init];
    tile10.story = @"The sea seems to be disturbed. Suddenly a huge tentacle appears and graps the first officer. We're being attacked!! ";
    tile10.background = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    tile10.actionButtonName = @"Kill the kraken!";
    tile10.healthEffect = - 60;
    
    CCTile *tile11= [[CCTile alloc] init];
    tile11.story = @"Through the fog we see a terrifying pirate. It's the greatly feared Blue-Beard. He is one of the most dangerous Pirates. ";
    tile11.background = [UIImage imageNamed:@"PirateBoss.jpeg"];
    tile11.actionButtonName = @"Fight Blue-Beard";
    tile11.healthEffect = -((arc4random() % 30) + 10);
    tile11.isBoss = YES;
    
    CCTile *tile12 = [[CCTile alloc] init];
    tile12.story = @"There's a battle between British ships and French ships. Unfortunately we are sailing in the middle of them... ";
    tile12.background = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    tile12.actionButtonName = @"Sail on";
    tile12.healthEffect = - 30;
    
    NSMutableArray *fourthColumn = [[NSMutableArray alloc] init];
    [fourthColumn addObject:tile10];
    [fourthColumn addObject:tile11];
    [fourthColumn addObject:tile12];
    
    
    NSArray *tilesArray = [[NSArray alloc] initWithObjects:firstColumn, secondColumn, thirdColumn, fourthColumn, nil];
    
    return tilesArray;
}

-(CCWeapon *)createWeaponFists {
    CCWeapon *fists = [[CCWeapon alloc] init];
    fists.weaponName = @"Fists";
    fists.weaponDamage = 5;
    return fists;
}

-(CCWeapon *)createWeaponWoodenSword {
    CCWeapon *woodenSword = [[CCWeapon alloc] init];
    woodenSword.weaponName = @"Wooden Sword";
    woodenSword.weaponDamage = 15;
    return woodenSword;
}

-(CCWeapon *)createWeaponSteelSword {
    CCWeapon *steelSword = [[CCWeapon alloc] init];
    steelSword.weaponName = @"Steel Sword";
    steelSword.weaponDamage = 25;
    return steelSword;
}
-(CCWeapon *)createWeaponPistols {
    CCWeapon *pistols = [[CCWeapon alloc] init];
    pistols.weaponName = @"Pistols";
    pistols.weaponDamage = 30;
    return pistols;
}

-(CCArmor *)createArmorSailorShirt {
    CCArmor *sailorShirt = [[CCArmor alloc] init];
    sailorShirt.armorName = @"Sailor Shirt";
    sailorShirt.armorHealth = 5;
    return sailorShirt;
}

-(CCArmor *)createArmorLeatherArmor {
    CCArmor *leatherArmor = [[CCArmor alloc] init];
    leatherArmor.armorName = @"Leather Armor";
    leatherArmor.armorHealth = 15;
    return leatherArmor;
}

-(CCArmor *)createArmorSteelArmor {
    CCArmor *steelArmor = [[CCArmor alloc] init];
    steelArmor.armorName = @"Steel Armor";
    steelArmor.armorHealth = 25;
    return steelArmor;
}



-(CCCharacter *)character {
    CCCharacter *myCharacter = [[CCCharacter alloc] init];
    myCharacter.charArmor = [self createArmorSailorShirt];
    myCharacter.charWeapon = [self createWeaponFists];
    myCharacter.charDamage = myCharacter.charWeapon.weaponDamage;
    myCharacter.charHealth = 100 + myCharacter.charArmor.armorHealth;
    return myCharacter;
}

@end