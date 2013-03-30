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
#import "MatchDataManager.h"
#import "GameObject.h"

@implementation ShipLayer


-(id) init{
    if(self = [super init]){
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cardPlayed:) name:kCardPlayed object:nil];

    }
    return self;
}

-(void) dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kCardPlayed object:nil];
    [super dealloc];
}


-(void) update:(ccTime) dt{
    for(Ship *ship in MDM.shipsArray){
        [ship update:dt];
    }
}

-(void)cardPlayed:(NSNotification*)notification{
    CardItem *card = notification.object;
    if (card.cardVO.type == SHIP) {
        Ship *ship = [[[Ship alloc] initWithShipVO:nil] autorelease];
        ship.position = ccp(90, 90);
        [ship addToArray:MDM.shipsArray];
        [self addChild:ship];

    }
}




@end
