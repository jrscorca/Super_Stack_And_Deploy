//
//  ShipLayer.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class Ship;
@interface ShipLayer : CCLayer{
    NSMutableArray *shipsArray;
    Ship *selectedShip;
}

@property (nonatomic, retain) NSMutableArray *shipsArray;


-(void) update:(ccTime) dt;

@end
