/*
 *  ofSwipeGestureRecognizer.m
 *
 *  Created by Ryan Raffa on 5/13/12.
 *  Based on example code by http://www.daanvanhasselt.com
 *
 */

#import "ofSwipeGestureRecognizer.h"  

@implementation ofSwipeGestureRecognizer  

-(id)initWithView:(UIView*)view{  
    if((self = [super init])){  
        swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];  
        [view addGestureRecognizer:swipeGestureRecognizer];  
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