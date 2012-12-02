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
    CGPoint                currentLocation;
    CGPoint                endLocation;
    CGPoint                delta;
    CGPoint                velocity;
    BOOL                   panning;
}  

@property(assign,nonatomic) BOOL cancelsTouchesInView;

-(id)initWithView:(UIView*)view;  
-(void)handlePan:(UIPanGestureRecognizer *) gr;


@end