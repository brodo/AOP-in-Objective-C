//
//  AOPInterceptorInfo.h
//  InnoliFoundation
//
//  Created by Szilveszter Molnar on 1/7/11.
//  Copyright 2011 Innoli Kft. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AOPInterceptorInfo : NSObject {

@private
    SEL interceptedSelector;
    id interceptorTarget;
    SEL interceptorSelector;
}

@property (assign, nonatomic) SEL interceptedSelector;
@property (assign, nonatomic) SEL interceptorSelector;
@property (assign, nonatomic) id interceptorTarget;

@end

