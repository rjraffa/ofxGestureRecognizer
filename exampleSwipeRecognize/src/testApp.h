#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

#include "ofPanGestureRecognizer.h"
#include "ofPinchGestureRecognizer.h"
#include "ofSwipeGestureRecognizer.h"
#include "ofTapGestureRecognizer.h"

class testApp : public ofxiOSApp{
    
    public:
        void setup();
        void update();
        void draw();
	
        void exit();
    
        void touchDown(ofTouchEventArgs & touch);
        void touchMoved(ofTouchEventArgs & touch);
        void touchUp(ofTouchEventArgs & touch);
        void touchDoubleTap(ofTouchEventArgs & touch);
        void touchCancelled(ofTouchEventArgs & touch);
	
        void lostFocus();
        void gotFocus();
        void gotMemoryWarning();
        void deviceOrientationChanged(int newOrientation);
	
        //to identify specific pan/pinch/tap/swipe gestures
        ofSwipeGestureRecognizer      swipping;
    
        void onSwipe(ofSwipeGestureRecognizerArgs & args);
    
        //info coming from ofSwipeGestureRecognizer and used by oF
        int             direction;
        int             totalSwipes;
    
    
        bool            retina;
};


