//
//  CardVO.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//
//

#import "CardVO.h"
#import "StatusVO.h"
#import "AbilityVO.h"

@implementation CardVO
@synthesize type, name, details, ability;

-(id)initWithDictionary:(NSDictionary*)dic{
    if(self = [super init]){
        name = [dic objectForKey:@"name"];
        details = [dic objectForKey:@"details"];
        ability = [[AbilityVO alloc] initWithDictionary:[dic objectForKey:@"ability"]];
        type = [[dic objectForKey:@"type"] intValue];
    }
    return self;
}

-(void)dealloc{
    [ability release];
    [super dealloc];
}

@end
