//
//  HealthOffsetStatus.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/3/13.
//
//

#import "HealthOffsetStatus.h"
#import "BoardItemModel.h"
#import "BoardItemSprite.h"

@implementation HealthOffsetStatus

-(id)initWithTarget:(BoardItemSprite *)_target{
    if(self = [super initWithTarget:_target]){
        healthOffset = -10;
        hasBeenApplied = NO;
    }
    return self;
}



-(BOOL) checkStart{
    return YES;
}

-(void) applyStatus{
    hasBeenApplied = YES;
    target.model.health -= healthOffset;
    [target.model.statuses removeObject:self];
    
}

-(void) revertStatus{
}


-(BOOL) checkEnd{
    return NO;
}

-(void) updateStatus:(ccTime) dt{
    if([self checkStart] && !hasBeenApplied){
        [self applyStatus];
    }
    
    if(hasBeenApplied){
        [self reccuringEffect:dt];
    }
    
    if( [self checkEnd]){
        [self revertStatus];
        [target.model.statuses removeObject:self];
    }
    
}

-(void) reccuringEffect:(ccTime) dt{
    
}

@end
