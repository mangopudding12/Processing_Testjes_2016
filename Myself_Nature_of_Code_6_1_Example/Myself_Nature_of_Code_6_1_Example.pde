

Eenhoorn FlyingEenhoorn;
PVector force; 

void setup() 
{ 
  size(400,400); 
  FlyingEenhoorn = new Eenhoorn(width/2,height/2); 
  
  //force = new PVector(0.05,0);
} 

void draw() 
{ 
  PVector mouse = new PVector(mouseX,mouseY);
  
  FlyingEenhoorn.update(); 
  FlyingEenhoorn.seek(mouse);
  //FlyingEenhoorn.applyForce(force);
  FlyingEenhoorn.display(); 
}
