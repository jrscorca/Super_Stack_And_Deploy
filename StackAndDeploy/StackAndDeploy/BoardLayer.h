//
//  BoardLayer.h
//  StackAndDeploy
//
//  Created by Joshua Scorca on 3/27/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class ShipLayer;
@interface BoardLayer : CCLayer {
    ShipLayer *shipLayer;
    
}

@property (nonatomic, assign) ShipLayer *shipLayer;

-(void) update:(ccTime)dt;

@end
