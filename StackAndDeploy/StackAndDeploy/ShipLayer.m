//
//  ShipLayer.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//
//

#import "ShipLayer.h"
#import "ShipSprite.h"
#import "CardItem.h"
#import "CardVO.h"
#import "MatchDataManager.h"
#import "GameObjectSprite.h"
#import "StatusVO.h"
#import "ShipVO.h"

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
    for(ShipSprite *ship in MDM.ships){
        [ship update:dt];
    }
}

-(void)cardPlayed:(NSNotification*)notification{
    CardItem *card = notification.object;
    if (card.cardVO.type == SHIP) {
        ShipSprite *ship = [[[ShipSprite alloc] initWithShipVO:[self testShipVO]] autorelease];
        ship.position = ccp(90, 90);
        [self addChild:ship];

    }
}

-(ShipVO*)testShipVO{
    //    float fireRate;
    //float range;
    NSMutableDictionary *args = [[NSMutableDictionary alloc] init];
    [args setObject:[NSNumber numberWithFloat:5] forKey:@"fireRate"];
    [args setObject:[NSNumber numberWithFloat:150] forKey:@"range"];

    NSMutableDictionary *SD = [[NSMutableDictionary alloc] init];
    [SD setObject:@"WeaponStatus" forKey:@"className"];
    [SD setObject:args forKey:@"arguments"];
    NSMutableArray *statusDics = [[[NSMutableArray alloc] init] autorelease];
    [statusDics addObject:SD];
    
    
    NSMutableDictionary *D = [[NSMutableDictionary alloc] init];
    [D setObject:[NSNumber numberWithInt:50] forKey:@"health"];
    [D setObject:[NSNumber numberWithFloat:5] forKey:@"speed"];
    [D setObject:statusDics forKey:@"statuses"];
    
    ShipVO *ship = [[ShipVO alloc] initWithDictionary:D];
    return ship;
}




@end
