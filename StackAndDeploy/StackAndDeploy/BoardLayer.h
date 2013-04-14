//
//  BoardLayer.h
//  StackAndDeploy
//
//  Created by Joshua Scorca on 3/27/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class ShipLayer, BaseLayer, NodeLayer, BulletLayer;
@interface BoardLayer : CCLayer {
    ShipLayer *shipLayer;
    BaseLayer *baseLayer;
    NodeLayer *nodeLayer;
    BulletLayer *bulletLayer;
    
    NSMutableArray *statuses;
    
}


@property (nonatomic, retain) NSMutableArray *statuses;
@property (nonatomic, assign) ShipLayer *shipLayer;
@property (nonatomic, assign) BaseLayer *baseLayer;
@property (nonatomic, assign) NodeLayer *nodeLayer;
@property (nonatomic, assign) BulletLayer *bulletLayer;

-(void) update:(ccTime)dt;

@end
