//
//  AppDelegate.m
//  EvernoteSDKSample
//
//  Created by Ben Zotto on 4/24/14.
//  Copyright (c) 2014 n/a. All rights reserved.
//

#import "AppDelegate.h"
#import <ENSDK/ENSDK.h>
#import "MainViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    // Set shared session key information.
    [ENSession setSharedSessionConsumerKey:@"zelenkini"
                            consumerSecret:@"2d11cdeb94bc8e25"
                              optionalHost:ENSessionHostSandbox];
    
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:
                   [[UIScreen mainScreen] bounds]];

    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:[[MainViewController alloc] init]];
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];

    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [[ENSession sharedSession] handleOpenURL:url];
}

@end
