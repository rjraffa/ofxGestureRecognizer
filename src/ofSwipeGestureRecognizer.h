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
    UISwipeGestureRecognizer *gestureUp;
    UISwipeGestureRecognizer *gestureDown;
    UISwipeGestureRecognizer *gestureLeft;
    UISwipeGestureRecognizer *gestureRight;

@public
    NSInteger              section;

}

@property(assign,nonatomic) BOOL cancelsTouchesInView;

-(id)initWithView:(UIView*)view;  
-(void)swipeUp:(UISwipeGestureRecognizer *)gUp;
-(void)swipeDown:(UISwipeGestureRecognizer *)gDown;
-(void)swipeLeft:(UISwipeGestureRecognizer *)gLeft;
-(void)swipeRight:(UISwipeGestureRecognizer *)gRight;

@end