//
//  AppDelegate.m
//  BluemixTrivia
//
//  Created by Avi Eshel on 3/3/15.
//  Copyright (c) 2015 Avi Eshel. All rights reserved.
//

#import "AppDelegate.h"
#import <IMFCore/IMFCore.h>
#import "IMFGoogleAuthenticationHandler.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Initialize the IMFCore SDK
    NSString *appId = @"6a7dc196-1224-4a3a-99f4-99c6f4c78224";
    NSString *appRoute = @"https://trivia.stage1.mybluemix.net";
    
    // initialize SDK with IBM Bluemix application ID and route
    IMFClient  *imfClient = [IMFClient sharedInstance];
    [imfClient initializeWithBackendRoute:appRoute backendGUID:appId];
    
    // initialize an instance of the IMFDataManager
    //IMFDataManager *manager = [IMFDataManager sharedInstance];
    
    // Creating a local data store
    NSError *error;
    CDTStore *store = [[IMFDataManager sharedInstance] localStore:@"localTrivia" error: &error];
    
    
    // Creating a remote data store
    [[IMFDataManager sharedInstance] remoteStore:@"Trivia" completionHandler:^(CDTStore *store, NSError *error) {
        // Remote store will be passed into the control handler if no errors occurred.
        CDTStore *remoteStore = store;
    }];
    
    // Register a default delegate.
    // Logs in to Google with read permissions to the user's public profile.
    [[IMFGoogleAuthenticationHandler sharedInstance] registerWithDefaultDelegate];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
