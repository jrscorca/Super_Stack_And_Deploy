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
#import "PlayerClass.h"
#import "Ownership.h"

@implementation NodeSprite

@synthesize isSelected;

-(id)init{
    if(self = [super initWithFile:@"Icon.png"]){
        self.model = [[[NodeModel alloc] init] autorelease];
        [self addToArray:MDM.nodes];
        
    }
    return self;
}

-(void) update:(ccTime) dt{
    [super update:dt];
    PlayerClass *player = [MDM getPlayer:self.model.ownership.playerType];
    if(((NodeModel*)self.model).resourcesLeft > 0 && player != nil){
        player.resources += 10*dt;
        ((NodeModel*)self.model).resourcesLeft -= 10*dt;
    }
}


-(void) playerCaptureNode:(Ownership*) owner{
    Ownership *newOwner = [[[Ownership alloc] initWithOwner:owner] autorelease];
    self.model.ownership = newOwner;
    self.color = ccBLUE;
}

@end
