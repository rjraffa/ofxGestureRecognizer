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

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

-(void)handlePan:(UIPanGestureRecognizer *) gr{
    if([gr state] == UIGestureRecognizerStateBegan){  
        panning = TRUE;
        startLocation   = [gr translationInView: gr.view ];
        currentLocation = [gr translationInView: gr.view ];
        //NSLog(@"Started Pan!"); 
    } 

    if ([gr state] == UIGestureRecognizerStateChanged) {
        currentLocation = [gr translationInView: gr.view ];
        delta.x = currentLocation.x - startLocation.x;
        delta.y = currentLocation.y - startLocation.y;
        //NSLog(@"deltaX: %f, deltaY: %f", deltaX, deltaY);
    }
    
    if([gr state] == UIGestureRecognizerStateEnded){
        currentLocation = [gr translationInView: gr.view ];
        endLocation   = [gr translationInView: gr.view ];
        delta.x = currentLocation.x - startLocation.x;
        delta.y = currentLocation.y - startLocation.y;
        velocity        = [gr velocityInView: gr.view ];
        panning = FALSE;
        //NSLog(@"Not Panning!"); 
    }     

}


-(void)dealloc{  
    [super dealloc];  
}  

@end