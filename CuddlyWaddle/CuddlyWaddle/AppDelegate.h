//
//  AppDelegate.h
//  CuddlyWaddle
//
//  Created by yangboz on 16/6/28.
//  Copyright __MyCompanyName__ 2016年. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
