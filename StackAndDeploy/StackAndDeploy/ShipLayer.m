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
    if (card.model.type == SHIP) {
        //TODO: change this fromt tst code to a real VO
        ShipSprite *ship = [[[ShipSprite alloc] initWithShipVO:[self testShipVO]] autorelease];
        ship.model.ownership.playerType = LOCAL_PLAYER;
        ship.model.ownership.playerNumber = PLAYER_ONE;
        ship.position = ccp(90, 90);
        [self addChild:ship];
    }else{
        //TODO: implement utility card
    }
}

-(ShipVO*)testShipVO{
    //    float fireRate;
    //float range;
    NSMutableDictionary *bulletStatusArgs = [[[NSMutableDictionary alloc] init] autorelease];
    [bulletStatusArgs setObject:[NSNumber numberWithInt:-20] forKey:@"healthOffset"];
    
    NSMutableDictionary *bulletStatusDic = [[[NSMutableDictionary alloc] init] autorelease];
    [bulletStatusDic setObject:@"HealthOffsetStatus" forKey:@"className"];
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
