package ru.dm.shop.entity;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import ru.dm.shop.validator.FieldEquals;
import ru.dm.shop.validator.UniqueEmail;
import ru.dm.shop.validator.UniqueUsername;


import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@FieldEquals(field = "password", equalsTo = "confirmPassword")
public class SignUpForm {
    @Size(min = 3, max = 40, message = "")
    @NotEmpty(message = "Введите Ваше имя")
    private String name;

    @Size(min = 1, max = 80, message = "")
    private String company;

    @Email(regexp = ".+@.+", message = "Введите правильный email")
    @NotEmpty(message = "")
    @UniqueEmail
    private String email;

    @Size(min = 6, max = 20, message = "")
    @NotEmpty(message = "Введите номер телефона")
    private String phone;

    @Size(min = 6, max = 20, message = "")
    @NotEmpty(message = "Введите пароль (длина больше 6)")
    private String password;

    @Size(min = 6, max = 20, message = "")
    @NotEmpty(message = "Подтвердите пароль")
    private String confirmPassword;

    public String getRole() {
        return "ROLE_USER";
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

}