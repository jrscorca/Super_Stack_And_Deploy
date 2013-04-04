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

-(id)init{
    if(self = [super init]){
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
            if(ship != target){
                float distance = ccpDistance(myPosition, ship.position);
                if(distance < 100){
                    Status *damage = [[[HealthOffsetStatus alloc] init] autorelease];
                    BulletSprite *bullet = [[BulletSprite alloc] initWithBoardItemSprite:target andStatus:damage];
                    
                    weaponCooldown = 5;
                }
            }
        }
        
        
        //look; for enemy ship inrange
        
            // apply damage to enemy ship
    }
    
    
}


@end
