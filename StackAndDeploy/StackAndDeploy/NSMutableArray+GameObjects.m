//
//  NSMutableArray+GameObjects.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/30/13.
//
//

#import "NSMutableArray+GameObjects.h"
#import "GameObject.h"

@implementation NSMutableArray (GameObjects)

-(void) destroyObjectsInArray{
    while([self count] > 0){
        GameObject *object = [self lastObject];
        [object destroyObject];
    }
}

-(void) destroyArray{
    while([self count] > 0){
        GameObject *object = [self lastObject];
        [object removeFromArray:self];
    }
    [self release];
}


@end