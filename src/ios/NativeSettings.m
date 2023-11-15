//
//  NativeSettings.m
//  NativeSettings
//
//  Created by ahmadnsour on 16.11.2023.
//
//

#import "NativeSettings.h"

@implementation NativeSettings

- (void)open:(CDVInvokedUrlCommand*)command
{
        NSURL *appSettings = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [[UIApplication sharedApplication] openURL:appSettings];
}

@end
