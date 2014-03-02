JWCCompletionTimeEstimator
==========================
JWC(Pronounced "Juicy")CompletionTimeEstimator helps you tell your users an estimated time until their file will be completed. Simply pass in your progress variable as a float and `JWCCompletionTimeEstimator` will pass back a NSTimeInterval object that you can [do some math with](http://stackoverflow.com/a/15304826/1301654) to determine your completion time.

Example:

```Objective-C

-(id)init
{
  self = [super init];
  
  if (self != nil)
  {
    //Setup code
    
    myCompletionTimeEstimator = [[JWCCompletionTimeEstimator alloc] init];
  }
  
  return self;
}

-(void)delegateCallThatGivesUsProgress:(float)progress
{
  NSTimeInterval estimatedCompletionTime = [myCompletionTimeEstimator getAmountOfTimeLeftUntilCompletionWithProgress:progress];
  
  long seconds = lroundf(estimatedCompletionTime); // Modulo (%) operator below needs int or long
    
  int hour = seconds / 3600;
  int mins = (seconds % 3600) / 60;
  int secs = seconds % 60;
    
  NSLog(@"We will be done in %d hours, %d mins, %d seconds!", hour, mins,secs);
}


```

Tips:

- Make sure to keep a hold of your JWCCompletionTimeEstimator object as it needs to compare the current time with the initial time that the progress began!
- If you want to reset your object, just use the `-(void)reset;` method!

I hope this helps you! Please feel free to help make my code better by adding issues. Also, feel free to [contact me](https://twitter.com/willchilcutt). Thanks!
