public class Calculator2 {
  integer a, b;

  public void accept(integer x, integer y) {
    a = x;
    b = y;
  }

  public integer getSummation() {
    // integer i = a + b;
    // return i;
    return a + b;
  }

  public integer getDiffence() {
    // integer i = a + b;
    // return i;
    return a - b;
  }
  public integer getProduct() {
    return a * b;
  }

  public integer getQuotient() {
    // integer i = a + b;
    // return i;
    return a / b;
  }
}
