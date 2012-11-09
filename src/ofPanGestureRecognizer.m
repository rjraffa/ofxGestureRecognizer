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
        [panGestureRecognizer release];
    }
    return self;  
}  

-(void)handlePan:(UIPanGestureRecognizer *) gr{  
    
    
    if([gr state] == UIGestureRecognizerStateBegan){  
        NSLog(@"Started Pan!"); 
        swipping = TRUE;
        startLocation   = [gr translationInView: gr.view ];
    } 

//    if ([gr state] == UIGestureRecognizerStateChanged) {
//        touchLocation   = [gr translationInView: gr.view ];
//        velocity        = [gr velocityInView: gr.view ];
//    }
    
    if([gr state] == UIGestureRecognizerStateEnded){
        endLocation   = [gr translationInView: gr.view ];
        touchLocation   = [gr translationInView: gr.view ];
        velocity        = [gr velocityInView: gr.view ];
        swipping = FALSE;
        NSLog(@"Not Panning!"); 
    }     

}


-(void)dealloc{  
    [super dealloc];  
}  

@end