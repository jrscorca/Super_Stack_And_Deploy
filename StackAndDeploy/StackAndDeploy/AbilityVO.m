//
//  AbilityVO.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/12/13.
//
//

#import "AbilityVO.h"

@implementation AbilityVO
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
