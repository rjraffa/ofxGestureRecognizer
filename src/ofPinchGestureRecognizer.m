/*
 *  ofPinchGestureRecognizer.m
 *
 *  Created by Ryan Raffa on 5/13/12.
 *
 *  Based on sample code posted by daanvanhasselt on the openFrameworks forum
 *
 */

#import "ofPinchGestureRecognizer.h"  

@implementation ofPinchGestureRecognizer  

-(id)initWithView:(UIView*)view{  
    if((self = [super init])){  
        pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];  
        [view addGestureRecognizer:pinchGestureRecognizer];
        pinchGestureRecognizer.cancelsTouchesInView = NO;
    }  
    return self;  
}  

-(void)handlePinch:(UIPinchGestureRecognizer *) gr{  
    if([gr state] == UIGestureRecognizerStateRecognized){  
        NSLog(@"Pinch!");  
    }  
}  

-(void)dealloc{
    [pinchGestureRecognizer release]; 
    [super dealloc]; 
}  

@end