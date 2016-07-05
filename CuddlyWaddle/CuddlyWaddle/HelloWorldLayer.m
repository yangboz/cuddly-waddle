//
//  HelloWorldLayer.m
//  CuddlyWaddle
//
//  Created by yangboz on 16/6/28.
//  Copyright __MyCompanyName__ 2016年. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

@synthesize motionManager;

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	

	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"Marker Felt" fontSize:64];

		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
	
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/2 );
		
		// add the label as a child to this Layer
		[self addChild: label];
        
        // add and position the labels
        yawLabel = [CCLabelTTF labelWithString:@"Yaw: " fontName:@"Marker Felt" fontSize:12];
        posIn360Label = [CCLabelTTF labelWithString:@"360Pos: " fontName:@"Marker Felt" fontSize:12];
        yawLabel.position =  ccp(50, 240);
        posIn360Label.position =  ccp(50, 300);
        [self addChild: yawLabel];
        [self addChild:posIn360Label];
        //
        self.motionManager = [[[CMMotionManager alloc] init] autorelease];
        motionManager.deviceMotionUpdateInterval = 1.0/60.0;
        if (motionManager.isDeviceMotionAvailable) {
            [motionManager startDeviceMotionUpdates];
        }
        
        [self scheduleUpdate];
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

-(void)update:(ccTime)delta {
    CMDeviceMotion *currentDeviceMotion = motionManager.deviceMotion;
    CMAttitude *currentAttitude = currentDeviceMotion.attitude;
    
    // 1: Convert the radians yaw value to degrees then round up/down
    float yaw = roundf((float)(CC_RADIANS_TO_DEGREES(currentAttitude.yaw)));
    
    // 2: Convert the degrees value to float and use Math function to round the value
    [yawLabel setString:[NSString stringWithFormat:@"Yaw: %.0f", yaw]];
    
    // 3: Convert the yaw value to a value in the range of 0 to 360
    int positionIn360 = yaw;
    if (positionIn360 < 0) {
        positionIn360 = 360 + positionIn360;
    }
    
    [posIn360Label setString:[NSString stringWithFormat:@"360Pos: %d", positionIn360]];
    
}
@end
