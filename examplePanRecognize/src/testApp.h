#pragma once

#include "ofMain.h"
#include "ofxiPhone.h"
#include "ofxiPhoneExtras.h"

#include "ofPanGestureRecognizer.h"
#include "ofPinchGestureRecognizer.h"
#include "ofSwipeGestureRecognizer.h"
#include "ofTapGestureRecognizer.h"

class testApp : public ofxiPhoneApp {
	
public:
	void setup();
	void update();
	void draw();
	void exit();
	
	void touchDown(ofTouchEventArgs &touch);
	void touchMoved(ofTouchEventArgs &touch);
	void touchUp(ofTouchEventArgs &touch);
	void touchDoubleTap(ofTouchEventArgs &touch);
	void touchCancelled(ofTouchEventArgs &touch);
    
	void lostFocus();
	void gotFocus();
	void gotMemoryWarning();
	void deviceOrientationChanged(int newOrientation);
    
    ofTrueTypeFont basicFont;
    
    //to identify specific pan/pinch/tap/swipe gestures
    ofPanGestureRecognizer      *recogPan;
    
    //variables used by openFrameworks
    ofPoint         pos;
    ofPoint         speed;
    float           angle;
    
    //info coming from ofPanGestureRecognizer
    ofPoint         velocity;
    ofPoint         startLocation;
    ofPoint         endLocation;    
    bool            panning;
    
};


