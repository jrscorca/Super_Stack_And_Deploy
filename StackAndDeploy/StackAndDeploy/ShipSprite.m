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

@implementation ShipSprite

@synthesize isSelected, objective, steeringBehavior, velocity;
//@synthesize model;

-(id)initWithShipVO:(ShipVO*)shipVO{
    if(self = [super initWithFile:@"Icon.png"]){
        self.model = [[[ShipModel alloc] init] autorelease];
        self.model.ownership.playerType = LOCAL_PLAYER;
        self.model.ownership.playerNumber = PLAYER_ONE;
        for(StatusVO *status in shipVO.statuses){
            //TODO: make sure these strings map up to the actual data model
            Class statusClass = NSClassFromString(status.className);
            id shipStatus = [[[statusClass alloc] initWithTarget:self andStatusVO:status] autorelease];
            [model.statuses addObject:shipStatus];
        }

        model.health = 50;
        model.maxHealth = 50;
        velocity = ccp(1,1);
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
//    CGSize limit = MDM.boardSize;
    self.steeringBehavior.objective = touch;
}

@end
