

#import <Foundation/Foundation.h>
#import "RCTBridgeModule.h"

@interface RCT_EXTERN_MODULE(ReactViewManager, NSObject)

RCT_EXTERN_METHOD(dismissPresentedViewController:(nonnull NSNumber *)reactTag)


RCT_EXTERN_METHOD(save:(nonnull NSNumber *)reactTag input:(NSString *)input)

@end
