//
//  Ability.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/4/13.
//
//

#import "Ability.h"

@implementation Ability

@synthesize selectedCommandImage, normalCommandImage, disabledCommandImage;

-(id) init{
    if(self = [super init]){
        self.selectedCommandImage = @"Command_Pressed.png";
        self.normalCommandImage = @"Command.png";
        self.disabledCommandImage = @"Command_Pressed.png";
    }
    return self;
}

-(void)dealloc{
    [selectedCommandImage release];
    [normalCommandImage release];
    [disabledCommandImage release];
    [super dealloc];
}

-(void) activateAbility:(UIState*) state{
    
}

//targets objects to use ability on
-(void) targetObject:(BoardLayer*) boardLayer withTouch:(UITouch*) touch{
    
}

// checks whether the ability can be used
-(BOOL) isAbilityReady{
    return YES;
}

//does what the ability should do
-(void) useAbility{
    
}


@end
