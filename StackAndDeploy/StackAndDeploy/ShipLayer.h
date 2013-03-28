//
//  ShipLayer.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface ShipLayer : CCLayer{
    NSMutableArray *shipsArray;
}
@property (nonatomic, retain)     NSMutableArray *shipsArray;


-(void) update:(ccTime) dt;

@end
