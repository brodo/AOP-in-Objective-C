AOP in Objective-C

This library enables functionality similar to AOP (Aspect Oriented Programming) for Objective-C. 
Proxy classes can be created (by wrapping the original instances in an instance of AOPProxy) that
enable intercepting the beginning and the end of method invocations.
It also provides two other classes AOPMethodLogger and AOPThreadInvoker - AOPMethodLogger will log
automatically all method invocations for an object, and AOPThreadInvoker will make sure that no
matter what thread is used to invoke the methods on your object they will always be executed on
a specified thread.

If you use this library I would be happy to hear about it :) – so please drop a mail to Szilveszter Molnar ( moszi@innoli.com ).

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
    THANK YOU
    
    [testArray removeObjectAtIndex:0];
    
    [testArray release];
    
    
}
