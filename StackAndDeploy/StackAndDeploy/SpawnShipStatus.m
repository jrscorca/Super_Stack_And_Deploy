//
//  SpawnShipStatus.m
//  StackAndDeploy
//
//  Created by Joshua Scorca on 4/12/13.
//
//

#import "SpawnShipStatus.h"
#import "BoardItemModel.h"
#import "BoardItemSprite.h"
#import "StatusVO.h"

@implementation SpawnShipStatus
-(id)initWithTarget:(BoardItemSprite *)_target andStatusVO:(StatusVO*)statusVO{
    if(self = [super initWithTarget:_target andStatusVO:statusVO]){
        //healthOffset = [[statusVO.arguments objectForKey:@"healthOffset"] intValue];
        hasBeenApplied = NO;
    }
    return self;
}



-(BOOL) checkStart{
    return YES;
}

-(void) applyStatus{
    hasBeenApplied = YES;
    //target.model.health += healthOffset;
    //[target.model.statuses removeObject:self];
    
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
