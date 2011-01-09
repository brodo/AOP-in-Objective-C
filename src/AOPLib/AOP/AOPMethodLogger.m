//
//  AOPMethodLogger.m
//  InnoliFoundation
//
//  Created by Szilveszter Molnar on 1/7/11.
//  Copyright 2011 Innoli Kft. All rights reserved.
//

#import "AOPMethodLogger.h"

@implementation AOPMethodLogger

- (void) invokeOriginalMethod:(NSInvocation *)anInvocation {
    SEL aSelector = [anInvocation selector];

    NSLog( @"Method START: %@", NSStringFromSelector(aSelector) );

    [super invokeOriginalMethod:anInvocation];

    NSLog( @"Method END: %@", NSStringFromSelector(aSelector) );
}

@end

