//
//  JWCCompletionTimeEstimator.h
//  Candor
//
//  Created by Will Chilcutt on 3/2/14.
//  Copyright (c) 2014 ChilcuttApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JWCCompletionTimeEstimator : NSObject

-(NSTimeInterval)getAmountOfTimeLeftUntilCompletionWithProgress:(float)progress;
-(void)reset;

@end
