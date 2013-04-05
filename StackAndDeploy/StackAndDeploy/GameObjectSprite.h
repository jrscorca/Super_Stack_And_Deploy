//
//  GameObjectSprite.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface GameObjectSprite : CCSprite {
    
    NSMutableArray *associationArrays;
    NSMutableArray *associationPointers;
    BOOL remove;
    
}
@property (nonatomic, assign) BOOL remove;
@property (nonatomic, retain) NSMutableArray *associationArrays, *associationPointers;



//call to assign object to a pointer
-(void) assignObjectToPointer:(GameObjectSprite**)pointer;


//call to remove object from pointer
-(void) removeObjectFromPointer:(GameObjectSprite**)pointer;


//adds object to array and keeps track of array that object is associate with
-(void) addToArray:(NSMutableArray*) array;

//removes object from array if it exists in it
-(void) removeFromArray:(NSMutableArray*) array;

//destroys object, removes object from all arrays associated with and removes from parent layer;
-(void) destroyObject;

-(void) addToGameObjectSpriteArray;

-(void) removeFromGameObjectSpriteArray;

-(void) update:(ccTime) dt;

@end
