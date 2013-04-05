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
    Status *status;
}
@property (nonatomic, assign) BoardItemSprite *source, *destination;
@property (nonatomic, retain) Status *status;
-(id) initWithBoardItemSprite:(BoardItemSprite*) boardItem andStatus:(Status*) _status;

-(CGSize) getBounds;


@end
