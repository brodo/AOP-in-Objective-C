//
//  AOPThreadInvoker.h
//  InnoliFoundation
//
//  Created by Szilveszter Molnar on 1/7/11.
//  Copyright 2011 Innoli Kft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AOPProxy.h"

@interface AOPThreadInvoker : AOPProxy {

@private
    NSThread *serializerThread;
}

- (id) initWithInstance:(id)anObject thread:(NSThread *)aThread;

@end

