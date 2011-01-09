AOP in Objective-C

This is library written by Szilveszter Molnar that enables AOP like functionality for Objective-C. 
For a simple example check this:

- (void) addInterceptor:(NSInvocation *) i {
    NSLog(@"ADD intercepted.");
}

- (void) removeInterceptor:(NSInvocation *) i {
    NSLog(@"REMOVE END intercepted !");
}

- (void) testAOP {
 
    NSMutableArray* testArray = [[AOPProxy alloc] initWithNewInstanceOfClass:[NSMutableArray class]];
    
    [(AOPProxy*)testArray interceptMethodStartForSelector:@selector(addObject:)
                                    withInterceptorTarget:self
                                      interceptorSelector:@selector( addInterceptor: )];
    
    [(AOPProxy*)testArray interceptMethodEndForSelector:@selector(removeObjectAtIndex:)
                                  withInterceptorTarget:self
                                    interceptorSelector:@selector( removeInterceptor: )];
    
    [testArray addObject:[NSNumber numberWithInt:1]];
    
    [testArray removeObjectAtIndex:0];
    
    [testArray release];
    
    
}
