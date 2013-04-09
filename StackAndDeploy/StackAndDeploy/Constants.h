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



#define PAN_VELOCITY_SPEED 6.8
#define PAN_VELOCITY_FRICTION .70
#define PAN_VELOCITY_MAX 2000.0
#define PAN_VELOCITY_MIN 0.3

#define OVERLAY_HEIGHT 100



#define INITIAL_HAND_SIZE 5
#define BOARD_SIZE   CGSizeMake(1000,1000)
#define MINIMAP_RECT CGRectMake(5,5,105,105)
#define ABILITY_RECT CGRectMake(380, 0, 100, 100)

#define BULLET_LIFETIME 0.3

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

typedef enum PlayerNumbers
{
    PLAYER_ONE = 1,
    PLAYER_TWO = 2
}playerNumber;

typedef enum BoardItemTypes
{
    LOCAL_SHIP = 0,
    AWAY_SHIP = 1,
    AWAY_RESOURCE_NODE = 2,
    AWAY_TECH_NODE = 3,
    LOCAL_TECH_NODE = 4,
    LOCAL_RESOURCE_NODE = 5
}boardItemType;

typedef enum Steering
{
    SEEK = 0,
    MOVETO = 1
}steeringType;
