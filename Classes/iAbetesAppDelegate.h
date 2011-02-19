//
//  iAbetesAppDelegate.h
//  iAbetes
//
//  Created by chris nielubowicz on 2/18/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iAbetesViewController;

@interface iAbetesAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    iAbetesViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet iAbetesViewController *viewController;

@end

