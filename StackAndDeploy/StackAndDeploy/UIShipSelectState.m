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


-(id) initWithUI:(UIState*) state SelectedShip:(Ship*) _selectedShip{
    if(self = [super initWithPlayLayer:state.playLayer]){
        [_selectedShip assignObjectToPointer:&selectedShip];
//        self.selectedShip = _selectedShip;
        
    }
    return self;
}


-(void)dealloc{
    [selectedShip removeObjectFromPointer:&selectedShip];
    [super dealloc];
}



-(void) shipMiniMapMovement:(UITouch*)touch withEvent:(UIEvent*)event{
    CGPoint touchPoint = [playLayer convertTouchToNodeSpace: touch];
    CGPoint percentOnMiniMap = ccp(touchPoint.x/MINIMAP_RECT.size.width, touchPoint.y/MINIMAP_RECT.size.height);
    //TODO: this number should be a ratio between screen size and map size
    //percentOnMiniMap = ccpSub(percentOnMiniMap, ccp(-0.2, -0.2));
    
    // move boardLayer to that relative spot
    CGSize limit = BOARD_SIZE;
    selectedShip.objective = ccp(percentOnMiniMap.x * limit.width, percentOnMiniMap.y * limit.height);
    

    
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    //ship movement
    CGPoint touchPoint = [playLayer.boardLayer.shipLayer convertTouchToNodeSpace:touch];
    for (Ship *ship in MDM.shipsArray){
        if (CGRectContainsPoint(ship.boundingBox, touchPoint)) {
            ship.isSelected = YES;
            [ship assignObjectToPointer:&selectedShip];
            //            selectedShip = ship;
            return YES;
        }
    }
    [self transitionToNormalState];

   /*
    //minimap touching code
    touchPoint = [playLayer convertTouchToNodeSpace: touch];
    //    CGRect minimapRect = CGRectMake(0, 0, 100, 100);
    if (CGRectContainsPoint(MINIMAP_RECT, touchPoint)) {
        //mini map touch;
        //        NSLog(@"minimap");
        isMiniMapSelected = YES;
        return YES;
    }
    
    //camera/world movement
    //    previousTouchPoint = [playLayer.boardLayer convertTouchToNodeSpace:touch];
    [self cameraOnTouchBegan:touch withEvent:event];
    */
    return YES;
}

-(void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event{
    if(selectedShip){
       // selectedShip.objective = [playLayer.boardLayer.shipLayer convertTouchToNodeSpace: touch];
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
  //  CGSize winSize = [[CCDirector sharedDirector] winSize];
    if(selectedShip){
//        selectedShip.isSelected = NO;
       // [selectedShip removeObjectFromPointer:&selectedShip];
//        CGRect minimapRect = CGRectMake(0, 0, 100, 100);
        CGPoint touchPoint = [playLayer convertTouchToNodeSpace: touch];
        if (CGRectContainsPoint(MINIMAP_RECT, touchPoint)) {
            [self shipMiniMapMovement:touch withEvent:event];
        }else{
            selectedShip.objective = [playLayer.boardLayer.shipLayer convertTouchToNodeSpace: touch];
        }
    }else if(isMiniMapSelected){
        isMiniMapSelected = NO;
    }else{
        [self cameraOnTouchEnded:touch withEvent:event];
        [self transitionToNormalState];
    }
}

- (void) ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event{
    if(selectedShip){
        selectedShip.isSelected = NO;
        [selectedShip removeObjectFromPointer:&selectedShip];
        [self transitionToNormalState];
    }else if(isMiniMapSelected){
        isMiniMapSelected = NO;
    }else{
        [self cameraOnTouchCancelled:touch withEvent:event];
        [self transitionToNormalState];
    }
}


#pragma mark - Transitions

-(void) transitionToNormalState{
    UINormalState *normalState = [[[UINormalState alloc] initWithPlayLayer:self.playLayer] autorelease];
    self.playLayer.hudLayer.handLayer.visible = YES;
    self.playLayer.hudLayer.shipSelectLayer.visible = NO;
    selectedShip.isSelected = NO;
    [self.playLayer changeUIState:normalState];
    
}


@end
