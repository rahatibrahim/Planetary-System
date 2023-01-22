PShape orbitalLine;
Star[] stars;
float earthX;
float earthY;
float angle;

boolean paused = false;

void setup() {
    size(900, 900);
    angle = 0;
    background(0);
    
    // Generating stars for the background
    stars = generateStars(50);

    // Creating the orbit line
    orbitalLine = createShape();
    orbitalLine.beginShape();
    orbitalLine.noFill();
    orbitalLine.stroke(255, 255, 255);
    orbitalLine.strokeWeight(2);
    orbitalLine.endShape();
}

void draw() {
    clear();
    
    for (int i = 0; i < stars.length; i++) {
        fill(stars[i].colorVar);
        ellipse(stars[i].x, stars[i].y, stars[i].diameter, stars[i].diameter);
    }
    
    // Print the value
    // fill(255);
    // textSize(25);
    // text("Angle: " + angle, width - 180, 20);
    // text("cos: " + cos(angle), width - 180, 45);
    // text("sin: " + sin(angle), width - 180, 70);
    
    translate(width / 2, height / 2);
    
    // Draw the sun
    fill(255, 255, 0);
    ellipse(0, 0, 50, 50);
    
    // Calculate the Earth's orbit
    earthX = 350 * cos(angle);
    earthY = 350 * sin(angle);

    // Draw the orbital line
    orbitalLine.vertex(earthX, earthY);
    shape(orbitalLine);
    
    // Draw the Earth
    fill(0, 0, 255);
    ellipse(earthX, earthY, 20, 20);
    
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

Star[] generateStars(int starAmount) {
    Star[] stars = new Star[starAmount];
    
    for (int i = 0; i < starAmount; i++) {
        float x = random(width);
        float y = random(height);
        float diameter = random(1, 5);
        color colorVar = color(255, 255, 255);
        stars[i] = new Star(x, y, diameter, colorVar);
    }
    
    return stars;
}
