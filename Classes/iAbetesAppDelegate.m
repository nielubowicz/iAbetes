//
//  iAbetesAppDelegate.m
//  iAbetes
//
//  Created by chris nielubowicz on 2/18/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "iAbetesAppDelegate.h"
#import "iAbetesViewController.h"

@implementation iAbetesAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
