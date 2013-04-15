//
//  WeaponStatus.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/3/13.
//
//

#import "Status.h"


@class BoardItemSprite;
@interface WeaponStatus : Status{
    float weaponCooldown;
    float fireRate;
    float range;
    NSMutableArray *bulletStatuses;
    
}

@property (nonatomic, retain) NSMutableArray *bulletStatuses;

-(void)spawnBulletAttacking:(BoardItemSprite*) boardSprite;

@end
