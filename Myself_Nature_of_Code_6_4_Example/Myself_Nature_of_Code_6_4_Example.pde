

Eenhoorn FlyingEenhoorn;
PVector force; 

void setup() 
{ 
  size(400,400); 
  FlyingEenhoorn = new Eenhoorn(width/2,height/2); 
} 

void draw() 
{ 
  PVector mouse = new PVector(mouseX,mouseY);
  
  FlyingEenhoorn.update(); 
  FlyingEenhoorn.bounce(); 
  FlyingEenhoorn.arrive(mouse);
  FlyingEenhoorn.display(); 
}
