//
//  Ability.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/4/13.
//
//

#import "Ability.h"

@implementation Ability

-(id) initWithShip:(ShipSprite*) ship{
    if(self = [super init]){
        abilityOf = ship;
    }
    return self;
}

-(void) activateAbility{
    
}

@end
