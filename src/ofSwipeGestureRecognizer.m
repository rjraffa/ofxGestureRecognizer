/*
 *  ofSwipeGestureRecognizer.m
 *
 *  Created by Ryan Raffa on 5/13/12.
 *
 *  Based on sample code posted by daanvanhasselt on the openFrameworks forum
 *
 */

#import "ofSwipeGestureRecognizer.h"  

@implementation ofSwipeGestureRecognizer  

-(id)initWithView:(UIView*)view{  
    if((self = [super init])){  
        swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];  
        [view addGestureRecognizer:swipeGestureRecognizer];
        swipeGestureRecognizer.cancelsTouchesInView = NO;
    }  
    return self;  
}  

-(void)handleSwipe:(UISwipeGestureRecognizer *) gr{  
    if([gr state] == UIGestureRecognizerStateRecognized){  
        NSLog(@"Swipe!");  
    }
}  

-(void)dealloc{  
    [swipeGestureRecognizer release];  
    [super dealloc];  
}  

@end