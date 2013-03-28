//
//  ShipLayer.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//
//

#import "ShipLayer.h"
#import "Ship.h"
#import "CardItem.h"
#import "CardVO.h"

@implementation ShipLayer

@synthesize shipsArray;

-(id) init{
    if(self = [super init]){
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cardPlayed:) name:kCardPlayed object:nil];

        self.shipsArray = [NSMutableArray array];
        
<<<<<<< HEAD
=======
        //test purposes
        Ship *ship = [[[Ship alloc] initWithShipVO:nil] autorelease];
        ship.position = ccp(90, 90);
        [self addChild:ship];
        [shipsArray addObject:ship];
        isTouchEnabled_ = YES;
>>>>>>> aaa
    }
    return self;
}

-(void) dealloc{
    [shipsArray release];
    [super dealloc];
}

-(void) registerWithTouchDispatcher
{
    [[CCDirector sharedDirector].touchDispatcher addTargetedDelegate:self priority:0 swallowsTouches:NO];
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    
    CGPoint touchPoint = [self convertTouchToNodeSpace: touch];
    for (Ship *ship in shipsArray){
        if (CGRectContainsPoint(ship.boundingBox, touchPoint)) {
            ship.isSelected = YES;
            selectedShip = ship;
            break;
        }
    }
    return YES;
}

-(void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event{
    if(selectedShip) selectedShip.objective = [self convertTouchToNodeSpace: touch];
    
}
- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    if(selectedShip){
        selectedShip.isSelected = NO;
    }
    selectedShip = nil;
}

- (void) ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event{
    if(selectedShip){
        selectedShip.isSelected = NO;
    }
    selectedShip = nil;
}

-(void) update:(ccTime) dt{
    for(Ship *ship in self.shipsArray){
        [ship update:dt];
    }
}

-(void)cardPlayed:(NSNotification*)notification{
    CardItem *card = notification.object;
    if (card.cardVO.type == SHIP) {
        Ship *ship = [[[Ship alloc] initWithShipVO:nil] autorelease];
        ship.position = ccp(90, 90);
        [self addChild:ship];
        [shipsArray addObject:ship];

    }
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kCardPlayed object:nil];
    [super dealloc];
}



@end
