//
//  HUDLayer.h
//  StackAndDeploy
//
//  Created by Joshua Scorca on 3/27/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class HandLayer, MiniMapLayer, DetailsLayer, CommandLayer;
@interface HUDLayer : CCLayer {
    HandLayer *handLayer;
    MiniMapLayer *miniMapLayer;
    DetailsLayer *detailsLayer;
    CommandLayer *commandLayer;
    
    CCLabelTTF *resourceLabel;
}
@property (nonatomic, assign) HandLayer *handLayer;
@property (nonatomic, assign) MiniMapLayer *miniMapLayer;
@property (nonatomic, assign) DetailsLayer *detailsLayer;
@property (nonatomic, assign) CommandLayer *commandLayer;

-(void) update:(ccTime)dt;

@end
