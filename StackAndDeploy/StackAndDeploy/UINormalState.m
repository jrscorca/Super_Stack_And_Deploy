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
#import "UICardItemSelectedState.h"
#import "UINodeSelectedState.h"
#import "CommandLayer.h"
#import "DetailsLayer.h"
#import "NodeSprite.h"

@implementation UINormalState

-(id) initWithState:(UIState *)state{
    if(self = [super initWithState:state]){
        
    }
    return self;
}

-(void)activateInterfaceElements{
    UIState.playLayer.hudLayer.handLayer.visible = YES;
}

-(void)deactivateInterfaceElements{
    UIState.playLayer.hudLayer.handLayer.visible = NO;
}


-(void)dealloc{
    [super dealloc];
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {

    [self cameraOnTouchBegan:touch withEvent:event];
    //minimap touching code
    CGPoint touchPoint = [UIState.playLayer convertTouchToNodeSpace: touch];
    if (CGRectContainsPoint(MINIMAP_RECT, touchPoint)) {
        isMiniMapSelected = YES;
        [self moveMiniMap: touch withEvent:event];
        [self cleanCameraVariables];
        return YES;
    }
    
    GameObjectSprite *touchedObject = [self objectAtPoint:touch withEvent:event];
//    [[self objectAtPoint:touch withEvent:event] assignObjectToPointer:&touchedObject];
    if(touchedObject){
        if([touchedObject isKindOfClass:[CardItem class]]){
            [self transitionToCardSelectState:(CardItem*)touchedObject];
            return YES;
        }else if([touchedObject isKindOfClass:[ShipSprite class]]){
            [self transitionToShipSelectState:(ShipSprite*)touchedObject];
            return YES;
        }else if( [touchedObject isKindOfClass:[NodeSprite class]]){
            [self transitionToNodeSelectState:(NodeSprite*)touchedObject];
            return YES;
        }
    }
    
    

    
    //camera/world movement
//    previousTouchPoint = [playLayer.boardLayer convertTouchToNodeSpace:touch];

    
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
    [self deactivateInterfaceElements];
    UIShipSelectState *shipSelectState = [[[UIShipSelectState alloc] initWithSelectedShip:ship andState:self] autorelease];
    [UIState.playLayer changeUIState:shipSelectState];
}

-(void) transitionToNodeSelectState:(NodeSprite *)node{
    [self deactivateInterfaceElements];
    UINodeSelectedState *nodeSelectedState = [[[UINodeSelectedState alloc] initWithSelectedNode:node andState:self] autorelease];
    [UIState.playLayer changeUIState:nodeSelectedState];
}

-(void) transitionToCardSelectState:(CardItem *)card{
    [self deactivateInterfaceElements];
    UICardItemSelectedState *cardItemSelectedState = [[[UICardItemSelectedState alloc] initWithSelectedCardItem:card andState:self] autorelease];
    [UIState.playLayer changeUIState:cardItemSelectedState];
}



@end
