//
//  NodeModel.m
//  StackAndDeploy
//
//  Created by Joshua Scorca on 4/2/13.
//
//

#import "NodeModel.h"

@implementation NodeModel

@synthesize maxResources, resourcesLeft, capturePercentage;

-(id) init{
    if(self = [super init]){
        maxResources = 200;
        resourcesLeft = maxResources;
        capturePercentage = 0;
    }
    return self;
}

@end
