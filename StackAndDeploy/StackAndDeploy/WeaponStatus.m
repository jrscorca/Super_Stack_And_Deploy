//
//  WeaponStatus.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/3/13.
//
//

#import "WeaponStatus.h"
#import "BoardItemModel.h"
#import "ShipModel.h"
#import "ShipSprite.h"
#import "MatchDataManager.h"
#import "BoardItemModel.h"
#import "BulletSprite.h"
#import "HealthOffsetStatus.h"
#import "StatusVO.h"
#import "HinderedHealthOffsetStatus.h"
#import "SteeringBehavior.h"
#import "BaseSprite.h"

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
        CGPoint myPosition = target.position;
        
        //check if ship is targeting something in movement, if so, only fire bullets at that target
        if([target isKindOfClass:[ShipSprite class]]){
            ShipSprite *shipSprite = (ShipSprite*)target;
//            ShipModel *shipModel = (ShipModel*)target.model;
            SteeringBehavior *steering = shipSprite.steeringBehavior;
            BoardItemSprite *shipTarget = steering.gameObject;
            if([shipTarget isKindOfClass:[BaseSprite class]] || [shipTarget isKindOfClass:[ShipSprite class]]){
                //dont fire bullets at yourself
                if(![shipTarget isEqual:target]){
                    float distance = ccpDistance(myPosition, shipTarget.position);
                    
                    //if target is locked on, dont fire at any other object
                    if(distance < range){
                        [self spawnBulletAttacking:shipTarget];
                    }
                    return;
                }

            }
        }
        
        

        for(ShipSprite *ship in MDM.ships){
            //dont fire bullets at yourself
            if(![ship isEqual:target]){
                float distance = ccpDistance(myPosition, ship.position);
                if(distance < range){
                    [self spawnBulletAttacking:ship];
                    return;
                }
            }
        }
    }
}

-(void)spawnBulletAttacking:(BoardItemSprite*) boardSprite{
    //TODO: do the class thing again here
    NSMutableArray *_bulletStatuses = [[[NSMutableArray alloc] init] autorelease];
    //make real statuses out of all the bulletStatus VOs, then add them to the bullet
    for(StatusVO *status in bulletStatuses){
        Class statusClass = NSClassFromString(status.className);
        id damage = [[[statusClass alloc] initWithStatusVO:status] autorelease];
      //  [damage addStatusToGameObject:boardSprite];
        [_bulletStatuses addObject:damage];
        
    }
    //TODO: make a VO for bullets instead of passing around sprite objects?
    BulletSprite *bullet = [[BulletSprite alloc] initWithBoardItemSprite:target WithTarget:boardSprite andStatuses:_bulletStatuses];
    [[NSNotificationCenter defaultCenter] postNotificationName:kBulletSpawned object:bullet];
    [bullet release];
    weaponCooldown = fireRate;
}

-(void)dealloc{
    [bulletStatuses release];
    [super dealloc];
}

@end
