//
//  AppDelegate.m
//  DMMacUI
//
//  Created by lbq on 2018/6/11.
//  Copyright © 2018年 lbq. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (NSWindow *)window
{
    NSStoryboard *sb = [NSStoryboard mainStoryboard];
    NSWindowController *windowController = [sb instantiateInitialController];
    return windowController.window;
}

@end
