/*
 *  ofSwipeGestureRecognizer.h
 *
 *  Created by Ryan Raffa on 5/13/12.
 *
 *  Based on sample code posted by daanvanhasselt on the openFrameworks forum
 *
 */

#import <Foundation/Foundation.h>  


@interface ofSwipeGestureRecognizer : NSObject {  
    UISwipeGestureRecognizer *swipeGestureRecognizer;  
}  

-(id)initWithView:(UIView*)view;  
-(void)handleSwipe:(UISwipeGestureRecognizer *) gr;  

@end