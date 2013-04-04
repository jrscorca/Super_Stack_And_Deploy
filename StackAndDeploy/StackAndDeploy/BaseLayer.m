//
//  BaseLayer.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/28/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "BaseLayer.h"
#import "BaseSprite.h"
#import "BaseModel.h"
#import "MatchDataManager.h"


@implementation BaseLayer

- (id)init{
    if ((self = [super init])) {

        BaseSprite *base = [[[BaseSprite alloc] init] autorelease];
        base.model.ownership = LOCAL_PLAYER;
        base.position = ccp(MDM.boardSize.width/4, MDM.boardSize.height/2);
        base.scale = 1.5;
        
        BaseSprite *base2 = [[[BaseSprite alloc] init] autorelease];
        base2.model.ownership = AWAY_PLAYER;
        base2.position = ccp((MDM.boardSize.width*.9), MDM.boardSize.height/2);
        base2.scale = 1.5;
        
        [self addChild:base];
        [self addChild:base2];
    }
    return self;
}

-(void) update:(ccTime) dt{
    for(BaseSprite* base in MDM.bases){
        [base update:dt];
    }
}

@end
