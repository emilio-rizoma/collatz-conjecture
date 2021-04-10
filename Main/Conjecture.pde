
/* Conjecture Class
*
*  This class is used to translate the output of the
*  Collatz Class to drawable content.
*
*/
class Conjecture {
  Collatz conjecture = new Collatz();
  int count = 1000;
  int shape = 32;
  
  Conjecture(int count) {
    this.count = count;
    this.feed();
  }
  
  Conjecture(int count, int shape) {
    this.count = count;
    this.shape = shape;
    this.feed();
  }
  
  /* feed() Method
  *
  *  This method builds the Collatz Tree.
  *  
  */
  private void feed() {
    do {
      this.conjecture.calc(this.count);
      this.count--;
    } while (this.count > 1);
    println("Finished feeding Collatz");
  }
  
  /* void run()
  *
  *  This method draws the Collatz Tree over the canvas.
  *  
  */
  void run() {
    
    // This loop iterate the Tree arraylist of Branches
    for (int i = 0; i < conjecture.tree.value().size(); i++) {
      
      // Gets the current branch
      Branch branch = conjecture.tree.value().get(i);
      
      // Gets the current range to map the values
      int range = conjecture.tree.seed() * branch.value().size();
      
      // Resets the drawing position to the initial value in order
      // to draw each branch starting from here.
      resetMatrix();
      translate(width/2, height/2);
      
      // This loop iterate the current Branch arraylist.
      for (int j = 0; j < branch.value().size(); j++) {
        
        // Gets the value of each Collatz iteration
        Integer val = (int) map(branch.value().get(j), 1, range * 1/8, 0, height );
        
        // Need to do this to change tha angle of the canvas.
        // It uses the same Collatz Algorith to determine
        // what is the next rotation angle to draw.
        if(val % 2 == 0) {
          rotate(PI/branch.rand(shape));
        } else {
          rotate(-PI/branch.rand(shape));
        }
        
        // Gets the branch color.
        Colour c = branch.colour;
        
        // Updates the color of the stroke and draw lines over the canvas.
        stroke(c.r, c.g, c.b, 60);
        line(0,0,0, -val);
        
        // This change the drawing position to the last value of the line.
        // This is done to keep moving across the canvas when working
        // with the current values of this branch.
        translate(0, -val);
      }
    }
  }
  
}
