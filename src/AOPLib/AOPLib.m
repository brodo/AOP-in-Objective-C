
#import <Foundation/Foundation.h>
#import "AOPLibTest.h"

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    AOPLibTest* test = [[AOPLibTest alloc] init];
    
    [test testAOP];
    
    [test release];
    
    [pool drain];
    return 0;
}
