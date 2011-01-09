//
//  AOPLibTest.m
//  AOPLib
//
//  Created by Szilveszter Molnar on 1/9/11.
//  Copyright 2011 Innoli Kft. All rights reserved.
//

#import "AOPLibTest.h"
#import "AOPProxy.h"

@implementation AOPLibTest

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

@end
