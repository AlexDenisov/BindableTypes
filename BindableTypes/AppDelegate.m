//
//  AppDelegate.m
//  BindableTypes
//
//  Created by Alex Denisov on 04.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
- (void)initTabBar;
@end

const char *const kControllers[] = {"BindableTextField", "BindableTextView"};
const char *const kTabBarItems[] = {"TextField", "TextView"};
const int kControllersCount = 2;

@implementation AppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;

- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    [self initTabBar ];
    
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)initTabBar {
    NSMutableArray *controllers = [NSMutableArray new];
    
    for(int i=0;i<kControllersCount;i++){
        NSString *className = [NSString stringWithFormat:@"%sViewController", kControllers[i]];
        Class ViewControllerClass = NSClassFromString(className);
        UIViewController *controller = [[ViewControllerClass alloc] init];
        [controller.tabBarItem setTitle:[NSString stringWithUTF8String:kTabBarItems[i]]];
        [controllers addObject:controller];
        [controller release];
    }
    
    self.tabBarController = [[[UITabBarController alloc] init] autorelease];
    self.tabBarController.viewControllers = controllers;
    [controllers release];
}

@end
