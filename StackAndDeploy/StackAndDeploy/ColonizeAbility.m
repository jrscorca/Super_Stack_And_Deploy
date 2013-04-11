//
//  ColonizeAbility.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/4/13.
//
//

#import "ColonizeAbility.h"
#import "MatchDataManager.h"
#import "NodeLayer.h"
#import "NodeModel.h"
#import "PlayerClass.h"
#import "NodeSprite.h"
#import "ShipModel.h"
#import "ShipSprite.h"
#import "Ownership.h"
#import "UIShipSelectState.h"

@implementation ColonizeAbility


-(id) init{
    if(self = [super init]){
        
    }
    return self;
}

-(void) activateAbility:(UIState*) state{
    //capture node and delete ship
    
    //
    //look for node in a certain radius
    
    if([state isKindOfClass:[UIShipSelectState class]] ){
        UIShipSelectState *shipSelectState = (UIShipSelectState*)state;
        ShipSprite *ship = shipSelectState.selectedShip;
        for(NodeSprite *node in MDM.nodes){
            if(node.model.ownership == NO_PLAYER){
                //if node is neutral capture node and delete ship
                if(ccpDistance(node.position, ship.position) < 50){
                    Ownership *owner = ship.model.ownership;
                    [node playerCaptureNode:owner];
                    [ship destroyObject];
                }
            }
        }
    }else{
        NSLog(@"ColonizeAbility should only be called by UIShipSelectState");
    }
}


//targets objects to use ability on
-(void) targetObject:(UIState*) state{
    
}

// checks whether the ability can be used
-(BOOL) isAbilityReady{
    return YES;
}

//does what the ability should do
-(void) useAbility{
    
}


@end
