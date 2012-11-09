#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){	
    
	ofSetFrameRate(30);
    ofBackground(255, 255, 255);
    
    translation = 0;
    velocity = 0;
    
    basicFont.loadFont("verdana.ttf", 10, true, true, true);        //load in font that is used throughout app
    
    ofxAccelerometer.setup();               //accesses accelerometer data
    ofxiPhoneAlerts.addListener(this);      //allows elerts to appear while app is running
	ofRegisterTouchEvents(this);            //method that passes touch events
    
    EAGLView *view = ofxiPhoneGetGLView();  
    recogPan = [[ofPanGestureRecognizer alloc] initWithView:view];
    
    pos = 0.0;
    speed = 0.0;
    startLocation = 0.0;
    endLocation = 0.0;
    swipping = false;
    
}

//--------------------------------------------------------------
void testApp::update() {
    
    //divide by the amount you like to get the speed your looking for 
    pos = pos + speed/20.0;
 
    swipping =     recogPan->swipping;
        
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
    ofDrawBitmapString("swipping: "+ofToString(swipping), 25, 185);
    
    ofDrawBitmapString("startLocAdjustedX: "+ofToString(startLocAdjusted.x), 25, 205);
    ofDrawBitmapString("startLocAdjustedY: "+ofToString(startLocAdjusted.y), 25, 225);
    ofDrawBitmapString("endLocAdjustedX: "+ofToString(endLocAdjusted.x), 25, 245);
    ofDrawBitmapString("endLocAdjustedX: "+ofToString(endLocAdjusted.y), 25, 265);

    ofDrawBitmapString("angle: "+ofToString(angle), 25, 285);
    
}

//--------------------------------------------------------------
void testApp::exit(){
    
}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs &touch){
    
    speed = 0;
    
    pos.x = touch.x;
    pos.y = touch.y;
    
    //gets origin of possible finger pan
    startLocAdjusted.x = touch.x;
    startLocAdjusted.y = touch.y;
    
}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs &touch){
    
    pos.x = touch.x;
    pos.y = touch.y;
    
    //gets position of possible end of finger pan
    endLocAdjusted.x = touch.x;
    endLocAdjusted.y = touch.y;    
    
    //gets official start of swipe and adjusts original swipe beginning
    if (swipping) {
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

    //adjust start point
    startLocAdjusted+=startLocation;

    //adjustment of official end point
    endLocAdjusted = startLocAdjusted + endLocation;
    
    //determine angle
    float deltaY = endLocAdjusted.y - startLocAdjusted.y;
    float delatX = endLocAdjusted.x - startLocAdjusted.x;
    angle = atan2(deltaY, delatX) * 180 / PI;
    
    
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