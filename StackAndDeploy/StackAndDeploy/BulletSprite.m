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
@synthesize target;

-(id) initWithBoardItemSprite:(BoardItemSprite*) boardItem andStatus:(Status*) _status{
    if(self = [super initWithFile:@"Icon-Small.png"]){
        [boardItem assignObjectToPointer:&target];
        self.scale = .2;
        self.position = status.target.position;
        [self addToArray:MDM.bullets];
        status = _status;
    }
    return self;
}

-(void) dealloc{
    [target removeObjectFromPointer:&target];
    [super dealloc];
}

-(CGSize) getBounds{
    return CGSizeMake(10, 10);
}

-(void) update:(ccTime) dt{
    [super update:dt];
    if(target == nil){
        [self destroyObject];
    }
    
    if(CGRectContainsRect(target.boundingBox,self.boundingBox)){
        [status addStatusToGameObject: target];
        //TODO: can't remove while array is being enumerated
        //[self destroyObject];
        remove = YES;
    }
    //target
    
    //move ship check collision
    
    
    
}

@end
