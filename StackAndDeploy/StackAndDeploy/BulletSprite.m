//
//  Bullet.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/3/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "BulletSprite.h"
#import "BoardItemSprite.h"
#import "Status.h"
#import "MatchDataManager.h"
#import "BoardItemModel.h"
#import "BulletModel.h"

@implementation BulletSprite
@synthesize source, destination, status;

-(id) initWithBoardItemSprite:(BoardItemSprite*) boardItem andStatus:(Status*) _status{
    if(self = [super initWithFile:@"Icon-Small.png"]){
        [boardItem assignObjectToPointer:&source];
        [_status.target assignObjectToPointer:&destination];
        self.scale = .2;
        self.position = source.position;
        [self addToArray:MDM.bullets];
        self.status = _status;
        [self performSelector:@selector(bulletHit) withObject:nil afterDelay:BULLET_LIFETIME];
        CCMoveTo *moveTo = [CCMoveTo actionWithDuration:BULLET_LIFETIME position:destination.position];
        [self runAction:moveTo];
    }
    return self;
}

-(void) dealloc{
    [source removeObjectFromPointer:&source];
    [destination removeObjectFromPointer:&destination];
    [super dealloc];
}

-(CGSize) getBounds{
    return CGSizeMake(10, 10);
}

-(void) update:(ccTime) dt{
    [super update:dt];
    if(destination == nil){
        [self destroyObject];
    }else if(CGRectContainsRect(destination.boundingBox,self.boundingBox)){
        [self bulletHit];
    }
}

-(void)bulletHit{
    [status addStatusToGameObject: destination];
    self.remove = YES;
    [MDM.gameObjectsToRemove addObject:self];
}

@end
