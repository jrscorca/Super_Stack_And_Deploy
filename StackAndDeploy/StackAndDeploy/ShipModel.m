//
//  ShipModel.m
//  StackAndDeploy
//
//  Created by Joshua Scorca on 4/2/13.
//
//

#import "ShipModel.h"
#import "ShipVO.h"

@implementation ShipModel

@synthesize abilityArray;

-(id) initWithShipVO:(ShipVO*)shipVO{
    if(self = [super init]){
        self.abilityArray = [NSMutableArray array];
        self.maxHealth = shipVO.health;
        self.health = shipVO.health;

        
        //hardcode an ability
        
    }
    return self;
}

@end
