//
//  Constants.h
//  StackAndDeploy
//
//  Created by Joshua Scorca on 3/27/13.
//
//

#import "Constants_Notifications.h"


//macros
typedef NSMutableArray GameObjectSpriteArray;
#define MDM [MatchDataManager sharedInstance]



#define PAN_VELOCITY_SPEED 3.2
#define PAN_VELOCITY_FRICTION .89
#define PAN_VELOCITY_MAX 500.0
#define PAN_VELOCITY_MIN 1.7



#define BOARD_SIZE   CGSizeMake(1000,1000)
#define MINIMAP_RECT CGRectMake(0,0,100,100)


typedef enum CardTypes
{
	UTILITY 	= 0,
    SHIP 	= 1
}cardType;

typedef enum Players
{
	NO_PLAYER 	= 0,
    AWAY_PLAYER 	= 1,
    LOCAL_PLAYER 	= 2,
    ALL_PlAYERS = 3
}playerType;