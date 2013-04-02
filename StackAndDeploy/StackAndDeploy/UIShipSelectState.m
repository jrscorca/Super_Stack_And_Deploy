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
#import "Ship.h"
#import "ShipSelectLayer.h"
#import "UINormalState.h"

@implementation UIShipSelectState

@synthesize selectedShip;


-(id) initWithSelectedShip:(Ship*) _selectedShip{
    if(self = [super init]){
        [_selectedShip assignObjectToPointer:&selectedShip];
        selectedShip.isSelected = YES;
        
    }
    return self;
}


-(void)dealloc{
    [selectedShip removeObjectFromPointer:&selectedShip];
    [super dealloc];
}




- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    
    
//    selectedShip
    
    GameObject *touchedObject = [self objectAtPoint:touch withEvent:event];
    if(touchedObject){
        if([touchedObject isKindOfClass:[CardItem class]]){
            NSLog(@"error: no card should exist here in UIShipSelectedState");
        }else if([touchedObject isKindOfClass:[Ship class]]){
            [self transitionToShipSelectState:(Ship*)touchedObject];
            return YES;
        }
    }
    
    
    CGPoint touchPoint = [UIState.playLayer convertTouchToNodeSpace: touch];
    if (CGRectContainsPoint(MINIMAP_RECT, touchPoint)) {
        isMiniMapSelected = YES;
        [self moveMiniMap: touch withEvent:event];
        [self cleanCameraVariables];
        return YES;
    }
    
    
    [self transitionToNormalState];
    return YES;
}

-(void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event{
    if(isMiniMapSelected){
        [self moveMiniMap: touch withEvent:event];
    }
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    if(selectedShip){
        //move ship to point on minimap or point on board
        CGPoint touchPoint = [UIState.playLayer convertTouchToNodeSpace: touch];
        if (CGRectContainsPoint(MINIMAP_RECT, touchPoint)) {
            touchPoint = [self miniMapToBoardConversion:touch withEvent:event];
        }else{
            touchPoint = [UIState.playLayer.boardLayer.shipLayer convertTouchToNodeSpace: touch];
        }
        [selectedShip moveShip:touchPoint];
        
    }else if(isMiniMapSelected){
        isMiniMapSelected = NO;
    }
}

- (void) ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event{
    if(selectedShip){
        
        CGPoint touchPoint = [UIState.playLayer convertTouchToNodeSpace: touch];
        if (CGRectContainsPoint(MINIMAP_RECT, touchPoint)) {
            touchPoint = [self miniMapToBoardConversion:touch withEvent:event];
        }else{
            touchPoint = [UIState.playLayer.boardLayer.shipLayer convertTouchToNodeSpace: touch];
        }
        [selectedShip moveShip:touchPoint];
    }else if(isMiniMapSelected){
        isMiniMapSelected = NO;
    }
}


#pragma mark - Transitions

-(void) transitionToNormalState{
    UINormalState *normalState = [[[UINormalState alloc] init] autorelease];
    UIState.playLayer.hudLayer.handLayer.visible = YES;
    UIState.playLayer.hudLayer.shipSelectLayer.visible = NO;
    selectedShip.isSelected = NO;
    [UIState.playLayer changeUIState:normalState];
    
}


@end
