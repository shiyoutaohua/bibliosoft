package cn.ly.demo.book.util;

import com.google.zxing.*;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.HybridBinarizer;
import org.springframework.stereotype.Component;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;

@Component
public class BarCodeHelper {
    public static String createBookBarcode(String barcodeImgPath, String bookId) {
        String contents = Util.bookIdToEAN13(bookId);
        int width = 105, height = 50;
        encode(contents, width, height, barcodeImgPath);
        return contents;
    }

    // 绘制条形码
    public static void encode(String contents, int width, int height, String imgPath) {
        int codeWidth = 3 + // start guard
                (7 * 6) + // left bars
                5 + // middle guard
                (7 * 6) + // right bars
                3; // end guard
        codeWidth = Math.max(codeWidth, width);
        try {
            BitMatrix bitMatrix = new MultiFormatWriter().encode(contents, BarcodeFormat.EAN_13, codeWidth, height, null);
            File file = new File(imgPath);
            File parentPath = file.getParentFile();
            if (!parentPath.exists()) {
                parentPath.mkdirs();
            }
            FileOutputStream out = new FileOutputStream(file);
            MatrixToImageWriter.writeToStream(bitMatrix, "png", out);
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 识别条形码
    public static String decode(String imgPath) {
        BufferedImage image = null;
        Result result = null;
        try {
            image = ImageIO.read(new File(imgPath));
            if (image == null) {
                System.out.println("The image may be not exit.");
            }
            LuminanceSource source = new BufferedImageLuminanceSource(image);
            BinaryBitmap bitmap = new BinaryBitmap(new HybridBinarizer(source));
            result = new MultiFormatReader().decode(bitmap, null);
            return result.getText();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        String imgPath = "C:\\Resources\\IDEA\\project\\112.png";
        String contents = "0000000000017";
        int width = 105, height = 50;
        encode(contents, width, height, imgPath);
        String str = decode(imgPath);
        System.out.println(str);
    }

}