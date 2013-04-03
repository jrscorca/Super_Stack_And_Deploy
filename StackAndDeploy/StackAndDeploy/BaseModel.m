//
//  BaseModel.m
//  StackAndDeploy
//
//  Created by Joshua Scorca on 4/2/13.
//
//

#import "BaseModel.h"

@implementation BaseModel

-(id)init{
    if(self = [super init]){
        health = 100;
        speed = 0;
        ignoreCount = 1;
    }
    return self;
}

@end
