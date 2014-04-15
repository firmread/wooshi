#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){
    
	ofSetVerticalSync(true);
	ofSetFrameRate(60);
	ofEnableAlphaBlending();
	
	for (int i = 0; i < 30; i++){
		particle p;
		p.setInitialCondition(ofRandom(ofGetWidth()), ofRandom(ofGetHeight()), 0, 0);
		p.damping = ofRandom(0.07, 0.08);
		particles.push_back(p);
	}
    
	VF.setupField(ofGetWidth()/20, ofGetHeight()/20,ofGetWidth(), ofGetHeight());

    
    
    
	particle myParticle;
    

	myParticle.setInitialCondition(500,ofGetHeight(),0,0);
	grass.push_back(myParticle);
	
	myParticle.setInitialCondition(540,ofGetHeight(),0,0);
	grass.push_back(myParticle);
	
	myParticle.setInitialCondition(500,ofGetHeight()-100,0,0);
	grass.push_back(myParticle);
	
	myParticle.setInitialCondition(540,ofGetHeight()-100,0,0);
	grass.push_back(myParticle);
	
	myParticle.setInitialCondition(500,ofGetHeight()-200,0,0);
	grass.push_back(myParticle);
	
	myParticle.setInitialCondition(540,ofGetHeight()-200,0,0);
	grass.push_back(myParticle);

    
    
    
	spring mySpring;
    
	for (int i = 0; i < grass.size(); i++){
		mySpring.distance		= grass[i].pos.distance(grass[(i+1) %grass.size()].pos);
		mySpring.springiness	= 0.2f;
		mySpring.particleA = & (grass[i  ]);
		mySpring.particleB = & (grass[(i+1) % grass.size()]);
		springs.push_back(mySpring);
	}
	
	
	// these hold the shape together:

        mySpring.distance = (grass[0].pos - grass[2].pos).length();
        mySpring.springiness = 0.2f;
        mySpring.particleA = &(grass[0]);
        mySpring.particleB = &(grass[2]);
        springs.push_back(mySpring);
        
        mySpring.distance = (grass[1].pos - grass[3].pos).length();
        mySpring.springiness = 0.2f;
        mySpring.particleA = &(grass[1]);
        mySpring.particleB = &(grass[3]);
        springs.push_back(mySpring);

}

//--------------------------------------------------------------
void testApp::update(){
    
    
	for (int i = 0; i < particles.size(); i++){
		particles[i].resetForce();
	}
    
	for (int i = 0; i < particles.size(); i++){
		
//		particles[i].addAttractionForce(-500, particles[i].initialY, 2000, 2);
		//particles[i].addRepulsionForce(mouseX, mouseY, 125, 2.5);
        
        if (particles[i].pos.x > ofGetWidth()-20) {
            particles[i].vel.x -=1;
        }
        
		// get the force from the vector field:
		ofVec2f frc;
		frc = VF.getForceFromPos(particles[i].pos.x, particles[i].pos.y);
		particles[i].addForce(frc.x, frc.y);
		
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
		grass[i].addForce(frc.x/2, frc.y/2);
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
    VF.pushLeft(3);
    
    grass[0].pos.set(500,ofGetHeight());
    grass[1].pos.set(540,ofGetHeight());
	
    
}

//--------------------------------------------------------------
void testApp::draw(){
    ofBackground(0);
    
	ofSetColor(0,130,130, 200);
    VF.draw();
	
	for (int i = 0; i < particles.size(); i++){
		particles[i].draw();
	}
    
    
	for (int i = 0; i < grass.size(); i++){
        ofDrawBitmapString(ofToString(i), grass[i].pos);
		grass[i].draw();
	}
	
    
	for (int i = 0; i < springs.size(); i++){
		springs[i].draw();
	}
}

//--------------------------------------------------------------
void testApp::keyPressed(int key){

}

//--------------------------------------------------------------
void testApp::keyReleased(int key){

}

//--------------------------------------------------------------
void testApp::mouseMoved(int x, int y ){

}

//--------------------------------------------------------------
void testApp::mouseDragged(int x, int y, int button){
    
    VF.addOutwardCircle(x,y, 150, 20) ;
}

//--------------------------------------------------------------
void testApp::mousePressed(int x, int y, int button){
    
    VF.addOutwardCircle(x,y, 150, 20) ;
}

//--------------------------------------------------------------
void testApp::mouseReleased(int x, int y, int button){

}

//--------------------------------------------------------------
void testApp::windowResized(int w, int h){

}

//--------------------------------------------------------------
void testApp::gotMessage(ofMessage msg){

}

//--------------------------------------------------------------
void testApp::dragEvent(ofDragInfo dragInfo){ 

}
