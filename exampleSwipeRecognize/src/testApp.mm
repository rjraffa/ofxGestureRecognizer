#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){	
	ofSetOrientation(OF_ORIENTATION_90_RIGHT);//Set iOS to Orientation Landscape Right

    ofBackground(255, 255, 255);
    
    ofxAccelerometer.setup();               //accesses accelerometer data
    ofxiPhoneAlerts.addListener(this);      //allows elerts to appear while app is running
	ofRegisterTouchEvents(this);            //method that passes touch events
    
    swipping.setup();
    ofAddListener(swipping.swipeRecognized, this, &testApp::onSwipe);
    
    totalSwipes = 0;
    direction = 0;
    
    if (ofGetWidth() > 480) retina = true;
    
	ofSetFrameRate(60);
    
}


//--------------------------------------------------------------
void testApp::update(){
	
}

//--------------------------------------------------------------
void testApp::draw(){

    ofBackground (255, 255, 255);

    if (retina) ofScale(2.0, 2.0); //increase type size if retina screen
    
    ofSetColor(0, 0, 0);
    ofDrawBitmapString("Swipping Example", 25, 25);
    ofDrawBitmapString("mouseX: "+ofToString(ofGetMouseX()), 25, 45);
    ofDrawBitmapString("mouseY: "+ofToString(ofGetMouseY()), 25, 65);
    ofDrawBitmapString("direction: "+ofToString(direction), 25, 85);
    ofDrawBitmapString("total # of swipes: "+ofToString(totalSwipes), 25, 105);
    }

//--------------------------------------------------------------
void testApp::onSwipe(ofSwipeGestureRecognizerArgs & args){

    cout << " Swipe Event! Yes! " << endl;
    
    direction = args.direction;
    totalSwipes = args.totalSwipes;
    
    //do something in oF based on the event...
    
    
}

//--------------------------------------------------------------
void testApp::exit(){
    
}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs & touch){
    
    
}

//--------------------------------------------------------------
void testApp::touchUp(ofTouchEventArgs & touch){
	
}

//--------------------------------------------------------------
void testApp::touchDoubleTap(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchCancelled(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::lostFocus(){
    
}

//--------------------------------------------------------------
void testApp::gotFocus(){
    
}

//--------------------------------------------------------------
void testApp::gotMemoryWarning(){
    
}

//--------------------------------------------------------------
void testApp::deviceOrientationChanged(int newOrientation){
    
}
