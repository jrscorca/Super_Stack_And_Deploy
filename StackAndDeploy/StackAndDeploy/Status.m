//
//  Status.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/3/13.
//
//

#import "Status.h"
#import "BoardItemModel.h"
#import "BoardItemSprite.h"
#import "StatusVO.h"
@implementation Status
@synthesize target;

-(id)initWithTarget:(BoardItemSprite *)_target andStatusVO:(StatusVO*)statusVO{
    if(self = [super init]){
        target = _target;
        hasBeenApplied = NO;
    }
    return self;
}

-(void) addStatusToGameObject:(BoardItemSprite*)gameObject{
    [gameObject.model.statuses addObject:self];
    if([self checkStart]){
        [self applyStatus];
    }
}

-(BOOL) checkStart{
    return YES;
}

-(void) applyStatus{
    hasBeenApplied = YES;
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
