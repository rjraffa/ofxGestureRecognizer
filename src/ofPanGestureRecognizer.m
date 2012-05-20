/*
 *  ofPinchGestureRecognizer.m
 *
 *  Created by Ryan Raffa on 5/13/12.
 *
 */

#import "ofPanGestureRecognizer.h"  

@implementation ofPanGestureRecognizer

@synthesize cancelsTouchesInView;

-(id)initWithView:(UIView*)view{  
    if((self = [super init])){  
        panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action: @selector(handlePan:)];  
        [view addGestureRecognizer:panGestureRecognizer];
        panGestureRecognizer.cancelsTouchesInView = NO;
    }
    return self;  
}  

-(void)handlePan:(UIPanGestureRecognizer *) gr{  
    
    if([gr state] == UIGestureRecognizerStateBegan){  
        NSLog(@"Pan!"); 
    } 
    // UIGestureRecognizerStateEnded can be changed based on when you want specific readings
    if([gr state] == UIGestureRecognizerStateEnded){
        touchLocation   = [gr translationInView: gr.view ];
        velocity        = [gr velocityInView: gr.view ];
    }
}


-(void)dealloc{
    [panGestureRecognizer release];
    [super dealloc];  
}  

@end