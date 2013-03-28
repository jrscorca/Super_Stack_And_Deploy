//
//  UtilityFunctions.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//
//

#import "UtilityFunctions.h"

@implementation UtilityFunctions


+ (CGPoint)truncate:(CGPoint)vector toMax:(float)max {
	float magnitude = sqrt(pow(vector.x,2) + pow(vector.y,2));
	if (magnitude > max) {
		return CGPointMake((vector.x / (magnitude + .001)) * max, (vector.y / (magnitude + .001)) * max);
	}
	else {
		return vector;
	}
}

@end
