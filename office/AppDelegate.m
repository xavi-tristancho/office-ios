//
//  AppDelegate.m
//  office
//
//  Created by Xavier Tristancho Bordoy on 21/11/15.
//  Copyright © 2015 Xavier Tristancho Bordoy. All rights reserved.
//

#import "AppDelegate.h"
#import "OFRootViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[OFRootViewController alloc] init];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
