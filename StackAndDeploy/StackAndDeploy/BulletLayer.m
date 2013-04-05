//
//  BulletLayer.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/3/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "BulletLayer.h"
#import "BulletSprite.h"
#import "MatchDataManager.h"
#import "WeaponStatus.h"

@implementation BulletLayer

- (id)init{
    if ((self = [super init])) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(drawBulletNotification:) name:kBulletSpawned object:nil];
    }
    return self;
}

-(void) update:(ccTime) dt{
    for(BulletSprite *bullet in MDM.bullets){
        [bullet update:dt];
    }
}

-(void)drawBulletNotification:(NSNotification*)notification{
    [self drawBullet:notification.object];
}

-(void)drawBullet:(BulletSprite*)bulletSprite{
    [self addChild:bulletSprite];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kBulletSpawned object:nil];
    [super dealloc];
}

@end
