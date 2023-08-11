package cn.youth.datacollection.util;

import org.apache.commons.codec.binary.Hex;
import org.apache.log4j.Logger;

import javax.crypto.Cipher;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;
import java.io.BufferedReader;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;

/**
 * @version V1.0
 * @ClassName: SecUtil
 * @Description: 加密 解密 数据库信息
 */
public class SecUtil {

    private static final Logger logger = Logger.getLogger(SecUtil.class.getName());

    /**
     * 自定义 KEY
     */
    private static byte[] keybytes = {0x31, 0x32, 0x33, 0x34, 0x35, 0x50,
            0x37, 0x38, 0x39, 0x40, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46};

    public static void main(String[] args) {
        BufferedReader reader;
        /*try {
            String st = "rep=10.11_MYSQL&user=admin&pass=admin&trans=183";
            System.out.println("加密前:" + st.trim());
         String mi=   encrypt(st.trim());
            System.out.println("加密后:" + mi + "\n\n");

            System.out.println("解密后:" + decrypt(mi.trim()) + "\n\n");

        } catch (Exception e) {
            logger.error(e);
        }*/
        String str = "97d370940e5283785bbf0f5260a3cdfe0d4be8cf418cf6d9e51236b9397a489c15cb30b476766b3cd91d86024708cbf0";
        System.out.println("解密后:" + decrypt(str.trim()) + "\n\n");
    }


    /**
     * @param @param  value
     * @param @return 设定文件
     * @return String    返回类型
     * @throws
     * @Title: encrypt
     * @author yunlin.liu
     * @Description: 加密
     */
    public static String encrypt(String value) {

        String s = null;

        int mode = Cipher.ENCRYPT_MODE;

        try {
            Cipher cipher = initCipher(mode);

            byte[] outBytes = cipher.doFinal(value.getBytes());

            s = String.valueOf(Hex.encodeHex(outBytes));
        } catch (Exception e) {
            logger.error(e);
        }

        return s;
    }


    /**
     * @param @param  value
     * @param @return 设定文件
     * @return String    返回类型
     * @throws
     * @Title: decrypt
     * @author yunlin.liu
     * @Description: 解密
     */
    public static String decrypt(String value) {
        String s = null;

        int mode = Cipher.DECRYPT_MODE;

        try {
            Cipher cipher = initCipher(mode);

            byte[] outBytes = cipher
                    .doFinal(Hex.decodeHex(value.toCharArray()));

            s = new String(outBytes);
        } catch (Exception e) {
            logger.error(e);
        }

        return s;
    }


    /**
     * @param @param  mode
     * @param @return
     * @param @throws NoSuchAlgorithmException
     * @param @throws NoSuchPaddingException
     * @param @throws InvalidKeyException    设定文件
     * @return Cipher    返回类型
     * @throws
     * @Title: initCipher
     * @author yunlin.liu
     * @Description: 初始化密码
     */
    private static Cipher initCipher(int mode) throws NoSuchAlgorithmException,
            NoSuchPaddingException, InvalidKeyException {
        Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
        Key key = new SecretKeySpec(keybytes, "AES");
        cipher.init(mode, key);
        return cipher;
    }
}
