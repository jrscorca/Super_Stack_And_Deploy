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

@implementation BulletSprite


-(id) initWithBoardItemSprite:(BoardItemSprite*) boardItem andStatus:(Status*) status{
    if(self = [super initWithFile:@"Icon-Small.png"]){
        [boardItem assignObjectToPointer:&target];
        self.scale = .2;
        CCMoveTo *moveTo = [CCMoveTo actionWithDuration:.4 position:boardItem.position];
        [self runAction:moveTo];
        [self addToArray:MDM.bullets];
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
    if(target == nil){
        [self destroyObject];
    }
    
    if(CGRectContainsRect(target.boundingBox,self.boundingBox)){
        
        [status addStatusToGameObject: target.model];
        [self destroyObject];
        
    }
//    target
    
    //move ship check collision
    
    
    
}

@end
