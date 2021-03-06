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
#import "ColonizeAbility.h"
#import "WeaponStatus.h"
#import "Ownership.h"
#import "StatusVO.h"
#import "DirectDamageToShipAbility.h"
#import "TargetShipAbility.h"

@implementation ShipSprite

@synthesize isSelected, steeringBehavior, velocity;
//@synthesize model;

-(id)initWithShipVO:(ShipVO*)shipVO{
    if(self = [super initWithFile:@"Icon.png"]){
        self.model = [[[ShipModel alloc] initWithShipVO:shipVO] autorelease];
        
        for(StatusVO *status in shipVO.statuses){
            Class statusClass = NSClassFromString(status.className);
            id shipStatus = [[[statusClass alloc] initWithStatusVO:status] autorelease];
            [shipStatus addStatusToGameObject:self];
        }
        
        velocity = ccp(1,1);
        isSelected = NO;
        [self addToArray:MDM.ships];
        self.steeringBehavior = [[[SteeringBehavior alloc] initWithShip:self] autorelease];
        self.model.health = 50;
        self.model.maxHealth = 50;
        
    }
    return self;
}

-(void) dealloc{
    [steeringBehavior release];
    steeringBehavior = nil;
    [super dealloc];
}


-(void) update:(ccTime) dt{
    [super update:dt];
    velocity = [steeringBehavior updateMovement]; //[self movement:objective];
    self.position = ccpAdd(self.position, ccpMult(velocity, 1));
    if (model.health <=0) {
        [MDM.gameObjectsToRemove addObject:self];
        self.remove = YES;
    }
}


-(void)moveShip:(CGPoint)touch{
    //make sure point is on map
    self.steeringBehavior.objective = touch;
    self.steeringBehavior.steering = MOVETO;
    [self.steeringBehavior clearTargetSprite];
}

-(void)moveShipToSprite:(GameObjectSprite*)sprite{
    [self.steeringBehavior targetSprite:sprite];

    
}

@end
