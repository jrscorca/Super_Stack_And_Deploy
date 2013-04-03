//
//  BaseSprite.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/28/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "BaseSprite.h"
#import "BaseModel.h"
#import "MatchDataManager.h"

@implementation BaseSprite
@synthesize model;

-(id)init{
    if(self = [super initWithFile:@"Icon.png"]){
        model = [[[BaseModel alloc] init] autorelease];
        CCLabelTTF *label = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", model.health] fontName:@"helvetica" fontSize:14];
        [self addChild:label];
        [self addToArray:MDM.bases];
        
    }
    return self;
}

-(void) update:(ccTime) dt{
    
    
    
}

@end
