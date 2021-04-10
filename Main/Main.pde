import java.util.*;
import processing.pdf.*;

void setup() {
  size(1200,600);
  translate(width/2, height/2);
  background(0);
  beginRecord(PDF, "assets/collatz"+java.time.LocalTime.now()+".pdf");

  // Instance of Conjecture
  Conjecture collatz = new Conjecture(400);
  collatz.run();
  
  endRecord();
}
