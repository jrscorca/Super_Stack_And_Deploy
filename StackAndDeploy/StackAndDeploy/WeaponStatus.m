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

@implementation WeaponStatus

-(id)initWithTarget:(BoardItemSprite *)_target{
    if(self = [super initWithTarget:_target]){
        hasBeenApplied = NO;
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
                if(distance < 200){
                    Status *damage = [[[HealthOffsetStatus alloc] init] autorelease];
                    damage.target = ship;
                    //TODO: make a VO for bullets instead of passing around sprite objects?
                    BulletSprite *bullet = [[BulletSprite alloc] initWithBoardItemSprite:target andStatus:damage];
                    [[NSNotificationCenter defaultCenter] postNotificationName:kBulletSpawned object:bullet];
                    [bullet release];
                    weaponCooldown = 5;
                }
            }
        }
        
        
        //look; for enemy ship inrange
        
            // apply damage to enemy ship
    }
    
    
}


@end
