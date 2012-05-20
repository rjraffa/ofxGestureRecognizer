/*
 *  ofPanGestureRecognizer.h
 *
 *  Created by Ryan Raffa on 5/13/12.
 *
 *  Based on sample code posted by http://www.daanvanhasselt.com on the openFrameworks forum
 *
 */

#import <Foundation/Foundation.h>  


@interface ofPanGestureRecognizer : NSObject {  
    UIPanGestureRecognizer *panGestureRecognizer;

@public
    CGPoint                touchLocation;
    CGPoint                velocity;
}  

@property(assign,nonatomic) BOOL cancelsTouchesInView;

-(id)initWithView:(UIView*)view;  
-(void)handlePan:(UIPanGestureRecognizer *) gr;


@end