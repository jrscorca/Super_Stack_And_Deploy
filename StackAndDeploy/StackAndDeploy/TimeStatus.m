//
//  TimeStatus.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/3/13.
//
//

#import "TimeStatus.h"
#import "GameObjectSprite.h"
#import "BoardItemModel.h"

@implementation TimeStatus
-(id)initWithTarget:(BoardItemSprite *)_target{
    if(self = [super initWithTarget:_target]){
        delay = 0;
        timeAlive = 0;
        duration = 0;
    }
    return self;
}


-(BOOL) checkStart{
    if(delay == 0){
        return YES;
    }
    return NO;
}



-(BOOL) checkEnd{
    if(timeAlive > duration){
        return YES;
    }
    return NO;
}

-(void) updateStatus:(ccTime) dt{
    timeAlive += dt;
    [super updateStatus:dt];
}

-(void) reccuringEffect:(ccTime) dt{
    
}



@end
