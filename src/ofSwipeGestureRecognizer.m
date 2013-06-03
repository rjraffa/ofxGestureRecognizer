/*
 *  ofSwipeGestureRecognizer.m
 *
 *  Created by Ryan Raffa on 5/13/12.
 *  Based on example code by http://www.daanvanhasselt.com
 *
 */

#import "ofSwipeGestureRecognizer.h"  

@implementation ofSwipeGestureRecognizer

@synthesize cancelsTouchesInView;

-(id)initWithView:(UIView*)view{  
    if((self = [super init])){
        
        swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
        gestureUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeUp:)];//direction is set by default.
        gestureDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDown:)];//need to set direction.
        gestureLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft:)];//direction is set by default.
        gestureRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight:)];//need to set direction.

        [gestureUp setDirection:(UISwipeGestureRecognizerDirectionUp)];
        [gestureDown setDirection:(UISwipeGestureRecognizerDirectionDown)];
        [gestureLeft setDirection:(UISwipeGestureRecognizerDirectionLeft)];
        [gestureRight setDirection:(UISwipeGestureRecognizerDirectionRight)];
        
        [view addGestureRecognizer:swipeGestureRecognizer];
        [view addGestureRecognizer:gestureUp];
        [view addGestureRecognizer:gestureDown];
        [view addGestureRecognizer:gestureLeft];
        [view addGestureRecognizer:gestureRight];
        swipeGestureRecognizer.cancelsTouchesInView = NO;
        gestureUp.cancelsTouchesInView = NO;
        gestureDown.cancelsTouchesInView = NO;
        gestureLeft.cancelsTouchesInView = NO;
        gestureRight.cancelsTouchesInView = NO;
        [swipeGestureRecognizer release];
        [gestureUp release];
        [gestureDown release];
        [gestureLeft release];
        [gestureRight release];
        
        NSLog(@"initwithView was run! \n");

    }
    return self;  
}  

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    NSLog(@"gestureRecognizer run! \n");
    return YES;
}

// pulled from Greg's post to stackoverflow
// http://stackoverflow.com/questions/3319209/setting-direction-for-uiswipegesturerecognizer

-(void)swipeUp:(UISwipeGestureRecognizer *) gUp {
    
    NSLog(@"Up Swipe received. \n");//Lets you know this method was called by gesture recognizer.
    NSLog(@"Direction is: %i \n ", gUp.direction);//Lets you know the numeric value of the gesture direction for confirmation (1=right).
    //only interested in gesture if gesture state == changed or ended (From Paul Hegarty @ standford U
    if ((gUp.state == UIGestureRecognizerStateChanged) ||
        (gUp.state == UIGestureRecognizerStateEnded)) {
        section++;
        //do something for a UP swipe gesture.
    }
}

-(void)swipeDown:(UISwipeGestureRecognizer *)gDown {
    
    NSLog(@"Down Swipe received. \n");//Lets you know this method was called by gesture recognizer.
    NSLog(@"Direction is: %i \n", gDown.direction);//Lets you know the numeric value of the gesture direction for confirmation (1=right).
    //only interested in gesture if gesture state == changed or ended (From Paul Hegarty @ standford U
    if ((gDown.state == UIGestureRecognizerStateChanged) ||
        (gDown.state == UIGestureRecognizerStateEnded)) {
        //do something for a down swipe gesture.
        section++;
    }
}

-(void)swipeLeft:(UISwipeGestureRecognizer *) gLeft {
    
    NSLog(@"Left Swipe received. \n");//Lets you know this method was called by gesture recognizer.
    NSLog(@"Direction is: %i \n", gLeft.direction);//Lets you know the numeric value of the gesture direction for confirmation (1=right).
    //only interested in gesture if gesture state == changed or ended (From Paul Hegarty @ standford U
    if ((gLeft.state == UIGestureRecognizerStateChanged) ||
        (gLeft.state == UIGestureRecognizerStateEnded)) {
        //do something for a left swipe gesture.
        section++;
    }
}

-(void)swipeRight:(UISwipeGestureRecognizer *) gRight {
    
    NSLog(@"Right Swipe received. \n");//Lets you know this method was called by gesture recognizer.
    NSLog(@"Direction is: %i \n", gRight.direction);//Lets you know the numeric value of the gesture direction for confirmation (1=right).
    //only interested in gesture if gesture state == changed or ended (From Paul Hegarty @ standford U
    if ((gRight.state == UIGestureRecognizerStateChanged) ||
        (gRight.state == UIGestureRecognizerStateEnded)) {
        //do something for a right swipe gesture.
        section++;
    }
}


-(void)dealloc{  
    [swipeGestureRecognizer release];  
    [super dealloc];  
}  

@end