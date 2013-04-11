//
//  CardItem.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameObjectSprite.h"

@class CardModel, CardVO;
@interface CardItem : GameObjectSprite {
    CGPoint oldPosition;
    CardModel *model;
}
@property (nonatomic, retain) CardModel *model;
-(id) initWithCardVO:(CardVO*) cardVO;

@end
