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
@synthesize source, destination, statuses;

-(id) initWithBoardItemSprite:(BoardItemSprite*) boardItem WithTarget:(BoardItemSprite*)target andStatuses:(NSArray*) _statuses{
    if(self = [super initWithFile:@"Icon-Small.png"]){
        [boardItem assignObjectToPointer:&source];
        [target assignObjectToPointer:&destination];
        
        self.statuses = [[[NSArray alloc] initWithArray:_statuses] autorelease];
    //    for (Status *status in statuses){
  //          [status.target assignObjectToPointer:&destination];
//        }
        
        self.scale = .2;
        self.position = source.position;
        [self addToArray:MDM.bullets];
        [self performSelector:@selector(move) withObject:nil afterDelay:BULLET_LIFETIME];
        CCMoveTo *moveTo = [CCMoveTo actionWithDuration:BULLET_LIFETIME position:destination.position];
        [self runAction:moveTo];
    }
    return self;
}

-(void) dealloc{
    [source removeObjectFromPointer:&source];
    [destination removeObjectFromPointer:&destination];
    [statuses release];
    [super dealloc];
}

-(CGSize) getBounds{
    return CGSizeMake(10, 10);
}

-(void) update:(ccTime) dt{
    [super update:dt];
    if(destination == nil || destination.remove){
        self.remove = YES;
        [MDM.gameObjectsToRemove addObject:self];
    }else if(CGRectContainsRect(destination.boundingBox,self.boundingBox)){
        [self bulletHit];
    }
}

-(void)bulletHit{
    for (Status *status in statuses){
        [status addStatusToGameObject: destination];
    }
    self.remove = YES;
    [MDM.gameObjectsToRemove addObject:self];
}

-(void)move{
    if(destination) self.position = destination.position;
}

@end
