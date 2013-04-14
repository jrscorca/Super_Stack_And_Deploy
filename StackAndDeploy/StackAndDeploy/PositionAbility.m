//
//  PositionAbility.m
//  StackAndDeploy
//
//  Created by Joshua Scorca on 4/13/13.
//
//

#import "PositionAbility.h"
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

@implementation PositionAbility

-(id) initWithAbilityVO:(AbilityVO*) _abilityVO{
    if(self = [super initWithAbilityVO:_abilityVO]){
        targetPosition.x = -999;
        for (NSDictionary *statusDic in [_abilityVO.arguments objectForKey:@"statuses"]){
            [self.statuses addObject:[[[StatusVO alloc] initWithDictionary:statusDic] autorelease]];
        }
        
        
    }
    return self;
}

-(void) dealloc{
    [super dealloc];
}



-(BOOL) isAbilityActivatable:(UIState*) state{
    return YES;
}

-(void) activateAbility:(UIState*) state{
    [state transitionToAbilityTargetsSelectState:self];
}

//targets objects to use ability on
-(void) targetObject:(BoardLayer*) boardLayer withTouch:(UITouch*) touch{
    //ships
    CGPoint touchPoint = [boardLayer.shipLayer convertTouchToNodeSpace:touch];
    targetPosition = touchPoint;
}

// checks whether the ability can be used
-(BOOL) isAbilityReady{
    if (targetPosition.x > 0) {
        return YES;
    }
    return NO;
}

//does what the ability should do
-(void) useAbility{
    for(StatusVO *status in self.statuses){
        Class statusClass = NSClassFromString(status.className);
        id itemStatus = [[[statusClass alloc] initWithStatusVO:status] autorelease];
        [itemStatus addStatusToGameBoard:targetPosition];
    }
}

@end
