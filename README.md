ofxGestureRecognizer

This is a simple set of objective-C classes that pass gesture information to openFrameworks for iOS projects. I've been doing a series of apps recently, and they came in handy.

The gestures included are:
- Pan (ofPanGestureRecognizer)
- Pinch (ofPinchGestureRecognizer)
- Swipe (ofSwipeGestureRecognizer)
- Tap (ofTapGestureRecognizer)

It makes use of the native gesture recognizers as well as allowing touch events to pass through to openFrameworks.

Please note, I am currently overriding the deault cancelsTouchesInView so that touch events are not gobbled up by the gestureRecognizer in objective-C. The touch events are passed to the appropriate View so openFrameworks can also make use of the touch events. If you want to go back to the default, just comment out the cancelsTouchesInView line.

The challenge is using continuous gesture interpreters (like pan) as opposed to discrete gestures (such as double tap). Right now, gestures are not recognized simultaneously (meaning you won't see a swipe and a pan recognized in the same gesture if you are using both recognizer classes).

Thanks to the openFrameworks forum for the help in getting these setup.