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

@implementation BulletLayer

- (id)init{
    if ((self = [super init])) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(drawBulletNotification:) name:kBulletSpawned object:nil];
    }
    return self;
}

-(void) update:(ccTime) dt{
    int asdf = [MDM.bullets count];
    for(BulletSprite *bullet in MDM.bullets){
        [bullet update:dt];
    }
}

-(void)drawBulletNotification:(NSNotification*)notification{
    [self drawBullet:notification.object];
}

-(void)drawBullet:(BulletSprite*)bulletSprite{
    NSLog(@"BULLET: %f, %f", bulletSprite.position.x, bulletSprite.position.y);
    NSLog(@"TARGET: %f, %f", bulletSprite.target.position.x, bulletSprite.target.position.y);
    [self addChild:bulletSprite];
    CCMoveTo *moveTo = [CCMoveTo actionWithDuration:.4 position:bulletSprite.target.position];
    [self runAction:moveTo];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kBulletSpawned object:nil];
    [super dealloc];
}

@end
