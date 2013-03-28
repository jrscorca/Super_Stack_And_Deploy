//
//  ShipLayer.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//
//

#import "ShipLayer.h"
#import "Ship.h"
#import "CardItem.h"
#import "CardVO.h"

@implementation ShipLayer

@synthesize shipsArray;

-(id) init{
    if(self = [super init]){
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cardPlayed:) name:kCardPlayed object:nil];

        self.shipsArray = [NSMutableArray array];
        
    }
    return self;
}

-(void) update:(ccTime) dt{
    for(Ship *ship in self.shipsArray){
        [ship update:dt];
    }
}

-(void)cardPlayed:(NSNotification*)notification{
    CardItem *card = notification.object;
    if (card.cardVO.type == SHIP) {
        Ship *ship = [[[Ship alloc] initWithShipVO:nil] autorelease];
        ship.position = ccp(90, 90);
        [self addChild:ship];
        [shipsArray addObject:ship];

    }
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kCardPlayed object:nil];
    [super dealloc];
}



@end
