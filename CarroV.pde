public class CarroV{
  
  PImage img;
  public float x; 
  public float y;
  
  public CarroV(PImage img, float x, float y){
    this.x = x;
    this.y = y;
    this.img = img; 
  }
  
   public float getX() {
    return this.x;
  }
  
  public void mover(float novoX){
    this.x = novoX;
  }
  
   
  public void desenhar() {
   img.resize(30, 0);
   image(img, x, y);
  }
  
  
  
  
  
}
