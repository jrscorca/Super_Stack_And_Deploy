//
//  NodeSprite.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/28/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "BoardItemSprite.h"

@class NodeModel, Ownership;
@interface NodeSprite : BoardItemSprite {
   // NodeModel *model;
    BOOL isSelected;
}


@property (nonatomic) BOOL isSelected;

-(void) playerCaptureNode:(Ownership*) owner;

@end
