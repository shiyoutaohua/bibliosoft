package cn.ly.demo.base.util;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class MailUtil {
    private String fromAddress = "qingyuehanxi@qq.com";
    private String toAddress = "qingyuehanxi@qq.com";
    private String password = "eiunbpzrotxzbcjh";
    private String mailSubject = "测试邮件";
    private String mailContent = "风吹入帘里，唯有惹衣香。";


    private MimeMessage createSimpleMail(Session session) throws Exception {
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress("qingyuehanxi@qq.com"));
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(toAddress));
        message.setSubject(mailSubject);
        message.setContent(mailContent, "text/html;charset=UTF-8");
        return message;
    }

    public void send() throws Exception {
        Properties prop = new Properties();
        prop.put("mail.host", "smtp.qq.com");
        prop.put("mail.transport.protocol", "smtp");
        prop.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(prop);
        session.setDebug(true);
        Transport ts = session.getTransport();
        ts.connect("smtp.qq.com", fromAddress, password);
        Message message = createSimpleMail(session);
        ts.sendMessage(message, message.getAllRecipients());
        ts.close();
    }


    public String getFromAddress() {
        return fromAddress;
    }

    public void setFromAddress(String fromAddress) {
        this.fromAddress = fromAddress;
    }

    public String getToAddress() {
        return toAddress;
    }

    public void setToAddress(String toAddress) {
        this.toAddress = toAddress;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMailSubject() {
        return mailSubject;
    }

    public void setMailSubject(String mailSubject) {
        this.mailSubject = mailSubject;
    }

    public String getMailContent() {
        return mailContent;
    }

    public void setMailContent(String mailContent) {
        this.mailContent = mailContent;
    }

    public static void main(String[] args) throws Exception {
        MailUtil mailUtil = new MailUtil();
        mailUtil.setMailSubject("hh");
        mailUtil.setMailContent("~~~");
        mailUtil.send();
    }
}
