//
//  PlayerClass.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Library.h"

@class CardItem, Library;
@interface PlayerClass : NSObject {
    float resources;
    int techPoints;
    BOOL isLocalPlayer;
    //draw card counter
    float drawCardCounter;
    // nodes owned
    // ships owned
    // structures owned
    // player statuses
}

@property (nonatomic, retain) Library *library;
@property (nonatomic) float resources;
-(void) drawCardFromDeck;
-(void) update:(ccTime) dt;

@end
