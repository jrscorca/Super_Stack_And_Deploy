//
//  ShipVO.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//
//

#import <Foundation/Foundation.h>
#import "GameObjectVO.h"
@interface ShipVO : GameObjectVO{
    int health;
    NSMutableArray *statuses;
    float speed;
}

@property (assign) int health;
@property (nonatomic, retain) NSMutableArray *statuses;
@property (assign) float speed;

-(id)initWithDictionary:(NSDictionary*)dic;

@end
