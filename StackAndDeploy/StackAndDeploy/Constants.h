//
//  Constants.h
//  StackAndDeploy
//
//  Created by Joshua Scorca on 3/27/13.
//
//

#import "Constants_Notifications.h"


//macros
typedef NSMutableArray GameObjectArray;
#define MDM [MatchDataManager sharedInstance]


#define PAN_VELOCITY_SPEED 2.9
#define PAN_VELOCITY_FRICTION .001
#define PAN_VELOCITY_MAX 400.0
#define PAN_VELOCITY_MIN .23


typedef enum CardTypes
{
	UTILITY 	= 0,
    SHIP 	= 1
}cardType;