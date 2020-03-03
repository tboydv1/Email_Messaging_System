import com.mailer.service.emailservice.EmailService;
import com.mailer.entities.Client;
import com.mailer.entities.Message;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class EmailServiceImplTest {


    @Autowired
    EmailService emailServiceImpl;


    @Test
    public void sendSampleMailTest(){

        Message message = new Message();
        message.setSubject("Test subject ");
        message.setBody("Test Body ");

        Client recipient = new Client();
        recipient.setEmail("tboydv1@gmail.com");

        emailServiceImpl.sendSimpleMessage(message, recipient);


    }

    public static void main(String[] args) {

        SpringApplication.run(EmailServiceImplTest.class);
    }

}
