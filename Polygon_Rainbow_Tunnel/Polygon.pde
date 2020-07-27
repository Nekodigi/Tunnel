class Polygon{
  ArrayList<PVector> vertices = new ArrayList<PVector>();
  color col;
  
  Polygon(color col){
    this.col = col;
  }
  
  void show(){
    fill(col);
    beginShape();
    for(PVector p : vertices){
      //point(p.x, p.y, p.z);
      vertex(p.x, p.y, p.z);
    }
    endShape(CLOSE);
  }
}
