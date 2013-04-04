//
//  NodeSprite.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/28/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "NodeSprite.h"
#import "NodeModel.h"
#import "MatchDataManager.h"

@implementation NodeSprite
//@synthesize model;

-(id)init{
    if(self = [super initWithFile:@"Icon.png"]){
        self.model = [[[NodeModel alloc] init] autorelease];
        [self addToArray:MDM.nodes];
        
    }
    return self;
}

-(void) update:(ccTime) dt{
    
    
    
}

@end
