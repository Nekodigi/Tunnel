float dtheta;//delta theta
float dr = 100;//distance between ring
int n = 5;//n polygon
int nd = 20;//n depth
float r;
ArrayList<Polygon> polygons = new ArrayList<Polygon>();

void setup(){
  size(500, 500, P3D);
  colorMode(HSB, 360, 100, 100, 100);
  r=width;
  stroke(360, 30);
  //noStroke();
}

void draw(){
  background(360);
  //lights();
  directionalLight(0, 0, 100, 1, 1, -2);
  translate(width/2, height/2);
  //dtheta = map(mouseX, 0, width, -PI, PI);//TWO_PI/n/2
  dtheta = float(frameCount)/300-PI+PI/n*2;
  ArrayList<Polygon> polygons = new ArrayList<Polygon>();
  for(int i=0; i<nd; i++){
    ArrayList<PVector> temp = polygon(n, r, dtheta*i);
    ArrayList<PVector> tempNext = polygon(n, r, dtheta*(i+1));
    for(int j=0; j<temp.size(); j++){
      temp.get(j).add(new PVector(0, 0, -dr*i));
      tempNext.get(j).add(new PVector(0, 0, -dr*(i+1)));
    }
    color col = color(map(i, 0, nd, 0, 360), 60, 100);
    for(int j=0; j<temp.size(); j++){
      Polygon polygon = new Polygon(col);
      polygon.vertices.add(temp.get(j));
      polygon.vertices.add(temp.get((j+1)%temp.size()));
      polygon.vertices.add(tempNext.get(j));
      polygons.add(polygon);
      polygon = new Polygon(col);
      polygon.vertices.add(temp.get(j));
      polygon.vertices.add(tempNext.get(j));
      polygon.vertices.add(tempNext.get((j+temp.size()-1)%temp.size()));
      polygons.add(polygon);
    }
  }
  
  for(Polygon polygon : polygons){
    polygon.show();
  }
}

ArrayList<PVector> polygon(int n, float r, float thetaoff){
  ArrayList<PVector> results = new ArrayList<PVector>();
  for(int i=0; i<n; i++){
    float theta = map(i, 0, n, 0, TWO_PI) + thetaoff;
    results.add(PVector.fromAngle(theta).mult(r));
  }
  return results;
}
