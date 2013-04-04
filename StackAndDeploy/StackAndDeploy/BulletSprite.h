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
    BoardItemSprite *target;
    Status *status;
}

-(id) initWithBoardItemSprite:(BoardItemSprite*) boardItem andStatus:(Status*) status;

-(CGSize) getBounds;


@end
