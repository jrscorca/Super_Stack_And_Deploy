//
//  GameObjectSprite.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "GameObjectSprite.h"


@implementation GameObjectSprite

@synthesize associationArrays, associationPointers;

-(id) initWithFile:(NSString*) filename{
    if(self = [super initWithFile:filename]){
        self.associationArrays = [NSMutableArray array];
        self.associationPointers = [NSMutableArray array];
    }
    return self;
}

-(void) dealloc{
    [associationArrays release];
    [associationPointers release];
    [super dealloc];
}

-(void) assignObjectToPointer:(GameObjectSprite**)pointer{
    *pointer = self;
    NSValue *pointerObject = [NSValue valueWithPointer:pointer];
    [associationPointers addObject:pointerObject];
}


-(void) removeObjectFromPointer:(GameObjectSprite**)pointer{
    NSValue *pointerObject = [NSValue valueWithPointer:pointer];
    [associationPointers removeObject:pointerObject];
    *pointer = nil;
}


-(void) addToArray:(NSMutableArray*) array{
    [array addObject:self];
    [self.associationArrays addObject:array];
}


-(void) removeFromArray:(NSMutableArray*) array{
    [array removeObject:self];
    [self.associationArrays removeObject:array];
}


-(void) destroyObject{
    while([self.associationArrays count] > 0){
        NSMutableArray *array = [self.associationArrays lastObject];
        [self removeFromArray:array];
    }
    while([self.associationPointers count] > 0){
        NSValue *pointerObject = [self.associationPointers lastObject];
        [self removeObjectFromPointer:[pointerObject pointerValue]];
        
    }
    [self.parent removeChild:self cleanup:NO];
    
}

@end
