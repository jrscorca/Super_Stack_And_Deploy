//
//  UIShipSelectState.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/31/13.
//
//

#import "UIShipSelectState.h"
#import "PlayLayer.h"
#import "HUDLayer.h"
#import "HandLayer.h"
#import "MatchDataManager.h"
#import "CardItem.h"
#import "BoardLayer.h"
#import "ShipLayer.h"
#import "ShipSprite.h"
#import "ShipModel.h"
#import "Ability.h"
#import "UINormalState.h"
#import "CommandLayer.h"
#import "NodeSprite.h"
#import "DetailsLayer.h"
#import "UINodeSelectedState.h"
#import "UIAbilityTargetsSelectState.h"

@implementation UIShipSelectState

@synthesize selectedShip;


-(id) initWithSelectedShip:(ShipSprite*) _selectedShip andState:(UIState*) state{
    [_selectedShip assignObjectToPointer:&selectedShip];
    if(self = [super initWithState:state]){

        //send notification

    }
    return self;
}


-(void)activateInterfaceElements{
    UIState.playLayer.hudLayer.detailsLayer.visible = YES;
    UIState.playLayer.hudLayer.commandLayer.visible = YES;
    selectedShip.isSelected = YES;
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotification_SpriteSelected object:selectedShip];
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotification_ControlCommandButtons object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotification_ChangeCommandButtons object:selectedShip];
}

-(void)deactivateInterfaceElements{
    selectedShip.isSelected = NO;
    UIState.playLayer.hudLayer.detailsLayer.visible = NO;
    UIState.playLayer.hudLayer.commandLayer.visible = NO;
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotification_ControlCommandButtons object:nil];
}

-(void)dealloc{
    [selectedShip removeObjectFromPointer:&selectedShip];
    [super dealloc];
}

-(void) updateState:(ccTime)dt{
    if(!selectedShip){
        [self transitionToNormalState];
        return;
    }
    [super updateState:dt];
}

-(void) commandExecuted:(NSNotification*) notification{
    CCMenuItemSprite *object = notification.object;
    NSLog(@"menu: %d", object.tag);
    int commandNumber = object.tag;
    if(commandNumber == -1){
        return;
    }
    // 0:ship moveTO
    if(commandNumber == 0){
        moveCommandSelected = YES;
        [object setIsEnabled:NO];
    }
    // 1: deselect
    if(commandNumber == 1){
        [self transitionToNormalState];
    }
    // 2: ability
    // 3:ability
    
    if(commandNumber == 2){
        NSMutableArray *abilities = ((ShipModel*)selectedShip.model).abilityArray;
        if([abilities count] > 0){
            Ability *ability = [abilities objectAtIndex:0];
            [ability activateAbility:self];
        }
    }
    
    if(commandNumber == 3){
        NSMutableArray *abilities = ((ShipModel*)selectedShip.model).abilityArray;
        if([abilities count] > 1){
            Ability *ability = [abilities objectAtIndex:1];
            [ability activateAbility:self];
        }
    }
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
    
    
    
    //    selectedShip
    if(!moveCommandSelected){
        GameObjectSprite *touchedObject = [self objectAtPoint:touch withEvent:event];
        if(touchedObject){
            if([touchedObject isKindOfClass:[CardItem class]]){
                NSLog(@"error: no card should exist here in UIShipSelectedState");
            }else if([touchedObject isKindOfClass:[ShipSprite class]]){
                [self transitionToShipSelectState:(ShipSprite*)touchedObject];
                return YES;
            }else if( [touchedObject isKindOfClass:[NodeSprite class]]){
                [self transitionToNodeSelectState:(NodeSprite*)touchedObject];
                return YES;
            }
        }
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
    }else{
        [self sideCameraMovement:touch withEvent:event];
    }
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    [self cameraOnTouchEnded:touch withEvent:event];
    
    //first if needs to be here
    if(isMiniMapSelected){
    }else if([self commandTouchEnded:touch withEvent:event]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotification_ControlCommandButtons object:nil];
        moveCommandSelected = NO;
        [self executeCommand:commandTouched];
        //do ability
    }else if(nothingTouched && !screenMoved){
        if(moveCommandSelected){
            //move ship to point on minimap or point on board
            CGPoint touchPoint = [UIState.playLayer convertTouchToNodeSpace: touch];
            if (CGRectContainsPoint(MINIMAP_RECT, touchPoint)) {
                touchPoint = [self miniMapToBoardConversion:touch withEvent:event];
                [selectedShip moveShip:touchPoint];
            }else if(touchPoint.y > OVERLAY_HEIGHT){
                touchPoint = [UIState.playLayer.boardLayer.shipLayer convertTouchToNodeSpace: touch];
                [selectedShip moveShip:touchPoint];
            }
            [[NSNotificationCenter defaultCenter] postNotificationName:kNotification_ControlCommandButtons object:nil];
            moveCommandSelected = NO;
            
        }else{
            [self transitionToNormalState];
        }
    }else if(selectedShip && !screenMoved){
        //move ship to point on minimap or point on board
        CGPoint touchPoint = [UIState.playLayer convertTouchToNodeSpace: touch];
        if (CGRectContainsPoint(MINIMAP_RECT, touchPoint)) {
            touchPoint = [self miniMapToBoardConversion:touch withEvent:event];
            [selectedShip moveShip:touchPoint];
        }else if(touchPoint.y > OVERLAY_HEIGHT){
            //check if moving to empty space to following a sprite

            
            GameObjectSprite *touchedObject = [self objectAtPoint:touch withEvent:event];
            if(touchedObject){
                [selectedShip moveShipToSprite:touchedObject];
            }else{
                touchPoint = [UIState.playLayer.boardLayer.shipLayer convertTouchToNodeSpace: touch];
                [selectedShip moveShip:touchPoint];
            }
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotification_ControlCommandButtons object:nil];
        moveCommandSelected = NO;
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
    if(selectedShip){
        CGPoint touchPoint = [UIState.playLayer convertTouchToNodeSpace: touch];
        if (CGRectContainsPoint(MINIMAP_RECT, touchPoint)) {
            touchPoint = [self miniMapToBoardConversion:touch withEvent:event];
            [selectedShip moveShip:touchPoint];
        }else if(touchPoint.y > OVERLAY_HEIGHT){
            touchPoint = [UIState.playLayer.boardLayer.shipLayer convertTouchToNodeSpace: touch];
            [selectedShip moveShip:touchPoint];
        }
    }
    moveCommandSelected = NO;
    isMiniMapSelected = NO;
    commandTouched = -1;
    moveCameraDown = NO;
    moveCameraLeft = NO;
    moveCameraRight = NO;
    moveCameraUp = NO;
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotification_ControlCommandButtons object:nil];
}



#pragma mark - Transitions

-(void) transitionToNormalState{
    [self deactivateInterfaceElements];
    UINormalState *normalState = [[[UINormalState alloc] initWithState:self] autorelease];
    [UIState.playLayer changeUIState:normalState];
}


-(void) transitionToNodeSelectState:(NodeSprite *)node{
    [self deactivateInterfaceElements];
    UINodeSelectedState *nodeSelectedState = [[[UINodeSelectedState alloc] initWithSelectedNode:node andState:self] autorelease];
    [UIState.playLayer changeUIState:nodeSelectedState];
}

-(void) transitionToShipSelectState:(ShipSprite *)ship{
    [self deactivateInterfaceElements];
    UIShipSelectState *shipSelectState = [[[UIShipSelectState alloc] initWithSelectedShip:ship andState:self] autorelease];
    [UIState.playLayer changeUIState:shipSelectState];
    
}

-(void) transitionToAbilityTargetsSelectState:(Ability *)ability{
    [self deactivateInterfaceElements];
    UIAbilityTargetsSelectState *abilityTargetsSelectState = [[[UIAbilityTargetsSelectState alloc] initWithState:self andAbility:ability] autorelease];
    [UIState.playLayer changeUIState:abilityTargetsSelectState];
}


@end
