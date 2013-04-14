//
//  SpawnShipStatus.m
//  StackAndDeploy
//
//  Created by Joshua Scorca on 4/12/13.
//
//

#import "SpawnShipStatus.h"
#import "BoardItemModel.h"
#import "BoardItemSprite.h"
#import "StatusVO.h"
#import "ShipVO.h"
#import "MatchDataManager.h"
#import "PlayLayer.h"
#import "BoardLayer.h"

@implementation SpawnShipStatus
-(id)initWithStatusVO:(StatusVO *)statusVO{
    if(self = [super initWithStatusVO:statusVO]){
        //healthOffset = [[statusVO.arguments objectForKey:@"healthOffset"] intValue];
        hasBeenApplied = NO;
        ship = [[ShipVO alloc] initWithDictionary:statusVO.arguments];
    }
    return self;
}



-(BOOL) checkStart{
    return YES;
}

-(void) applyStatus{
    hasBeenApplied = YES;
    ship.spawnLocation = targetPoint;
    [[NSNotificationCenter defaultCenter] postNotificationName:kSpawnShip object:ship];
}

-(void) revertStatus{
}


-(BOOL) checkEnd{
    return NO;
}

-(void) updateStatus:(ccTime) dt{
    if([self checkStart] && !hasBeenApplied){
        [self applyStatus];
    }
    
    if(hasBeenApplied){
        [self reccuringEffect:dt];
    }
    
    if( [self checkEnd]){
        [self revertStatus];
        [target.model.statuses removeObject:self];
    }
    
}

-(void) reccuringEffect:(ccTime) dt{
    
}


@end
