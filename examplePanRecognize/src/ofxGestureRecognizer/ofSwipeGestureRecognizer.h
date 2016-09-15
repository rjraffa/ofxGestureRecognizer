/*
 *  ofSwipeGestureRecognizer.h
 *
 *  Created by Ryan Raffa on 5/13/12.
 *  Based on example code by http://www.daanvanhasselt.com
 *
 */

#import <Foundation/Foundation.h>  


@interface ofSwipeGestureRecognizer : NSObject {  
    UISwipeGestureRecognizer *swipeGestureRecognizer;  
}  

-(id)initWithView:(UIView*)view;  
-(void)handleSwipe:(UISwipeGestureRecognizer *) gr;  

@end