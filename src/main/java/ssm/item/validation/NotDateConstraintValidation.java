package ssm.item.validation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import ssm.item.pojo.Material;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.lang.reflect.Method;
import java.sql.Time;
import java.util.Date;

public class NotDateConstraintValidation implements ConstraintValidator<NotDate, Date> {
    @Override
    public void initialize(NotDate notDate) {
    }

    @Override
    public boolean isValid(Date date, ConstraintValidatorContext context) {
        System.out.println(date==null);
        if (date==null){
            return true;
        }else {
           return false;
       }
    }
}
