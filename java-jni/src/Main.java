/* polyglot programming with GnuCOBOL, SWIG and Java */

public class Main {

  public static void main(String argv[]) throws Exception {
    // this instruction load libpolyglot.so https://docs.oracle.com/javase/8/docs/technotes/guides/jni/spec/design.html
    System.loadLibrary("polyglot");
    polyglot.polyglot();
  }
}