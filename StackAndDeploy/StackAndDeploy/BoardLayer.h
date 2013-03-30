//
//  BoardLayer.h
//  StackAndDeploy
//
//  Created by Joshua Scorca on 3/27/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class ShipLayer, BaseLayer, NodeLayer;
@interface BoardLayer : CCLayer {
    ShipLayer *shipLayer;
    BaseLayer *baseLayer;
    NodeLayer *nodeLayer;
    
    
    //user movement around the map
    CGPoint previousTouchPoint;
    
    CGPoint cameraVelocity;
    
}

@property (nonatomic, assign) ShipLayer *shipLayer;
@property (nonatomic, assign) BaseLayer *baseLayer;
@property (nonatomic, assign) NodeLayer *nodeLayer;

-(void) update:(ccTime)dt;

@end
