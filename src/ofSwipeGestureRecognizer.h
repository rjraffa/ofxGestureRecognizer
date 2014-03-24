/*
 *  ofSwipeGestureRecognizer.h
 *
 *  Created by Ryan Raffa on 5/13/12
 *  Updated on 4/23/14
 *
 *  Based on example code by http://www.daanvanhasselt.com
 *
 *  Includes updates from imal mobile workshop
 *  http://www.imal.org/en/activity/mobile-apps-workshop
 *  by Jesus Gollonet
 */


#import <Foundation/Foundation.h>  

#include "ofxiOSExtras.h"

class ofSwipeGestureRecognizer;

@interface ofxSwipeGestureRecognizer : NSObject {
    UISwipeGestureRecognizer *gestureUp;
    UISwipeGestureRecognizer *gestureDown;
    UISwipeGestureRecognizer *gestureLeft;
    UISwipeGestureRecognizer *gestureRight;
    ofSwipeGestureRecognizer *notifier;
    
@public
    NSInteger              directionUp;
    NSInteger              directionDown;
    NSInteger              directionLeft;
    NSInteger              directionRight;
    NSInteger              swipes;
}

@property(assign,nonatomic) BOOL cancelsTouchesInView;
@property(nonatomic) NSUInteger numberOfTouchesRequired;

-(id)initWithView:(UIView*)view;
-(void)setNotifier:     (ofSwipeGestureRecognizer *) _notifier;
-(void)swipeUp:         (UISwipeGestureRecognizer *)gUp;
-(void)swipeDown:       (UISwipeGestureRecognizer *)gDown;
-(void)swipeLeft:       (UISwipeGestureRecognizer *)gLeft;
-(void)swipeRight:      (UISwipeGestureRecognizer *)gRight;

@end

class ofSwipeGestureRecognizerArgs{
public:
    int direction;
    int totalSwipes;
};

class ofSwipeGestureRecognizer {
public:
    ofSwipeGestureRecognizer();
    void setup();
    ofxSwipeGestureRecognizer * swipeRecognizer;
    void gestureRecognized(ofSwipeGestureRecognizerArgs args);
    
    ofEvent<ofSwipeGestureRecognizerArgs> swipeRecognized;
};
