
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

class Branch extends Hierarchy<Integer>{
  private int seed = 0;
  private ArrayList<Integer> value = new ArrayList<Integer>();
  public Colour colour = new Colour(126,52,250);
  public float angle = PI/32;
  
  void set(Integer val) {
    this.seed++;
    colour.r = this.rand(40);
    colour.g = this.rand(140);
    colour.b = this.rand(255);
    this.value.add(val);
  }
  
  int seed() {
    return this.seed;
  }
  
  ArrayList<Integer> value() {
    return this.value;
  }
  
  int rand(int max) {
    return (int)(Math.random() * max) + 1;
  }
}

class Colour {
  int r,g,b;
  Colour(int r, int g, int b) {
    this.r = r;
    this.g = g;
    this.b = b;
  }
}
