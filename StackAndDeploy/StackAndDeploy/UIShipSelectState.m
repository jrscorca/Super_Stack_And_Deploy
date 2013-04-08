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
#import "ShipSelectLayer.h"
#import "ShipModel.h"
#import "Ability.h"
#import "UINormalState.h"

@implementation UIShipSelectState

@synthesize selectedShip;


-(id) initWithSelectedShip:(ShipSprite*) _selectedShip andState:(UIState*) state{
    if(self = [super initWithState:state]){
        [_selectedShip assignObjectToPointer:&selectedShip];
        selectedShip.isSelected = YES;
        abilitySelected = NO;
        //send notification
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotification_ShipSelected object:selectedShip];
        

    }
    return self;
}


-(void)dealloc{
    [selectedShip removeObjectFromPointer:&selectedShip];
    [super dealloc];
}

-(void) updateState:(ccTime)dt{
    if(!selectedShip){
        [self transitionToNormalState];
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
    if(CGRectContainsPoint(ABILITY_RECT, touchPoint)) {
        abilitySelected = YES;
        return YES;
    }
    
    

//    selectedShip
    
    GameObjectSprite *touchedObject = [self objectAtPoint:touch withEvent:event];
    if(touchedObject){
        if([touchedObject isKindOfClass:[CardItem class]]){
            NSLog(@"error: no card should exist here in UIShipSelectedState");
        }else if([touchedObject isKindOfClass:[ShipSprite class]]){
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
        screenMoved = YES;
        [self cameraOnTouchMoved:touch withEvent:event];
    }else{
        [self sideCameraMovement:touch withEvent:event];
    }
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    [self cameraOnTouchEnded:touch withEvent:event];    
    CGPoint touchPoint = [UIState.playLayer convertTouchToNodeSpace: touch];
    if(isMiniMapSelected){
    }else if(abilitySelected && CGRectContainsPoint(ABILITY_RECT, touchPoint)) {
        //do ability
        Ability *ability = [((ShipModel*)selectedShip.model).abilityArray objectAtIndex:0];
        [ability activateAbility];
        //incase ship destroys itself with ability
        if(!selectedShip){
            [self transitionToNormalState];
        }
    }else if(nothingTouched && !screenMoved){

        [self transitionToNormalState];
    }else if(selectedShip && !screenMoved){
        //move ship to point on minimap or point on board
        CGPoint touchPoint = [UIState.playLayer convertTouchToNodeSpace: touch];
        if (CGRectContainsPoint(MINIMAP_RECT, touchPoint)) {
            touchPoint = [self miniMapToBoardConversion:touch withEvent:event];
            [selectedShip moveShip:touchPoint];
        }else if(touchPoint.y > OVERLAY_HEIGHT){
            touchPoint = [UIState.playLayer.boardLayer.shipLayer convertTouchToNodeSpace: touch];
            [selectedShip moveShip:touchPoint];
        }
    }
    screenMoved = NO;
    nothingTouched = NO;
    abilitySelected = NO;
    isMiniMapSelected = NO;
    
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

    }else if(isMiniMapSelected){
        isMiniMapSelected = NO;
    }else if(abilitySelected){
        abilitySelected = NO;
    }
}


#pragma mark - Transitions

-(void) transitionToNormalState{
    UINormalState *normalState = [[[UINormalState alloc] initWithState:self] autorelease];
    UIState.playLayer.hudLayer.handLayer.visible = YES;
    UIState.playLayer.hudLayer.shipSelectLayer.visible = NO;
    selectedShip.isSelected = NO;
    [UIState.playLayer changeUIState:normalState];
    
}

-(void) transitionToShipSelectState:(ShipSprite *)ship{
    UIShipSelectState *shipSelectState = [[[UIShipSelectState alloc] initWithSelectedShip:ship andState:self] autorelease];
    [UIState.playLayer changeUIState:shipSelectState];
}


@end
