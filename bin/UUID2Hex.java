import java.util.Scanner;

public class UUID2Hex {
  /** Main method */
  public static void main(String[] args) {

    // Create a Scanner
    Scanner input = new Scanner(System.in);
    
    // Prompt the user to enter a decimal integer
    System.out.print("Enter a UUID: ");
    String str = input.next();
    System.out.println(str);

    //byte[] bytes = hexStringToByteArray("96d6965cc2794f6885c67b081a4f5287");//bad
    //byte[] bytes = hexStringToByteArray("2d33b1e6640b4800b39e6b81d0cc1f79");//good
    byte[] bytes = hexStringToByteArray(str);

    // Most significant 64 bits
    long msb=    ((((long) bytes[0]) & 0xFF) << 56)
         + ((((long) bytes[1]) & 0xFF) << 48)
         + ((((long) bytes[2]) & 0xFF) << 40)
         + ((((long) bytes[3]) & 0xFF) << 32)
         + ((((long) bytes[4]) & 0xFF) << 24)
         + ((((long) bytes[5]) & 0xFF) << 16)
         + ((((long) bytes[6]) & 0xFF) << 8)
         + ((((long) bytes[7]) & 0xFF));
         // Least significant 64 bits
     long lsb=    ((((long) bytes[8]) & 0xFF) << 56)
         + ((((long) bytes[9]) & 0xFF) << 48)
         + ((((long) bytes[10]) & 0xFF) << 40)
         + ((((long) bytes[11]) & 0xFF) << 32)
         + ((((long) bytes[12]) & 0xFF) << 24)
         + ((((long) bytes[13]) & 0xFF) << 16)
         + ((((long) bytes[14]) & 0xFF) << 8)
         + ((((long) bytes[15]) & 0xFF));
    System.out.println("msb: " + msb);
    System.out.println("lsb: " + lsb);

    char[] retval = new char[36];
    hex4(retval, 0, msb >>> 48);
    hex4(retval, 4, msb >>> 32);
    retval[8]  = '-';
    hex4(retval, 9, msb >>> 16);
    retval[13] = '-';
    hex4(retval, 14, msb);
    retval[18] = '-';
    hex4(retval, 19, lsb >>> 48);
    retval[23] = '-';
    hex4(retval, 24, lsb >>> 32);
    hex4(retval, 28, lsb >>> 16);
    hex4(retval, 32, lsb);
    //return new String(retval);
    System.out.println(retval);
  }

  private static final void hex4(char[] c, int index, long value) {
      for (int i = 0; i < 4; i++) {
          long v = (value >>> (12 - i * 4)) & 0xf;
          if (v < 10) {
              c[index + i] = (char) (v + '0');
          } else {
              c[index + i] = (char) (v - 10 + 'a');
          }
      }
  }

  public static byte[] hexStringToByteArray(String s) {
      int len = s.length();
      byte[] data = new byte[len / 2];
      for (int i = 0; i < len; i += 2) {
          data[i / 2] = (byte) ((Character.digit(s.charAt(i), 16) << 4)
                               + Character.digit(s.charAt(i+1), 16));
      }
      return data;
  }

}
