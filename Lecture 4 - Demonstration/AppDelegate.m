//
//  AppDelegate.m
//  Lecture4-DemoA
//
//  Created by T. Andrew Binkowski on 10/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController_iPhone.h"
#import "GreenViewController_iPhone.h"
#import "MasterViewController_iPad.h"
#import "DetailViewController_iPad.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

/*******************************************************************************
 * @method          application:didFinishLaunchingWithOptions:
 * @abstract        <# Abstract #>
 * @description     <# Description #>
 ******************************************************************************/
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    // Check to make sure we're running on the iPad. 
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        // Home view has nested navigation controller
        HomeViewController_iPhone *hvc = [[[HomeViewController_iPhone alloc] init] autorelease];
        UINavigationController *navController = [[[UINavigationController alloc] initWithRootViewController:hvc] autorelease];
        
        // Green view is stand alone view controller
        GreenViewController_iPhone *gvc = [[[GreenViewController_iPhone alloc] init] autorelease];
        
        // Add view controllers to array
        NSArray *viewControllers = [NSArray arrayWithObjects:navController,gvc,nil];
        
        // Set up tab bar and add to window
        UITabBarController *tbc = [[UITabBarController alloc] init];
        [tbc setViewControllers:viewControllers];
        self.window.rootViewController = tbc;
        
    } else {
        
        MasterViewController_iPad *mvc = [[[MasterViewController_iPad alloc] init] autorelease];
        DetailViewController_iPad *dvc = [[[DetailViewController_iPad alloc] init] autorelease];
        
        mvc.delegate = dvc; // This allows the master view controller to send messages to the detail view controller
        
        // Set up a navigation controller for view controller
        UINavigationController *mController = [[[UINavigationController alloc] initWithRootViewController:mvc] autorelease];
        UINavigationController *dController = [[[UINavigationController alloc] initWithRootViewController:dvc] autorelease];
        
        UISplitViewController *svc= [[[UISplitViewController alloc] init] autorelease];
        svc.viewControllers = [NSArray arrayWithObjects:mController, dController, nil];
        svc.delegate = dvc; // This lets the split view controller send messages to the detail view controller when the device is rotated
        
        self.window.rootViewController = svc;
    }
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}
@end
