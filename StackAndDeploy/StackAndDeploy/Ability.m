//
//  Ability.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/4/13.
//
//

#import "Ability.h"

@implementation Ability

@synthesize selectedCommandImage, normalCommandImage, disabledCommandImage;

-(id) initWithShip:(ShipSprite*) ship{
    if(self = [super init]){
        abilityOf = ship;
        self.selectedCommandImage = @"Command_Pressed.png";
        self.normalCommandImage = @"Command.png";
        self.disabledCommandImage = @"Command_Pressed.png";
    }
    return self;
}

-(void)dealloc{
    [selectedCommandImage release];
    [normalCommandImage release];
    [disabledCommandImage release];
    [super dealloc];
}

-(void) activateAbility{
    
}

@end
