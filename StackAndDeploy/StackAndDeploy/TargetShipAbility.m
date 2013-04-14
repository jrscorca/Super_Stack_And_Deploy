//
//  TargetShipAbility.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/12/13.
//
//

#import "TargetShipAbility.h"
#import "MatchDataManager.h"
#import "ShipModel.h"
#import "ShipSprite.h"
#import "PlayLayer.h"
#import "BoardLayer.h"
#import "UIState.h"
#import "ShipLayer.h"
#import "PlayLayer.h"
#import "UIAbilityTargetsSelectState.h"
#import "UIShipSelectState.h"
#import "StatusVO.h"
#import "Status.h"
#import "AbilityVO.h"

@implementation TargetShipAbility

@synthesize targetedShips;

-(id) initWithAbilityVO:(AbilityVO*) _abilityVO{
    if(self = [super initWithAbilityVO:_abilityVO]){
        self.targetedShips = [GameObjectSpriteArray array];
        
        //ability info should be stored in AbilityVO
        shipsToTarget = [[_abilityVO.arguments objectForKey:@"shipsToTarget"] intValue];
        
        for (NSDictionary *statusDic in [_abilityVO.arguments objectForKey:@"statuses"]){
            [self.statuses addObject:[[[StatusVO alloc] initWithDictionary:statusDic] autorelease]];
        }
        
        
    }
    return self;
}

-(void) dealloc{
    
    [targetedShips destroyArray];
    [super dealloc];
}



-(BOOL) isAbilityActivatable:(UIState*) state{
    return YES;
}

-(void) activateAbility:(UIState*) state{
    //transition to abilityTargetsSelectState
    //if([state isKindOfClass:[UIShipSelectState class]]){
        [state transitionToAbilityTargetsSelectState:self];
    //}
}

//targets objects to use ability on
-(void) targetObject:(BoardLayer*) boardLayer withTouch:(UITouch*) touch{
    //ships
    CGPoint touchPoint = [boardLayer.shipLayer convertTouchToNodeSpace:touch];
    for (ShipSprite *ship in MDM.ships){
        if (CGRectContainsPoint(ship.boundingBox, touchPoint)) {
            [ship addToArray:targetedShips];
            //return ship;
        }
    }
}

// checks whether the ability can be used
-(BOOL) isAbilityReady{
    if([targetedShips count] > shipsToTarget - 1){
        return YES;
    }
    return NO;
}

//does what the ability should do
-(void) useAbility{
    for(ShipSprite *ship in targetedShips){
        //apply statuses to targetedShips
        for(StatusVO *status in self.statuses){
            Class statusClass = NSClassFromString(status.className);
            id shipStatus = [[[statusClass alloc] initWithStatusVO:status] autorelease];
            [shipStatus addStatusToGameObject: ship];
//            [ship.model.statuses addObject:shipStatus];
        }
        
        
       // ship.model.health -= 100;
    }
}

@end
