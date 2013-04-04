//
//  UIShipSelectState.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/31/13.
//
//

#import "UIState.h"

@class ShipSprite;
@interface UIShipSelectState : UIState{
    ShipSprite *selectedShip;
    BOOL abilitySelected;
    
    
    
}

@property (nonatomic, assign) ShipSprite *selectedShip;

-(id) initWithSelectedShip:(ShipSprite*) _selectedShip andState:(UIState*) state;



@end
