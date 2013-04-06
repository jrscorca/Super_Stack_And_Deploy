//
//  HealthOffsetStatus.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/3/13.
//
//

#import "Status.h"

@interface HealthOffsetStatus : Status{
    int healthOffset;
}

-(id)initWithTarget:(BoardItemSprite *)_target andOffset:(int)offset;

@end
