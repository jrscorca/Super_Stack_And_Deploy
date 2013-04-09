//
//  StatusVO.m
//  StackAndDeploy
//
//  Created by Joshua Scorca on 4/8/13.
//
//

#import "StatusVO.h"

@implementation StatusVO
@synthesize className, arguments;
-(id)initWithDictionary:(NSDictionary*)dic{
    if(self = [super init]){
        className = [dic objectForKey:@"className"];
        self.arguments = [dic objectForKey:@"arguments"];
    }
    return self;
}

-(void)dealloc{
    [arguments release];
    [super dealloc];
}

@end
