//
//  CardModel.m
//  StackAndDeploy
//
//  Created by Joshua Scorca on 4/11/13.
//
//

#import "CardModel.h"
#import "CardVO.h"
#import "StatusVO.h"
#import "Status.h"
@implementation CardModel
@synthesize name, details, type, statuses;

-(id) initWithCardVO:(CardVO*) cardVO{
    name =  cardVO.name;
    details = cardVO.details;
    type = cardVO.type;
    if(self = [super init]){
        self.statuses = [[[NSMutableArray alloc] init] autorelease];
        for(StatusVO *status in cardVO.statuses){
            Class statusClass = NSClassFromString(status.className);
            id stat = [[[statusClass alloc] initWithTarget:nil andStatusVO:status] autorelease];
            [self.statuses addObject:stat];
        }

    }
    return self;
}

-(void) dealloc{
    [statuses release];
    [super dealloc];
}
@end
