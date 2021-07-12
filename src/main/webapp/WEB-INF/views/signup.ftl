<#ftl encoding="utf-8">
<#setting locale="ru_RU">

<#assign security=JspTaglibs["http://www.springframework.org/security/tags"] />
<#assign c=JspTaglibs["http://java.sun.com/jsp/jstl/core"] />
<#assign form=JspTaglibs["http://www.springframework.org/tags/form"]>

<!-- Header -->
<#include "modules/header.ftl">

<!-- Main panel -->
<div class="main sign">
    <div class="header-container"></div>
    <div class="sign_container">
        <div class="inside">
            <div class="buttons">
                <@security.authorize access="isAnonymous()">
                    <a href="/signin">
                        <div class="button login">
                            <i class="mdi mdi-account-box"></i>
                            <span>Войти</span>
                        </div>
                    </a>
                </@security.authorize>
                <a>
                <div class="button register active">
                    <i class="mdi mdi-account-multiple-plus"></i>
                    <span>Зарегистрироваться</span>
                </div>
                </a>
            </div>
            <div class="signup">
            <@form.form commandName="signup_form" action="/signup" acceptCharset="UTF-8"  method="post">
                <div class="title">Регистрация</div>
                <div class="inputs">
                    <span class="input input--chisato width">
                        <@form.input class="input__field input__field--chisato" type="text" id="input-13" name="name" path="name" placeholder="Иванов Иван Иванович" />
                        <label class="input__label input__label--chisato" for="input-13">
                            <span class="input__label-content input__label-content--chisato" data-content="ФИО">ФИО</span>
                        </label>
                        <@form.errors path="name" class="error-sub" />
                    </span>
                    <div class="block"></div>
                    <span class="input input--chisato">
                        <@form.input class="input__field input__field--chisato" type="text" id="input-13" name="email" path="email" value="" placeholder="otrajenie@email.com" />
                        <label class="input__label input__label--chisato" for="input-13">
                            <span class="input__label-content input__label-content--chisato" data-content="E-mail">E-mail</span>
                        </label>
                        <@form.errors path="email" class="error-sub" />
                    </span>
                    <span class="input input--chisato">
                        <@form.input class="input__field input__field--chisato" type="text" id="input-13" name="phone" path="phone" value="" placeholder="+7 (917) 12 23 45" />
                        <label class="input__label input__label--chisato" for="input-13">
                            <span class="input__label-content input__label-content--chisato" data-content="Телефон">E-mail</span>
                        </label>
                        <@form.errors path="phone" class="error-sub" />
                    </span>
                    <div class="block"></div>
                    <span class="input input--chisato width">
                        <@form.input class="input__field input__field--chisato" type="text" name="company" path="company" placeholder="Организация" id="input-13" />
                        <label class="input__label input__label--chisato" for="input-13">
                            <span class="input__label-content input__label-content--chisato" data-content="Название организации (необязательное поле)">Название организации (необязательное поле)</span>
                        </label>
                        <@form.errors path="company" class="error-sub" />
                    </span>
                    <div class="block"></div>
                    <span class="input input--chisato">
                        <@form.input class="input__field input__field--chisato" type="password" name="password" path="password" placeholder="Минимум 6 символов" id="input-13" />
                        <label class="input__label input__label--chisato" for="input-13">
                            <span class="input__label-content input__label-content--chisato" data-content="Пароль">Пароль</span>
                        </label>
                        <@form.errors path="password" class="error-sub" />
                    </span>
                    <span class="input input--chisato">
                        <@form.input class="input__field input__field--chisato" type="password" name="confirmPassword" path="confirmPassword" id="input-13" />
                        <label class="input__label input__label--chisato" for="input-13">
                            <span class="input__label-content input__label-content--chisato" data-content="Подтвердите пароль">Подтвердите пароль</span>
                        </label>
                        <@form.errors path="confirmPassword" class="error-sub" />
                    </span>
                    <div class="block"></div>
                    <div class="partner">
                        <div class="pretty success circle smooth">
                            <input onchange="partnerPanelShow()" id="check" name="partner" type="checkbox">
                            <label><i class="mdi mdi-check"></i>Стать партнером</label>
                        </div>
                        <div class="text">Становясь нашим партнером, Вы будете получить партнерские цены на все товары, представленные в нашем магазине. <a href="#" class="more">Узнать подробнее</a></div>
                        <div class="box">
                            <div class="head">Файл идентификации</div>
                            <div class="text">Вам необходимо отправить нам файл идентификации Вашей компании, пожалуйста, загрузите его, нажав на кнопку ниже:</div>
                            <div class="js">
                                <input type="file" onchange="uploadPartnerFile()" name="file-2[]" id="partnerFile" class="inputfile inputfile-2" data-multiple-caption="{count} files selected" multiple />
                                <label for="partnerFile"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg> <span>Выберите файл&hellip;</span></label>
                            </div>
                        </div>
                    </div>
                    <div class="block"></div>
                    <div class="pretty success circle smooth data">
                        <input id="check" name="partner" type="checkbox">
                        <label><i class="mdi mdi-check"></i>Я согласен на обработку данных<a href="/">Ознакомиться с положением</a></label>
                    </div>
                    <div class="block"></div>
                    <div class="button" onclick="document.getElementById('signup_form').submit();">Зарегистрироваться</div>

                </div>
            </@form.form>
            </div>
        </div>
    </div>
</div>

<#include "modules/footer.ftl">
