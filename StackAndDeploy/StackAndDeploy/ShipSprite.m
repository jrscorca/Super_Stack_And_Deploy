//
//  Ship.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "ShipSprite.h"
#import "ShipVO.h"
#import "UtilityFunctions.h"
#import "MatchDataManager.h"
#import "ShipModel.h"
#import "SteeringBehavior.h"
<<<<<<< HEAD
#import "ColonizeAbility.h"
=======
#import "WeaponStatus.h"

>>>>>>> test
@implementation ShipSprite

@synthesize isSelected, objective, steeringBehavior, velocity;
//@synthesize model;

-(id)initWithShipVO:(ShipVO*)shipVO{
    if(self = [super initWithFile:@"Icon.png"]){
        WeaponStatus *weapon = [[[WeaponStatus alloc] initWithTarget:self] autorelease];
        self.model = [[[ShipModel alloc] init] autorelease];
<<<<<<< HEAD
        self.model.ownership = LOCAL_PLAYER;
=======
        [model.statuses addObject:weapon];
>>>>>>> test
        velocity = ccp(1,1);
        objective = ccp(200,200);
        isSelected = NO;
        [self addToArray:MDM.ships];
        self.steeringBehavior = [[[SteeringBehavior alloc] initWithShip:self] autorelease];
        
        
        ColonizeAbility *ability = [[[ColonizeAbility alloc] initWithShip:self] autorelease];
        [((ShipModel*)self.model).abilityArray addObject:ability];
        
        
    }
    return self;
}

-(void) dealloc{
    [steeringBehavior release];
    steeringBehavior = nil;
    [model release];
    [super dealloc];
}


-(void) update:(ccTime) dt{
    [super update:dt];
    velocity = [steeringBehavior updateMovement]; //[self movement:objective];
    self.position = ccpAdd(self.position, ccpMult(velocity, 1));
    
}



-(void)moveShip:(CGPoint)touch{
    
    self.steeringBehavior.objective = touch;
}

@end
