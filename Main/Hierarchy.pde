
/* Hierarchy Abstract Class
*
*  This class shows the structure to build heararchies
*/
abstract class Hierarchy<T> {
  private int seed;
  private ArrayList<T> value;
  abstract void set(T val);
  abstract int seed();
  abstract ArrayList<T> value();
}

/* Tree Class
*
*  This class simulates a tree with branches inside
*/
class Tree extends Hierarchy<Branch> {
  private int seed = 0;
  private ArrayList<Branch> value = new ArrayList<Branch>();
  
  void set(Branch val) {
    this.seed++;    
    this.value.add(val);
  }
  
  int seed() {
    return this.seed;
  }
  
  ArrayList<Branch> value() {
    return this.value;
  }
}

/* Branch Class
*
*  This class simulates a branch
*/
class Branch extends Hierarchy<Integer>{
  private int seed = 0;
  private ArrayList<Integer> value = new ArrayList<Integer>();
  public Colour colour = new Colour( 2.0, 8.0, 2.0 );
  
  public float angle = PI/32;
  
  void set(Integer val) {
    this.seed++;
/*
    colour.r = this.rand(colour.r);
    colour.g = this.rand(colour.g);
    colour.b = this.rand(colour.b);
*/
    this.value.add(val);
  }
  
  int seed() {
    return this.seed;
  }
  
  ArrayList<Integer> value() {
    return this.value;
  }
 
}

/* Colour Class
*
*  This class is an rgb object
*/
class Colour {
  int r,g,b;
  
  Colour(float _r, float _g, float _b) {
    this.r = this.frac(_r);
    this.g = this.frac(_g);
    this.b = this.frac(_b);
  }
  
  private int frac(float num) {
    float val = 255 * (1.0/num);
    return this.rand((int) val);
  }
  
  private int rand(int max) {
    return (int)(Math.random() * max) + 1;
  }
   
}
