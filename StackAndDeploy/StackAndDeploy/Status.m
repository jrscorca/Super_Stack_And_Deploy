//
//  Status.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/3/13.
//
//

#import "Status.h"
#import "BoardItemModel.h"

@implementation Status

-(id)init{
    if(self = [super init]){

        hasBeenApplied = NO;
    }
    return self;
}

-(void) addStatusToGameObject:(BoardItemModel*)gameObject{
    [gameObject.statuses addObject:self];
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
        [target.statuses removeObject:self];
    }
    
}

-(void) reccuringEffect:(ccTime) dt{
    
}


@end
