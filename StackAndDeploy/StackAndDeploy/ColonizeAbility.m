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

@implementation ColonizeAbility


-(id) initWithShip:(ShipSprite*) ship{
    if(self = [super initWithShip:ship]){

    }
    return self;
}

-(void) activateAbility{
    //capture node and delete ship
    
//
    //look for node in a certain radius
    for(NodeSprite *node in MDM.nodes){
        if(node.model.ownership == NO_PLAYER){
            //if node is neutral capture node and delete ship
            if(ccpDistance(node.position, abilityOf.position) < 50){
                playerType owner = abilityOf.model.ownership;
                [node playerCaptureNode:owner];
                [abilityOf destroyObject];
            }
        }
    }

    
    
}


@end
