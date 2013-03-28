//
//  ShipLayer.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//
//

#import "ShipLayer.h"
#import "Ship.h"

@implementation ShipLayer

@synthesize shipsArray;

-(id) init{
    if(self = [super init]){
        self.shipsArray = [NSMutableArray array];
        
        //test purposes
        Ship *ship = [[[Ship alloc] initWithShipVO:nil] autorelease];
        ship.position = ccp(90, 90);
        [self addChild:ship];
        [shipsArray addObject:ship];
    }
    return self;
}

-(void) update:(ccTime) dt{
    for(Ship *ship in self.shipsArray){
        [ship update:dt];
    }
}



@end
