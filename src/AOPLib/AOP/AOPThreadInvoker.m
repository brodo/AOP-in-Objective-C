//
//  AOPThreadInvoker.m
//  InnoliFoundation
//
//  Created by Szilveszter Molnar on 1/7/11.
//  Copyright 2011 Innoli Kft. All rights reserved.
//

#import "AOPThreadInvoker.h"

@implementation AOPThreadInvoker

- (id) initWithInstance:(id)anObject thread:(NSThread *)aThread {

    if ( self = [super initWithInstance:anObject] ) {
        serializerThread = [aThread retain];
    }

    return self;
}

- (void) invokeOriginalMethod:(NSInvocation *)anInvocation {
    [anInvocation performSelector:@selector(invoke)
                         onThread:serializerThread
                       withObject:nil
                    waitUntilDone:YES];
}

- (void) dealloc {
    [serializerThread release];

    [super dealloc];
}

@end

