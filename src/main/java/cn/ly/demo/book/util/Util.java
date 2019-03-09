package cn.ly.demo.book.util;

import org.springframework.stereotype.Component;

@Component
public class Util {

    // 把书籍id转化为EAN13编码
    public static String bookIdToEAN13(String bookId) {
        char[] arr = bookId.toCharArray();
        int[] arrInt = new int[13];
        int startIndex = 12 - arr.length;
        for (int i = 0; i < arr.length; i++) {
            int temp = arr[i] - '0';
            arrInt[startIndex++] = temp;
        }
        int a = 0;
        int b = 0;
        for (int j = 0; j < arrInt.length; j++) {
            if ((j + 1) % 2 == 1) {
                a += arrInt[j];
            } else {
                b += arrInt[j];
            }
        }
        int c = a + 3 * b;
        String tmp = String.valueOf(c);
        char temp = tmp.charAt(tmp.length() - 1);
        int checkCode = 10 - (temp - '0');
        if (checkCode == 10) {
            checkCode = 0;
        }
        arrInt[12] = checkCode;
        StringBuilder res = new StringBuilder();
        for (int in : arrInt) {
            res.append(in);
        }
        return res.toString();
    }

    public static void main(String[] args) {
        String str = bookIdToEAN13("978712126386");
        System.out.println(str);
    }
}
