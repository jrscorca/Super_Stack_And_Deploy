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
#import "ShipModel.h"
#import "Ownership.h"
#import "CardModel.h"
#import "Ability.h"

@implementation ShipLayer


-(id) init{
    if(self = [super init]){
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(spawnShip:) name:kSpawnShip object:nil];

    }
    return self;
}

-(void) dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kSpawnShip object:nil];
    [super dealloc];
}


-(void) update:(ccTime) dt{
    for(ShipSprite *ship in MDM.ships){
        [ship update:dt];
    }
}

-(void)spawnShip:(NSNotification*)notification{
    ShipVO *shipVO = notification.object;
    ShipSprite *ship = [[[ShipSprite alloc] initWithShipVO:shipVO] autorelease];
    ship.model.ownership.playerType = LOCAL_PLAYER;
    ship.model.ownership.playerNumber = PLAYER_ONE;
    ship.position = shipVO.spawnLocation;
    [self addChild:ship];
}

-(ShipVO*)testShipVO{
    //    float fireRate;
    //float range;
    NSMutableDictionary *bulletStatusArgs = [[[NSMutableDictionary alloc] init] autorelease];
    [bulletStatusArgs setObject:[NSNumber numberWithInt:-20] forKey:@"healthOffset"];
    
    NSMutableDictionary *bulletStatusDic = [[[NSMutableDictionary alloc] init] autorelease];
    [bulletStatusDic setObject:@"HinderedHealthOffsetStatus" forKey:@"className"];
    [bulletStatusDic setObject:bulletStatusArgs forKey:@"arguments"];
    
    NSMutableArray *bulStatuses = [[[NSMutableArray alloc] init] autorelease];
    [bulStatuses addObject:bulletStatusDic];
    
    NSMutableDictionary *args = [[[NSMutableDictionary alloc] init] autorelease];
    [args setObject:[NSNumber numberWithFloat:5] forKey:@"fireRate"];
    [args setObject:[NSNumber numberWithFloat:150] forKey:@"range"];
    [args setObject:bulStatuses forKey:@"bulletStatuses"];

    NSMutableDictionary *SD = [[[NSMutableDictionary alloc] init] autorelease];
    [SD setObject:@"WeaponStatus" forKey:@"className"];
    [SD setObject:args forKey:@"arguments"];
    NSMutableArray *statusDics = [[[NSMutableArray alloc] init] autorelease];
    [statusDics addObject:SD];
    
    
    NSMutableDictionary *D = [[[NSMutableDictionary alloc] init] autorelease];
    [D setObject:[NSNumber numberWithInt:50] forKey:@"health"];
    [D setObject:[NSNumber numberWithFloat:5] forKey:@"speed"];
    [D setObject:statusDics forKey:@"statuses"];
    
    ShipVO *ship = [[ShipVO alloc] initWithDictionary:D];
    return ship;
}




@end
