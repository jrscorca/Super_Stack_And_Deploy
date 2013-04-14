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
    int maxHealth;
    NSMutableArray *statuses;
    float speed;
    CGPoint spawnLocation;
}

@property (assign) int health, maxHealth;
@property (nonatomic, retain) NSMutableArray *statuses;
@property (assign) float speed;
@property (assign) CGPoint spawnLocation;

-(id)initWithDictionary:(NSDictionary*)dic;

@end
