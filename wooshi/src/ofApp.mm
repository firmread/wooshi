#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    
    
    cout << ofGetWidth() << ","<< ofGetHeight() <<endl;
    
	ofSetVerticalSync(true);
	ofSetFrameRate(60);
	ofEnableAlphaBlending();
    ofEnableSmoothing();
    
    verdana14.loadFont("verdana.ttf", 14, true, true);
	verdana14.setLineHeight(18.0f);
	verdana14.setLetterSpacing(0.9);
    
    verdana11.loadFont("verdana.ttf", 11, true, true);
	verdana11.setLineHeight(18.0f);
	verdana11.setLetterSpacing(0.9);

	
	for (int i = 0; i < 1; i++){
		particle p;
		p.setInitialCondition(ofRandom(ofGetWidth()), ofRandom(ofGetHeight()), 0, 0);
		p.damping = ofRandom(0.07, 0.08);
		particles.push_back(p);
	}
    
	VF.setupField(ofGetWidth()/20, ofGetHeight()/20,ofGetWidth(), ofGetHeight());
    
    
    
	particle myParticle;
    
    //grass box particle dots
	myParticle.setInitialCondition(200,ofGetHeight(),0,0);
	grass.push_back(myParticle);
	
	myParticle.setInitialCondition(250,ofGetHeight(),0,0);
	grass.push_back(myParticle);
	
	myParticle.setInitialCondition(200,ofGetHeight()-75,0,0);
	grass.push_back(myParticle);
	
	myParticle.setInitialCondition(240,ofGetHeight()-75,0,0);
	grass.push_back(myParticle);
	
	myParticle.setInitialCondition(200,ofGetHeight()-150,0,0);
	grass.push_back(myParticle);
	
	myParticle.setInitialCondition(230,ofGetHeight()-150,0,0);
	grass.push_back(myParticle);
	
	myParticle.setInitialCondition(200,ofGetHeight()-225,0,0);
	grass.push_back(myParticle);
	
	myParticle.setInitialCondition(220,ofGetHeight()-225,0,0);
	grass.push_back(myParticle);
	
	myParticle.setInitialCondition(200,ofGetHeight()-290,0,0);
	grass.push_back(myParticle);
	
	myParticle.setInitialCondition(210,ofGetHeight()-290,0,0);
	grass.push_back(myParticle);
	
	myParticle.setInitialCondition(200,ofGetHeight()-355,0,0);
	grass.push_back(myParticle);
	
	myParticle.setInitialCondition(200,ofGetHeight()-355,0,0);
	grass.push_back(myParticle);
    
    
    // draw line
	spring mySpring;
    
    springiness = 0.4f;
    windForce = 1.5f;
    
	for (int i = 0; i < grass.size()-2; i++){
		mySpring.distance		= grass[i].pos.distance(grass[(i+1) % grass.size()].pos);
		mySpring.springiness	= springiness;
		mySpring.particleA = & (grass[i]);
		mySpring.particleB = & (grass[(i+1) % grass.size()]);
		springs.push_back(mySpring);
	}
	
	
	// these hold the shape together:
    
    mySpring.distance = (grass[0].pos - grass[2].pos).length();
    mySpring.springiness = 0.2f;
    mySpring.particleA = &(grass[0]);
    mySpring.particleB = &(grass[2]);
    springs.push_back(mySpring);
    
    mySpring.distance = (grass[0].pos - grass[3].pos).length();
    mySpring.springiness = springiness;
    mySpring.particleA = &(grass[0]);
    mySpring.particleB = &(grass[3]);
    springs.push_back(mySpring);
    
    mySpring.distance = (grass[1].pos - grass[3].pos).length();
    mySpring.springiness = springiness;
    mySpring.particleA = &(grass[1]);
    mySpring.particleB = &(grass[3]);
    springs.push_back(mySpring);
    
    mySpring.distance = (grass[2].pos - grass[5].pos).length();
    mySpring.springiness = springiness;
    mySpring.particleA = &(grass[2]);
    mySpring.particleB = &(grass[5]);
    springs.push_back(mySpring);
    
    mySpring.distance = (grass[2].pos - grass[4].pos).length();
    mySpring.springiness = springiness;
    mySpring.particleA = &(grass[2]);
    mySpring.particleB = &(grass[4]);
    springs.push_back(mySpring);
    
    mySpring.distance = (grass[3].pos - grass[5].pos).length();
    mySpring.springiness = springiness;
    mySpring.particleA = &(grass[3]);
    mySpring.particleB = &(grass[5]);
    springs.push_back(mySpring);
    
    mySpring.distance = (grass[6].pos - grass[4].pos).length();
    mySpring.springiness = springiness;
    mySpring.particleA = &(grass[6]);
    mySpring.particleB = &(grass[4]);
    springs.push_back(mySpring);
    
    mySpring.distance = (grass[7].pos - grass[5].pos).length();
    mySpring.springiness = springiness;
    mySpring.particleA = &(grass[7]);
    mySpring.particleB = &(grass[5]);
    springs.push_back(mySpring);
    
    mySpring.distance = (grass[7].pos - grass[4].pos).length();
    mySpring.springiness = springiness;
    mySpring.particleA = &(grass[7]);
    mySpring.particleB = &(grass[4]);
    springs.push_back(mySpring);
    
    mySpring.distance = (grass[7].pos - grass[8].pos).length();
    mySpring.springiness = springiness;
    mySpring.particleA = &(grass[7]);
    mySpring.particleB = &(grass[8]);
    springs.push_back(mySpring);
    
    mySpring.distance = (grass[6].pos - grass[8].pos).length();
    mySpring.springiness = springiness;
    mySpring.particleA = &(grass[6]);
    mySpring.particleB = &(grass[8]);
    springs.push_back(mySpring);
    
    mySpring.distance = (grass[7].pos - grass[9].pos).length();
    mySpring.springiness = springiness;
    mySpring.particleA = &(grass[7]);
    mySpring.particleB = &(grass[9]);
    springs.push_back(mySpring);
    
    mySpring.distance = (grass[6].pos - grass[9].pos).length();
    mySpring.springiness = springiness;
    mySpring.particleA = &(grass[6]);
    mySpring.particleB = &(grass[9]);
    springs.push_back(mySpring);
    
    mySpring.distance = (grass[8].pos - grass[9].pos).length();
    mySpring.springiness = springiness;
    mySpring.particleA = &(grass[8]);
    mySpring.particleB = &(grass[9]);
    springs.push_back(mySpring);
    
    mySpring.distance = (grass[8].pos - grass[10].pos).length();
    mySpring.springiness = springiness;
    mySpring.particleA = &(grass[8]);
    mySpring.particleB = &(grass[10]);
    springs.push_back(mySpring);
    
    mySpring.distance = (grass[8].pos - grass[11].pos).length();
    mySpring.springiness = springiness;
    mySpring.particleA = &(grass[8]);
    mySpring.particleB = &(grass[11]);
    springs.push_back(mySpring);
    
    mySpring.distance = (grass[9].pos - grass[11].pos).length();
    mySpring.springiness = springiness;
    mySpring.particleA = &(grass[9]);
    mySpring.particleB = &(grass[11]);
    springs.push_back(mySpring);
    
    mySpring.distance = (grass[10].pos - grass[11].pos).length();
    mySpring.springiness = springiness;
    mySpring.particleA = &(grass[10]);
    mySpring.particleB = &(grass[11]);
    springs.push_back(mySpring);
}

//--------------------------------------------------------------
void ofApp::update(){
    
    
    float sine = sin(ofGetElapsedTimef()*windForce) * ofRandom(.01, .5);
    
	for (int i = 0; i < particles.size(); i++){
		particles[i].resetForce();
	}
    
	for (int i = 0; i < particles.size(); i++){
		
        //		particles[i].addAttractionForce(-500, particles[i].initialY, 2000, 2);
		//particles[i].addRepulsionForce(mouseX, mouseY, 125, 2.5);
        
        if (particles[i].pos.x > ofGetWidth()-10) {
            particles[i].vel.x -=.01;
        }
        
		// get the force from the vector field:
		ofVec2f frc;
		frc = VF.getForceFromPos(particles[i].pos.x, particles[i].pos.y);
		particles[i].addForce(frc.x + sine/5, frc.y + sine/5);
		
		for (int j = 0; j < i; j++){
			particles[i].addRepulsionForce(particles[j], 50, 0.4);
		}
	}
    
	for (int i = 0; i < particles.size(); i++){
		//particles[i].addCounterClockwiseForce(mouseX, mouseY, 1000, 0.1);
		//particles[i].addClockwiseForce(mouseX, mouseY, 200, 1);
		
		particles[i].addDampingForce();
		particles[i].update();
		
		if (particles[i].pos.x < 0 || particles[i].pos.y < 0 || particles[i].pos.y > ofGetHeight()) {
			particles[i].setInitialCondition(ofGetWidth(), ofRandom(ofGetHeight()), -10, 0);
		}
        
        
    }
    
    
    
    
    
    
    
    
    
    
	for (int i = 0; i < grass.size(); i++){
		grass[i].resetForce();
        //		grass[i].addRepulsionForce(mouseX, mouseY, 300, 0.7f);
        
		// get the force from the vector field:
        
		ofVec2f frc;
		frc = VF.getForceFromPos(grass[i].pos.x, grass[i].pos.y);
		grass[i].addForce((frc.x/4)+sine/10, (frc.y/4)+sine/10);
	}
	
    
    
	for (int i = 0; i < springs.size(); i++){
		springs[i].update();
	}
    
    
	for (int i = 0; i < grass.size(); i++){
        
        
		grass[i].bounceOffWalls();
		grass[i].addDampingForce();
		grass[i].update();
	}
    
	VF.fadeField(0.5f);
    VF.pushLeft(windForce);
    
    grass[0].pos.set(200,ofGetHeight());
    grass[1].pos.set(240,ofGetHeight());
	

}

//--------------------------------------------------------------
void ofApp::draw(){
    ofBackground(236,234,235);
    
	ofSetColor(210,183,132,30);
    VF.draw();
	
	for (int i = 0; i < particles.size(); i++){
		particles[i].draw();
	}
    
    
	for (int i = 0; i < grass.size(); i++){
        ofSetLineWidth(1.5);
//        ofDrawBitmapString(ofToString(i), grass[i].pos);
//		grass[i].draw();
    
	}
	
    
	for (int i = 0; i < springs.size(); i++){
		springs[i].draw();
	}
    
    
  
    verdana14.drawString(ofToString(windForce) + " mph N", ofGetWidth()/2 -50, 35);
    verdana11.drawString("New York", ofGetWidth()/2 -30, 57);
    
    ofSetLineWidth(1);
    ofLine(0+20, 0+20, 20+20, 20+20);
    ofLine(0+20, 20+20, 20+20, 0+20);
    ofLine(0+20, 10+20, 20+20, 10+20);
    ofLine(10+20, 0+20, 10+20, 20+20);
    
    
    ofLine(ofGetWidth()/2+120, 25, ofGetWidth()/2+140, 25);
    ofLine(ofGetWidth()/2+120, 30, ofGetWidth()/2+140, 30);
    ofLine(ofGetWidth()/2+120, 35, ofGetWidth()/2+140, 35);

}

//--------------------------------------------------------------
void ofApp::exit(){

}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){
    
 	for (int i = 0; i < 1; i++){
		particle p;
		p.setInitialCondition(mouseX, mouseY, 0, 0);
		p.damping = ofRandom(0.07, 0.08);
		particles.push_back(p);
	}
//    VF.addOutwardCircle(touch.x,touch.y, 150, 20) ;
}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){
    
//    VF.addOutwardCircle(touch.x,touch.y, 150, 20) ;
}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){
//    windForce = ofMap(touch.y, 0, ofGetHeight(), .5, 5);
}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::lostFocus(){

}

//--------------------------------------------------------------
void ofApp::gotFocus(){

}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){

}

