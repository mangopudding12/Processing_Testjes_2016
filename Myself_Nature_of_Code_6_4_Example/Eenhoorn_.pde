
class Eenhoorn 
{
  
  PImage afbeelding; 
  PVector location; 
  PVector acceleration; 
  PVector velocity; 
  float   maxspeed; 
  float   maxforce; 
  float   BL;   // Lengte & Breedte van Plaatje       
  
   Eenhoorn(float x_, float y_)
   {
     location = new PVector(x_,y_);
     acceleration = new PVector(0,0);
     velocity = new PVector(0,0);
     BL = 80; 
     
     maxspeed = 4; 
     maxforce = 0.1; 
     
     afbeelding = loadImage("Eenhoorn.png");
   }
  
  void update()
  {
    velocity.add(acceleration); 
    velocity.limit(maxspeed);
    location.add(velocity);
    
    acceleration.mult(0); // anders wordt velocity telkens hoger en hoger tot de maxspeed 
  } 
  
  void applyForce(PVector force_) 
  {
    acceleration.add(force_);
  }
  
  void arrive (PVector target) 
  {
    PVector behoefde = PVector.sub(target,location); 
    float d = behoefde.mag(); // lengte van de afstand dat word gelijk gezet met d 
    behoefde.normalize();
    
    if (d < 60)
    {
      float m = map(d,0,60,0,maxspeed); // Verdeel maxspeed tussen 60 en 0 en geef zo een waarde aan M 
      behoefde.mult(m);
      println(m);
      
    } else { 
       behoefde.mult(maxspeed); 
    }
  
    PVector stuurkracht = PVector.sub(behoefde,velocity); 
    stuurkracht.limit(maxforce); 
    applyForce(stuurkracht);
    
  }
  
  void bounce()
  {
      if(location.x < 0 + (BL/4) || location.x > width - (BL/4))
      {
         velocity.x *= -1; 
      }
      
      
      if (location.y < 0 +(BL/2) || location.y > height-(BL/2))
      { 
        velocity.y *= -1; 
      }
      
      if (location.y < -4 + (BL/2) || location.x < -4 + (BL/4) || location.x > width+4 - (BL/4) || location.y > height +4 -(BL/2))
      {
         location.y = height/2 - (BL/2); 
         location.x = width/2 -(BL/2); 
      }
  }
  
  void display() 
  {   
 //     println(velocity);
      image(afbeelding,location.x -(BL/2),location.y -(BL/2) ,BL,BL);
  } 
    
}
