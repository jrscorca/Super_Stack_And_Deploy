//
//  UINormalState.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/29/13.
//
//

#import "UINormalState.h"
#import "PlayLayer.h"
#import "HUDLayer.h"
#import "HandLayer.h"
#import "MatchDataManager.h"
#import "CardItem.h"
#import "BoardLayer.h"
#import "ShipLayer.h"
#import "ShipSprite.h"
#import "UIShipSelectState.h"
#import "ShipSelectLayer.h"
#import "UICardItemSelectedState.h"

@implementation UINormalState

-(id) initWithState:(UIState *)state{
    if(self = [super initWithState:state]){
        
    }
    return self;
}

-(void)dealloc{
    [super dealloc];
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {

    GameObjectSprite *touchedObject = [self objectAtPoint:touch withEvent:event];
//    [[self objectAtPoint:touch withEvent:event] assignObjectToPointer:&touchedObject];
    if(touchedObject){
        if([touchedObject isKindOfClass:[CardItem class]]){
            [self transitionToCardSelectState:(CardItem*)touchedObject];
            return YES;
        }else if([touchedObject isKindOfClass:[ShipSprite class]]){
            [self transitionToShipSelectState:(ShipSprite*)touchedObject];
            return YES;
        }
    }
    
    
    //minimap touching code
    CGPoint touchPoint = [UIState.playLayer convertTouchToNodeSpace: touch];
    if (CGRectContainsPoint(MINIMAP_RECT, touchPoint)) {
        isMiniMapSelected = YES;
        [self moveMiniMap: touch withEvent:event];
        [self cleanCameraVariables];
        return YES;
    }
    
    //camera/world movement
//    previousTouchPoint = [playLayer.boardLayer convertTouchToNodeSpace:touch];
    [self cameraOnTouchBegan:touch withEvent:event];
    
    return YES;
}

-(void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event{
    if(isMiniMapSelected){
        [self moveMiniMap: touch withEvent:event];
    }else{
        [self cameraOnTouchMoved:touch withEvent:event];
    }    
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    if(isMiniMapSelected){
        isMiniMapSelected = NO;
    }else{
        [self cameraOnTouchEnded:touch withEvent:event];
    }
}

- (void) ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event{
    if(selectedCard){
        [selectedCard removeObjectFromPointer:&selectedCard];
    }else if(isMiniMapSelected){
        isMiniMapSelected = NO;
    }else{
        [self cameraOnTouchCancelled:touch withEvent:event];
    }
}


#pragma mark - Transitions
-(void) transitionToShipSelectState:(ShipSprite*) ship{
    UIShipSelectState *shipSelectState = [[[UIShipSelectState alloc] initWithSelectedShip:ship andState:self] autorelease];
    UIState.playLayer.hudLayer.handLayer.visible = NO;
    UIState.playLayer.hudLayer.shipSelectLayer.visible = YES;
    [UIState.playLayer changeUIState:shipSelectState];
}

-(void) transitionToCardSelectState:(CardItem *)card{
    UICardItemSelectedState *cardItemSelectedState = [[[UICardItemSelectedState alloc] initWithSelectedCardItem:card andState:self] autorelease];
    [UIState.playLayer changeUIState:cardItemSelectedState];
}



@end
