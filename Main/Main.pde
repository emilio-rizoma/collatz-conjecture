import java.util.*;
import processing.pdf.*;

void setup() {
  size(1200,600);
  beginRecord(PDF, "assets/collatz"+java.time.LocalTime.now()+".pdf");
  translate(width/2, height/2);
  background(0);
  // Instance of Conjecture
  Conjecture collatz = new Conjecture(400);
  collatz.run();
  
  endRecord();
}
