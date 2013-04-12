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
#import "AbilityVO.h"
#import "TargetShipAbility.h"
@implementation CardModel
@synthesize name, details, type, ability;

-(id) initWithCardVO:(CardVO*) cardVO{
    if(self = [super init]){
        name =  cardVO.name;
        details = cardVO.details;
        type = cardVO.type;
        Class abilityClass = NSClassFromString(cardVO.ability.className);
        id _ability = [[[abilityClass alloc] initWithAbilityVO:cardVO.ability] autorelease];
        self.ability = _ability;
    }
    return self;
}

-(void) dealloc{
    [super dealloc];
}
@end
