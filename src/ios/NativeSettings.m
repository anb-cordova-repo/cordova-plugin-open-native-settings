#import "NativeSettings.h"

@implementation NativeSettings

- (void)open:(CDVInvokedUrlCommand*)command
{
    NSURL *appSettings = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    UIApplication *application = [UIApplication sharedApplication];

    if (@available(iOS 10.0, *)) {
        [application openURL:appSettings options:@{} completionHandler:^(BOOL success) {
            CDVPluginResult *pluginResult;
            if (success) {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
            } else {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Failed to open settings."];
            }
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }];
    } else {
        BOOL success = [application openURL:appSettings];
        CDVPluginResult *pluginResult;
        if (success) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Failed to open settings."];
        }
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

@end
