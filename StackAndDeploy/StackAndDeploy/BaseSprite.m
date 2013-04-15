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

-(id)init{
    if(self = [super initWithFile:@"Icon.png"]){
        self.model = [[[BaseModel alloc] init] autorelease];
        healthLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", model.health] fontName:@"helvetica" fontSize:14];
        [self addChild:healthLabel];
        [self addToArray:MDM.bases];
        
    }
    return self;
}

-(void) update:(ccTime) dt{
    [super update:dt];
    [healthLabel setString:[NSString stringWithFormat:@"%d", model.health]];
    if (model.health <=0) {
        [MDM.gameObjectsToRemove addObject:self];
        self.remove = YES;
    }
}

@end
