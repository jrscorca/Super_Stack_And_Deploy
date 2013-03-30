//
//  UINormalState.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/29/13.
//
//

#import "UIState.h"


@class CardItem, Ship;
@interface UINormalState : UIState{
    CardItem *selectedCard;
    Ship *selectedShip;
    
}

@end
