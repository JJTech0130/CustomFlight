#import <Foundation/Foundation.h>
#import <OSLog/OSLog.h>
#import <dispatch/dispatch.h>

// From AppStoreDaemon.tbd
@interface ASDTestFlightServiceExtension
@end

@interface TestFlightServiceExtension : ASDTestFlightServiceExtension
+ (id) sharedExtensionHandler;
- (void) didReceivePushToken:(id) pushToken reply:(id) reply;
- (void) didReceivePushMessages:(id) messages reply:(id) reply;
- (void) didReachTerminalPhaseWithBetaBundleID:(id) bundle terminalPhase:(id) phase error:(id) err reply:(id) reply;
- (void) reloadAppsFromServerWithReply:(id) reply;
- (void) invokeCommand:(id) cmd withArguments:(id) args reply:(id) reply;
- (void) serviceExtensionTimeWillExpire;
@end

@implementation TestFlightServiceExtension

- (void)didReachTerminalPhaseWithBetaBundleID:(id)bundle terminalPhase:(id)phase error:(id)err reply:(id)reply {
    os_log_with_type(OS_LOG_DEFAULT, OS_LOG_TYPE_ERROR, "something");

}

- (void)didReceivePushMessages:(id)messages reply:(id)reply {
    os_log_with_type(OS_LOG_DEFAULT, OS_LOG_TYPE_ERROR, "something");

}

- (void)didReceivePushToken:(id)pushToken reply:(id)reply {
    os_log_with_type(OS_LOG_DEFAULT, OS_LOG_TYPE_ERROR, "something");

}

- (void)invokeCommand:(id)cmd withArguments:(id)args reply:(id)reply {
    os_log_with_type(OS_LOG_DEFAULT, OS_LOG_TYPE_ERROR, "something");

}

- (void)reloadAppsFromServerWithReply:(id)reply {
    os_log_with_type(OS_LOG_DEFAULT, OS_LOG_TYPE_ERROR, "something");

}

- (void)serviceExtensionTimeWillExpire {
    os_log_with_type(OS_LOG_DEFAULT, OS_LOG_TYPE_ERROR, "something");

}

+ (id)sharedExtensionHandler {
    os_log_with_type(OS_LOG_DEFAULT, OS_LOG_TYPE_ERROR, "Hello, called sharedExtensionHandler");

    return nil;
}

@end

__attribute__((constructor)) static void init(void) {
    //while (1) {
    //    os_log_with_type(OS_LOG_DEFAULT, OS_LOG_TYPE_ERROR, "Hello, World!");
    //}
    os_log_with_type(OS_LOG_DEFAULT, OS_LOG_TYPE_ERROR, "Hello, called init");
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        while (true) {
            os_log_with_type(OS_LOG_DEFAULT, OS_LOG_TYPE_ERROR, "Hello, still alive");
            [NSThread sleepForTimeInterval:1.0f];
        }
    });
    os_log_with_type(OS_LOG_DEFAULT, OS_LOG_TYPE_ERROR, "Hello, returning from init");
}
