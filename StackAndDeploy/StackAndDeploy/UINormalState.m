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

@implementation UINormalState

-(id) initWithPlayLayer:(PlayLayer*) _playLayer{
    if(self = [super initWithPlayLayer:_playLayer]){
    }
    return self;
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
//            selectedShip = ship;
            return YES;
        }
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
            [[NSNotificationCenter defaultCenter] postNotificationName:kCardPlayed object:selectedCard];
            [selectedCard destroyObject];
//            [self cardPlayed:selectedCard];
        }else{
            selectedShip.isSelected = NO;
            [selectedShip removeObjectFromPointer:&selectedShip];
        }
        [playLayer.hudLayer.handLayer organizeHand];
    }else if(selectedShip){
        selectedShip.isSelected = NO;
        [selectedShip removeObjectFromPointer:&selectedShip];
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
    }else{
        [self cameraOnTouchCancelled:touch withEvent:event];
    }
}

-(void)cardPlayed:(CardItem*)card{

    
}


@end
