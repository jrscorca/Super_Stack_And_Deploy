//
//  BoardItemModel.m
//  StackAndDeploy
//
//  Created by Joshua Scorca on 4/2/13.
//
//

#import "BoardItemModel.h"

@implementation BoardItemModel
@synthesize health, healthBuffer, ignoreCount, statuses, speed, speedBuffer, ownership;
-(id)init{
    if(self = [super init]){
        self.statuses = [[[NSMutableArray alloc] init] autorelease];
    }
    return self;
}

-(void)dealloc{
    [statuses release];
    [super dealloc];
}

@end
