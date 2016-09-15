/*
 *  ofPinchGestureRecognizer.m
 *
 *  Created by Ryan Raffa on 5/13/12.
 *  Based on example code by http://www.daanvanhasselt.com
 *
 */

#import "ofPinchGestureRecognizer.h"

@implementation ofPinchGestureRecognizer

@synthesize cancelsTouchesInView;

-(id)initWithView:(UIView*)view{  
    if((self = [super init])){  
        pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];  
        [view addGestureRecognizer:pinchGestureRecognizer];  
    }  
    return self;  
}  

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

-(void)handlePinch:(UIPinchGestureRecognizer *) gr{  
    if([gr state] == UIGestureRecognizerStateBegan){
        pinching = true;
        //NSLog(@"Start Pinch!");
    }
    if([gr state] == UIGestureRecognizerStateChanged){
        scale = [gr scale];
        //NSLog(@"%f", scale);
    }
    if([gr state] == UIGestureRecognizerStateEnded){
        pinching = false;
        //NSLog(@"End Pinch!");
    }
}  

-(void)dealloc{  
    [pinchGestureRecognizer release];  
    [super dealloc];  
}  

@end