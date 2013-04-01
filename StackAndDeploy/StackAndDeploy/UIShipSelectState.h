//
//  UIShipSelectState.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/31/13.
//
//

#import "UIState.h"

@class Ship;
@interface UIShipSelectState : UIState{
    Ship *selectedShip;
    
    
}

@property (nonatomic, assign) Ship *selectedShip;

-(id) initWithUI:(UIState*) state SelectedShip:(Ship*) _selectedShip;

-(void) shipMiniMapMovement:(UITouch*)touch withEvent:(UIEvent*)event;

@end
