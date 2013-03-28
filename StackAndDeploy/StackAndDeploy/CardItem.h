//
//  CardItem.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class CardVO;
@interface CardItem : CCSprite {
    int cost;
    int techReq;
    
    NSString *name;
    NSString *details;
    CGPoint oldPosition;
}

@property (nonatomic) int cost, techReq;
@property (nonatomic, retain) NSString* name, *details;

-(id) initWithCardVO:(CardVO*) cardVO;

@end
