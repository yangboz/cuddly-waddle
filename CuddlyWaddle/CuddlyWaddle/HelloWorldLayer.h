//
//  HelloWorldLayer.h
//  CuddlyWaddle
//
//  Created by yangboz on 16/6/28.
//  Copyright __MyCompanyName__ 2016年. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import <CoreMotion/CoreMotion.h>
#import <CoreFoundation/CoreFoundation.h>

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
    CMMotionManager *motionManager;
    CCLabelTTF *yawLabel;
    CCLabelTTF *posIn360Label;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
@property(nonatomic,retain)CMMotionManager *motionManager;

@end
