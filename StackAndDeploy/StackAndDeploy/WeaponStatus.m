//
//  WeaponStatus.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/3/13.
//
//

#import "WeaponStatus.h"
#import "BoardItemModel.h"
#import "ShipSprite.h"
#import "MatchDataManager.h"
#import "BoardItemModel.h"
#import "BulletSprite.h"
#import "HealthOffsetStatus.h"
#import "StatusVO.h"
#import "HinderedHealthOffsetStatus.h"

@implementation WeaponStatus
@synthesize bulletStatuses;


-(id)initWithStatusVO:(StatusVO*)statusVO{
    if(self = [super initWithStatusVO:statusVO]){
        hasBeenApplied = NO;
        range = [[statusVO.arguments objectForKey:@"range"] floatValue];
        fireRate = [[statusVO.arguments objectForKey:@"fireRate"] floatValue];
        bulletStatuses = [[NSMutableArray alloc] init];
        for (NSDictionary *statusDic in [statusVO.arguments objectForKey:@"statuses"]){
            [bulletStatuses addObject:[[StatusVO alloc] initWithDictionary:statusDic]];
        }
    }
    return self;
}

-(void) applyStatus{
    [super applyStatus];
}

-(void) revertStatus{
    
}



-(void) updateStatus:(ccTime) dt{
    [super updateStatus:dt];
}

-(void) reccuringEffect:(ccTime) dt{
    weaponCooldown -= dt;
    //cooldown of weapon
    if(weaponCooldown < 0){
        
        //check if ship is targeting something in movement
        
        
        CGPoint myPosition = target.position;
        for(ShipSprite *ship in MDM.ships){
            //dont fire bullets at yourself
            if(![ship isEqual:target]){
                float distance = ccpDistance(myPosition, ship.position);
                if(distance < range){
                    //TODO: do the class thing again here
                    NSMutableArray *_bulletStatuses = [[[NSMutableArray alloc] init] autorelease];
                    //make real statuses out of all the bulletStatus VOs, then add them to the bullet
                    for(StatusVO *status in bulletStatuses){
                        Class statusClass = NSClassFromString(status.className);
                        id damage = [[[statusClass alloc] initWithStatusVO:status] autorelease];
                        [damage addStatusToGameObject:ship];
                        [_bulletStatuses addObject:damage];
                        
                    }
                    //TODO: make a VO for bullets instead of passing around sprite objects?
                    BulletSprite *bullet = [[BulletSprite alloc] initWithBoardItemSprite:target andStatuses:_bulletStatuses];
                    [[NSNotificationCenter defaultCenter] postNotificationName:kBulletSpawned object:bullet];
                    [bullet release];
                    weaponCooldown = fireRate;
                    return;
                }
            }
        }
    }
}

-(void)dealloc{
    [bulletStatuses release];
    [super dealloc];
}

@end
