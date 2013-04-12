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
#import "DetailsLayer.h"
#import "Status.h"
#import "BoardItemModel.h"
#import "StatusVO.h"
#import "Ability.h"
#import "CommandLayer.h"

@implementation UIAbilityTargetsSelectState

-(id)initWithState:(UIState *)_state
        andAbility:(Ability*) _ability{
    if(self = [super initWithState:_state andAbility:_ability]){
        
    }
    return self;
}


-(void)dealloc{
    [super dealloc];
}



-(void)activateInterfaceElements{
    UIState.playLayer.hudLayer.detailsLayer.visible = YES;
    UIState.playLayer.hudLayer.commandLayer.visible = YES;
    // send description to details page
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotification_AbilitySelected object:ability];
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotification_ControlCommandButtons object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotification_ChangeCommandButtons object:ability];
    
}

-(void)deactivateInterfaceElements{
    UIState.playLayer.hudLayer.detailsLayer.visible = NO;
    UIState.playLayer.hudLayer.commandLayer.visible = NO;
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotification_ControlCommandButtons object:nil];
}


-(void) commandExecuted:(NSNotification*) notification{
    CCMenuItemSprite *object = notification.object;

    int commandNumber = object.tag;
    if(commandNumber == -1){
        return;
    }
    // 0:ship moveTO
    if(commandNumber == 0){
    }
    // 1: deselect
    if(commandNumber == 1){
        [self transitionToPreviousState];
    }
    // 2: ability
    // 3:ability
    
    if(commandNumber == 2){
        
    }
    
    if(commandNumber == 3){
        
    }
}


-(void) updateState:(ccTime)dt{
    if([ability isAbilityReady] ){
        [ability useAbility];
        [self transitionToPreviousState];
    }
            
    [super updateState:dt];
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    
    [self cameraOnTouchBegan:touch withEvent:event];
    CGPoint touchPoint = [UIState.playLayer convertTouchToNodeSpace: touch];
    if (CGRectContainsPoint(MINIMAP_RECT, touchPoint)) {
        isMiniMapSelected = YES;
        [self moveMiniMap: touch withEvent:event];
        [self cleanCameraVariables];
        return YES;
    }
    if([self commandTouchBegan:touch withEvent:event]) {
        return YES;
    }
    nothingTouched = YES;
    
    return YES;
}

-(void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event{
    
    if(isMiniMapSelected){
        [self moveMiniMap: touch withEvent:event];
    }else if(nothingTouched){
        screenMoved = YES;
        [self cameraOnTouchMoved:touch withEvent:event];
    }
}
- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    [self cameraOnTouchEnded:touch withEvent:event];
    
    //first if needs to be here
    if(isMiniMapSelected){
    }else if([self commandTouchEnded:touch withEvent:event]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotification_ControlCommandButtons object:nil];
        //should only cancel ability here
        [self executeCommand:commandTouched];

    }else if(!screenMoved){
        //do ability
        [ability targetObject:UIState.playLayer.boardLayer withTouch:touch];
        //transition back to previous state
    }
    screenMoved = NO;
    nothingTouched = NO;
    isMiniMapSelected = NO;
    commandTouched = -1;
    
    moveCameraDown = NO;
    moveCameraLeft = NO;
    moveCameraRight = NO;
    moveCameraUp = NO;
    
    
}

- (void) ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event{
    isMiniMapSelected = NO;
    commandTouched = -1;
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotification_ControlCommandButtons object:nil];
}



#pragma mark - transitions


-(void) transitionToPreviousState{
    [self deactivateInterfaceElements];
    [previousState activateInterfaceElements];
    [self deactivateInterfaceElements];
    [UIState.playLayer changeUIState:previousState];
}

-(void) transitionToNormalState{
    [self deactivateInterfaceElements];
    UINormalState *normalState = [[[UINormalState alloc] initWithState:self] autorelease];
    [UIState.playLayer changeUIState:normalState];
    
}




@end
