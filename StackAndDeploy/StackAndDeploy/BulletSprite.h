//
//  BulletSprite.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/3/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "BoardItemSprite.h"

@class Status;
@interface BulletSprite : BoardItemSprite {
    BoardItemSprite *destination;
    BoardItemSprite *source;
    NSArray *statuses;
}
@property (nonatomic, assign) BoardItemSprite *source, *destination;
@property (nonatomic, retain) NSArray *statuses;
-(id) initWithBoardItemSprite:(BoardItemSprite*) boardItem WithTarget:(BoardItemSprite*)target andStatuses:(NSArray*) _statuses;

-(CGSize) getBounds;


@end
