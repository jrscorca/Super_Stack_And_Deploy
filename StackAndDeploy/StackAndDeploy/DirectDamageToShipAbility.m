//
//  DirectDamageToShipAbility.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/11/13.
//
//

#import "DirectDamageToShipAbility.h"
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

@implementation DirectDamageToShipAbility

@synthesize targetedShips;

-(id) init{
    if(self = [super init]){
        self.targetedShips = [GameObjectSpriteArray array];
    }
    return self;
}

-(void) dealloc{
    
    [targetedShips destroyArray];
    [super dealloc];
}


-(void) activateAbility:(UIState*) state{
    //transition to abilityTargetsSelectState
    if([state isKindOfClass:[UIShipSelectState class]]){
        UIShipSelectState *shipSelectState = (UIShipSelectState*) shipSelectState;
        [shipSelectState transitionToAbilityTargetsSelectState:self];
    }
}

-(void) activateShipAbility:(UIShipSelectState*) state{
    [state transitionToAbilityTargetsSelectState:self];
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
    if([targetedShips count] > 0){
        return YES;
    }
    return NO;
}

//does what the ability should do
-(void) useAbility{
    for(ShipSprite *ship in targetedShips){
        ship.model.health -= 100;
    }
}

@end
