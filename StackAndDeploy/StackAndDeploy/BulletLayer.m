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
        
    }
    return self;
}

-(void) update:(ccTime) dt{
    for(BulletSprite *bullet in MDM.bullets){
        [bullet update:dt];
    }
}

@end
