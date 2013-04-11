//
//  ShipModel.h
//  StackAndDeploy
//
//  Created by Joshua Scorca on 4/2/13.
//
//

#import <Foundation/Foundation.h>
#import "BoardItemModel.h"
@class ShipVO;
@interface ShipModel : BoardItemModel{
    NSMutableArray *abilityArray;

}

@property (nonatomic, retain) NSMutableArray *abilityArray;

-(id) initWithShipVO:(ShipVO*)shipVO;

@end
