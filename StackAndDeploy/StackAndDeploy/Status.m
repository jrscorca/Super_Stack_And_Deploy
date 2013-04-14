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
#import "MatchDataManager.h"
#import "PlayLayer.h"
#import "BoardLayer.h"


@implementation Status
@synthesize target;

-(id)initWithStatusVO:(StatusVO*)statusVO{
    if(self = [super init]){
        hasBeenApplied = NO;
        targetPoint = CGPointZero;
    }
    return self;
}

-(void) addStatusToGameObject:(BoardItemSprite*)gameObject{
    [gameObject assignObjectToPointer:&target];
    [gameObject.model.statuses addObject:self];
    if([self checkStart]){
        [self applyStatus];
    }
}

-(void) addStatusToGameBoard:(CGPoint)point{
    [MDM.playLayer.boardLayer.statuses addObject:self];
    targetPoint = point;
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
    //TODO: remove statuses from their arrays when they are finished
    //give statuses a "remove" property
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
