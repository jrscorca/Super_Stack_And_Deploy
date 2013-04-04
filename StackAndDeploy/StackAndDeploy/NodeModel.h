//
//  NodeModel.h
//  StackAndDeploy
//
//  Created by Joshua Scorca on 4/2/13.
//
//

#import <Foundation/Foundation.h>
#import "BoardItemModel.h"

@interface NodeModel : BoardItemModel{
    float maxResources;
    float resourcesLeft;
    float capturePercentage;
    
}

@property (nonatomic) float maxResources, resourcesLeft, capturePercentage;

@end
