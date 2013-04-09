//
//  WeaponStatus.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/3/13.
//
//

#import "Status.h"

@interface WeaponStatus : Status{
    float weaponCooldown;
    float fireRate;
    float range;
    NSMutableArray *bulletStatuses;
    
}

@property (nonatomic, retain) NSMutableArray *bulletStatuses;

@end
