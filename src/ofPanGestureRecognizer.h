/*
 *  ofPanGestureRecognizer.h
 *
 *  Created by Ryan Raffa on 5/13/12.
 *  Based on example code by http://www.daanvanhasselt.com
 *
 */

#import <Foundation/Foundation.h>  


@interface ofPanGestureRecognizer : NSObject {  
    UIPanGestureRecognizer *panGestureRecognizer;

@public
    CGPoint                startLocation;
    CGPoint                endLocation;
    CGPoint                touchLocation;
    CGPoint                velocity;
    BOOL                   swipping;
}  

@property(assign,nonatomic) BOOL cancelsTouchesInView;

-(id)initWithView:(UIView*)view;  
-(void)handlePan:(UIPanGestureRecognizer *) gr;


@end