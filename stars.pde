PShape stars() {
    stars = createShape();
    stars.beginShape();
    stars.fill(255);

    for (int i = 0; i < 100; i++) {
        float x = random(width);
        float y = random(height);
        float diameter = random(1, 5);
        ellipse(x, y, diameter, diameter);
        // stars.vertex(x, y);
        // stars.vertex(x + diameter, y);
        // stars.vertex(x, y + diameter);
    }

    stars.endShape();
    return stars;
}