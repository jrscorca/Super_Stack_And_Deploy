//
//  Ship.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameObject.h"

@class ShipVO;
@interface Ship : GameObject {
    CGPoint velocity;
    CGPoint objective;
    BOOL isSelected;
}

@property (nonatomic) BOOL isSelected;
@property (nonatomic) CGPoint objective;

-(id)initWithShipVO:(ShipVO*)shipVO;

-(void) update:(ccTime) dt;

-(CGPoint) movement:(CGPoint) destination;

//

-(void)moveShip:(CGPoint)touch;

@end
