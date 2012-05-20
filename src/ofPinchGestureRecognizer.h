/*
 *  ofPinchGestureRecognizer.h
 *
 *  Created by Ryan Raffa on 5/13/12.
 *
 *  Based on sample code posted by http://www.daanvanhasselt.com on the openFrameworks forum
 *
 */

#import <Foundation/Foundation.h>  


@interface ofPinchGestureRecognizer : NSObject {  
    UIPinchGestureRecognizer *pinchGestureRecognizer;  
}  

-(id)initWithView:(UIView*)view;  
-(void)handlePinch:(UIPinchGestureRecognizer *) gr;  

@end