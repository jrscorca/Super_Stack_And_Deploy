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

@implementation WeaponStatus


-(id)initWithTarget:(BoardItemSprite *)_target andStatusVO:(StatusVO*)statusVO{
    if(self = [super initWithTarget:_target andStatusVO:statusVO]){
        hasBeenApplied = NO;
        range = [[statusVO.arguments objectForKey:@"range"] floatValue];
        fireRate = [[statusVO.arguments objectForKey:@"fireRate"] floatValue];
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
        for(ShipSprite *ship in MDM.ships){
            //dont fire bullets at yourself
            if(![ship isEqual:target]){
                float distance = ccpDistance(myPosition, ship.position);
                if(distance < range){
                    
                    NSMutableDictionary *args = [[[NSMutableDictionary alloc] init] autorelease];
                    [args setObject:[NSNumber numberWithInt:-20] forKey:@"healthOffset"];
                    
                    NSMutableDictionary *SD = [[NSMutableDictionary alloc] init];
                    [SD setObject:@"HealthOffsetStatus" forKey:@"className"];
                    [SD setObject:args forKey:@"arguments"];
                    NSMutableArray *statusDics = [[[NSMutableArray alloc] init] autorelease];
                    [statusDics addObject:SD];
                    
                    
                    StatusVO *statusVO = [[StatusVO alloc] initWithDictionary:SD];
                    HealthOffsetStatus *damage = [[[HealthOffsetStatus alloc] initWithTarget:ship andStatusVO:statusVO] autorelease];
                    damage.target = ship;
                    //TODO: make a VO for bullets instead of passing around sprite objects?
                    BulletSprite *bullet = [[BulletSprite alloc] initWithBoardItemSprite:target andStatus:damage];
                    [[NSNotificationCenter defaultCenter] postNotificationName:kBulletSpawned object:bullet];
                    [bullet release];
                    weaponCooldown = fireRate;
                    return;
                }
            }
        }
        
        
        //look; for enemy ship inrange
        
            // apply damage to enemy ship
    }
    
    
}


@end
