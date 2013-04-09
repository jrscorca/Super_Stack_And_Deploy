//
//  UIAbilityTargetsSelectState.m
//  StackAndDeploy
//
//  Created by Joshua Scorca on 4/8/13.
//
//

#import "UIAbilityTargetsSelectState.h"
#import "PlayLayer.h"
#import "BoardLayer.h"
#import "ShipSprite.h"
#import "NodeSprite.h"
#import "Ownership.h"
#import "HUDLayer.h"
#import "UINormalState.h"
#import "HandLayer.h"
#import "ShipSelectLayer.h"
#import "Status.h"
#import "BoardItemModel.h"
#import "StatusVO.h"

@implementation UIAbilityTargetsSelectState

-(id)initWithState:(UIState *)_state
       andStatuses:(NSArray *)_statuses
    andTargetTypes:(boardItemType)type
   andTargetNumber:(int)_targetNumber{
    if(self = [super initWithState:_state andStatuses:_statuses]){
        _boardItemType = type;
        targets = _targetNumber;
        ownership = [[Ownership alloc] init];
        targetsSoFar = 0;
        switch (type) {
            case AWAY_SHIP:
                targetClass = [ShipSprite class];
                ownership.playerType = AWAY_PLAYER;
                break;
            case LOCAL_SHIP:
                targetClass = [ShipSprite class];
                ownership.playerType = LOCAL_PLAYER;
                break;
            case AWAY_RESOURCE_NODE:
                targetClass = [NodeSprite class];
                ownership.playerType = AWAY_PLAYER;
                break;
            case LOCAL_RESOURCE_NODE:
                targetClass = [NodeSprite class];
                ownership.playerType = LOCAL_PLAYER;
                break;
            case AWAY_TECH_NODE:
                targetClass = [NodeSprite class];
                ownership.playerType = AWAY_PLAYER;
                break;
            case LOCAL_TECH_NODE:
                targetClass = [NodeSprite class];
                ownership.playerType = LOCAL_PLAYER;
                break;
                
            default:
                break;
        }
    }
    return self;
}

-(void)applyStatusesToTargets{
    for (BoardItemSprite *sprite in targets){
        for(StatusVO *status in statuses){
            //create statuses and add them to ships
            Status *status = [[Status alloc] init];
            [sprite.model.statuses addObject:status];
    
        }
    }
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    [self cameraOnTouchBegan:touch withEvent:event];
    GameObjectSprite *touchedObject = [self objectAtPoint:touch withEvent:event];
    if(touchedObject){
        if([touchedObject isKindOfClass:[ShipSprite class]]){
            [self transitionToShipSelectState:(ShipSprite*)touchedObject];
            return YES;
        }
    }
    
    nothingTouched = YES;
    
    return YES;
}

-(void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event{
    
    if(isMiniMapSelected){
        [self moveMiniMap: touch withEvent:event];
    }else if(nothingTouched){
        [self cameraOnTouchMoved:touch withEvent:event];
    }else{
        [self sideCameraMovement:touch withEvent:event];
    }
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    [self cameraOnTouchEnded:touch withEvent:event];
    CGPoint touchPoint = [UIState.playLayer convertTouchToNodeSpace: touch];
    GameObjectSprite *touchedObject = [self objectAtPoint:touch withEvent:event];
    if ([touchedObject isKindOfClass:targetClass] && [[[(BoardItemSprite*)touchedObject model] ownership] playerType] == ownership.playerType) {
        [targets addObject:touchedObject];
        ++targetsSoFar;
    }
    if([self checkEndCondition]){
        [self applyStatusesToTargets];
    }
}

-(BOOL)checkEndCondition{
    if (targetsSoFar == targetNumber) {
        return YES;
    }
    return NO;
}

-(void) transitionToNormalState{
    UINormalState *normalState = [[[UINormalState alloc] initWithState:self] autorelease];
    UIState.playLayer.hudLayer.handLayer.visible = YES;
    UIState.playLayer.hudLayer.shipSelectLayer.visible = NO;
    [UIState.playLayer changeUIState:normalState];
    
}

-(void)dealloc{
    [Ownership release];
    [super dealloc];
}



@end
