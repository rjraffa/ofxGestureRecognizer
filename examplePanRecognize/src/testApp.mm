#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){	
    
	ofSetFrameRate(30);
    ofBackground(255, 255, 255);
    
    basicFont.loadFont("verdana.ttf", 10, true, true, true);        //load in font that is used throughout app
    
    ofxAccelerometer.setup();               //accesses accelerometer data
    ofxiPhoneAlerts.addListener(this);      //allows elerts to appear while app is running
	ofRegisterTouchEvents(this);            //method that passes touch events
    
    EAGLView *view = ofxiPhoneGetGLView();  
    recogPan = [[ofPanGestureRecognizer alloc] initWithView:view];
    
    pos = 0.0;
    speed = 0.0;
    angle = 0.0;
    
    velocity = 0;
    startLocation = 0.0;
    endLocation = 0.0;
    panning = false;
    
}

//--------------------------------------------------------------
void testApp::update() {
    
    //divide by the amount you like to get the speed your looking for 
    pos = pos + speed/20.0;
 
    panning =     recogPan->panning;
        
}

//--------------------------------------------------------------
void testApp::draw(){
    
    ofBackground (255, 255, 255);
    
    ofSetColor(255, 0, 0);
    ofCircle(pos.x, pos.y, 20);
    
    ofSetColor(0, 0, 0);
    ofDrawBitmapString("mouseX: "+ofToString(ofGetMouseX()), 25, 25);
    ofDrawBitmapString("mouseY: "+ofToString(ofGetMouseY()), 25, 45);
    ofDrawBitmapString("velocityX: "+ofToString(speed.x), 25, 65);
    ofDrawBitmapString("velocityY: "+ofToString(speed.y), 25, 85);

    ofDrawBitmapString("startLocationX: "+ofToString(startLocation.x), 25, 105);
    ofDrawBitmapString("startLocationY: "+ofToString(startLocation.y), 25, 125);
    ofDrawBitmapString("endLocationX: "+ofToString(endLocation.x), 25, 145);
    ofDrawBitmapString("endLocationY: "+ofToString(endLocation.y), 25, 165);
    ofDrawBitmapString("panning: "+ofToString(panning), 25, 185);
    ofDrawBitmapString("angle: "+ofToString(angle), 25, 205);
    
}

//--------------------------------------------------------------
void testApp::exit(){
    
}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs &touch){
    
    speed = 0;
    
    pos.x = touch.x;
    pos.y = touch.y;
    
}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs &touch){
    
    pos.x = touch.x;
    pos.y = touch.y;
        
    //gets official start of swipe and adjusts original swipe beginning
    if (panning) {
        startLocation.x =     recogPan->startLocation.x;
        startLocation.y =     recogPan->startLocation.y;
    }
    
}

//--------------------------------------------------------------
void testApp::touchUp(ofTouchEventArgs &touch){
    
    //gathers velocity info
    speed.x =     recogPan->velocity.x;
    speed.y =     recogPan->velocity.y;
    
    pos.x = touch.x;
    pos.y = touch.y;
    
    //grabs actual end position which is based off of real origin
    endLocation.x =     recogPan->endLocation.x;
    endLocation.y =     recogPan->endLocation.y;
    
    //determine angle
    float deltaY = recogPan->delta.y;
    float deltaX = recogPan->delta.x;
    angle = atan2(deltaY, deltaX) * 180 / PI;
    
    
}

//--------------------------------------------------------------
void testApp::touchDoubleTap(ofTouchEventArgs &touch){
    
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

//--------------------------------------------------------------
void testApp::touchCancelled(ofTouchEventArgs& args){
    
}