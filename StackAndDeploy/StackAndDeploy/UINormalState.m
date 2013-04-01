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
#import "Ship.h"
#import "UIShipSelectState.h"
#import "ShipSelectLayer.h"

@implementation UINormalState

-(id) initWithPlayLayer:(PlayLayer*) _playLayer{
    if(self = [super initWithPlayLayer:_playLayer]){
        
    }
    return self;
}

-(void)dealloc{
    [selectedCard removeObjectFromPointer:&selectedCard];
    [selectedShip removeObjectFromPointer:&selectedShip];
    [super dealloc];
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    //card movement
    CGPoint touchPoint = [playLayer.hudLayer.handLayer convertTouchToNodeSpace: touch];
    for (CardItem *card in MDM.localCardItemArray){
        if (CGRectContainsPoint(card.boundingBox, touchPoint)) {
            [card assignObjectToPointer:&selectedCard];
            return YES;
        }
    }

    //ship movement
    touchPoint = [playLayer.boardLayer.shipLayer convertTouchToNodeSpace:touch];
    for (Ship *ship in MDM.shipsArray){
        if (CGRectContainsPoint(ship.boundingBox, touchPoint)) {
            ship.isSelected = YES;
            [ship assignObjectToPointer:&selectedShip];
            [self transitionToShipSelectState];
            return YES;
        }
    }
    
    
    //minimap touching code
    touchPoint = [playLayer convertTouchToNodeSpace: touch];
//    CGRect minimapRect = CGRectMake(0, 0, 100, 100);
    if (CGRectContainsPoint(MINIMAP_RECT, touchPoint)) {
        //mini map touch;
//        NSLog(@"minimap");
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
    if(selectedCard){
        selectedCard.position = [playLayer.hudLayer.handLayer convertTouchToNodeSpace: touch];
    }else if(selectedShip){
         selectedShip.objective = [playLayer.boardLayer.shipLayer convertTouchToNodeSpace: touch];
    }else if(isMiniMapSelected){
        
        [self moveMiniMap: touch withEvent:event];
    }else{
        [self cameraOnTouchMoved:touch withEvent:event];
      //  CGPoint touchPoint = [playLayer.boardLayer convertTouchToNodeSpace:touch];
    //    CGPoint difference = ccpSub(touchPoint, previousTouchPoint);
  //      playLayer.boardLayer.position = ccpAdd(difference, playLayer.boardLayer.position);
//        previousTouchPoint = touchPoint;
    }    
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    if(selectedCard){
        if (selectedCard.position.y > winSize.height*.2) {
            [self cardPlayed:selectedCard];
            [selectedCard destroyObject];
        }else{
            selectedShip.isSelected = NO;
            [selectedShip removeObjectFromPointer:&selectedShip];
        }
        [playLayer.hudLayer.handLayer organizeHand];
    }else if(selectedShip){
        selectedShip.isSelected = NO;
        [selectedShip removeObjectFromPointer:&selectedShip];
    }else if(isMiniMapSelected){
        isMiniMapSelected = NO;
    }else{
        [self cameraOnTouchEnded:touch withEvent:event];
    }
}

- (void) ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event{
    if(selectedShip){
        selectedShip.isSelected = NO;
        [selectedShip removeObjectFromPointer:&selectedShip];
    }else if(selectedCard){
        [selectedCard removeObjectFromPointer:&selectedCard];
    }else if(isMiniMapSelected){
        isMiniMapSelected = NO;
    }else{
        [self cameraOnTouchCancelled:touch withEvent:event];
    }
}

-(void)cardPlayed:(CardItem*)card{
    [[NSNotificationCenter defaultCenter] postNotificationName:kCardPlayed object:card];
}
#pragma mark - Transitions
-(void) transitionToShipSelectState{
    UIShipSelectState *shipSelectState = [[[UIShipSelectState alloc] initWithUI:self SelectedShip:selectedShip] autorelease];
    self.playLayer.hudLayer.handLayer.visible = NO;
    self.playLayer.hudLayer.shipSelectLayer.visible = YES;
    [self.playLayer changeUIState:shipSelectState];
    
    
}



@end
