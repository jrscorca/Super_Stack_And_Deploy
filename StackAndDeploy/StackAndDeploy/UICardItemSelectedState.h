//
//  UICardItemSelectedState.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/2/13.
//
//

#import "UIState.h"

@class CardItem;
@interface UICardItemSelectedState : UIState{
    CardItem *selectedCard;
}

-(id) initWithSelectedCardItem:(CardItem*) cardItem;

-(void)cardPlayed:(CardItem*)card;

@end
