PShape stars;

float earthX;
float earthY;
float angle;

boolean paused = false;

void setup() {
    size(800, 800);
    angle = 0;
    background(0);
    // stars = loadShape("stars.pde");
    stars = stars();
}

void draw() {
    clear();
    shape(stars);
    

    //Print the angle value
    fill(255);
    textSize(25);
    text("Angle: " + angle, width - 180, 20);
    text("cos: " + cos(angle), width - 180, 45);
    text("sin: " + sin(angle), width - 180, 70);
    
    translate(width / 2, height / 2);
    
    //Draw the sun
    fill(255, 255, 0);
    ellipse(0, 0, 50, 50);
    
    //Calculate the Earth's orbit
    earthX = 300 * cos(angle);
    earthY = 300 * sin(angle);
    
    //Draw the Earth
    fill(0, 0, 255);
    ellipse(earthX, earthY, 20, 20);
    
    //to increase the angle by 0.005
    angle += 0.02;
}

void keyPressed() {
    if (key == ' ') {
        if (paused) {
            loop();
            paused = false;
        } else {
            noLoop();
            paused = true;
        }
    }
}