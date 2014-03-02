//
//  JWCCompletionTimeEstimator.m
//  Candor
//
//  Created by Will Chilcutt on 3/2/14.
//  Copyright (c) 2014 ChilcuttApps. All rights reserved.
//

#import "JWCCompletionTimeEstimator.h"

@interface JWCCompletionTimeEstimator ()
{
    CFTimeInterval startTime;
}
@end

@implementation JWCCompletionTimeEstimator

-(NSTimeInterval)getAmountOfTimeLeftUntilCompletionWithProgress:(float)progress
{
    //Setup start time
    if (startTime == 0)
    {
        startTime = CACurrentMediaTime();
    }
    
    NSTimeInterval currentTime = CACurrentMediaTime();
    
    NSTimeInterval timeSinceStart = startTime - currentTime;
    
    float howManyTimesCurrentProgressGoesIntoTotalProgress = 100.0 / progress;
    
    NSTimeInterval estimatedTotalTimeUntilCompletion = timeSinceStart * howManyTimesCurrentProgressGoesIntoTotalProgress;
    
    estimatedTotalTimeUntilCompletion = estimatedTotalTimeUntilCompletion / (100.0 - progress);
    
    NSTimeInterval timeLeftUntilCompletion = timeSinceStart - estimatedTotalTimeUntilCompletion;
    
    return timeLeftUntilCompletion;
}

-(void)reset
{
    startTime = 0;
}

@end
