
/* Collatz Class
*
*  This class encapsulate Collatz Algorithm and the structure
*  to build and handle a Tree a list of Branches;
*/
class Collatz {
  
  // A Tree with its Branches
  Tree tree = new Tree();
  
  // A branch to handle current event
  Branch branch = new Branch();

  /* Collatz Algorithm
  *
  *  This method is recursive since no matter what is the 
  *  value of n the sequence will always reach 1.
  *
  */  
  Integer calc (Integer n) {
    
    // Adds a new integer to current branch;
    this.branch.set(n);
    
    // Checks if the algorithm has finished
    if (n == 1) {
      Collections.reverse(this.branch.value());
      this.tree.set(this.branch);
      this.reset();
      return n;
    }

    // Collatz Algorithm with recursive calls
    if (n % 2 == 0) {
      return calc(n/2);
    } else {
      return calc(3*n + 1);
    }
  }
  
  // Resets the current branch
  void reset() {
    this.branch = new Branch();
  } 
}
