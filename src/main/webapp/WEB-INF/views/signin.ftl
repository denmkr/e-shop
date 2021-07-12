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
                    <a>
                        <div class="button login active">
                            <i class="mdi mdi-account-box"></i>
                            <span>Войти</span>
                        </div>
                    </a>
                </@security.authorize>
                <a href="/signup">
                    <div class="button register">
                        <i class="mdi mdi-account-multiple-plus"></i>
                        <span>Зарегистрироваться</span>
                    </div>
                </a>
            </div>
            <div class="signin">
            <@form.form id="signin_form" action="j_spring_security_check" acceptCharset="UTF-8" method="POST">
                <div class="title">Вход</div>
                <div class="inputs">
                    <span class="input input--chisato <#if error??>input--wrong</#if>">
                        <input class="input__field input__field--chisato" type="text" id="input-13" name="j_username" placeholder="otrajenie@email.com" />
                        <label class="input__label input__label--chisato" for="input-13">
                            <span class="input__label-content input__label-content--chisato" data-content="E-mail">E-mail</span>
                        </label>
                        <i class="mdi mdi-account"></i>
                    </span>
                    <div class="block"></div>
                    <span class="input input--chisato <#if error??>input--wrong</#if>">
                        <input class="input__field input__field--chisato" type="password" id="input-13" name="j_password" />
                        <label class="input__label input__label--chisato" for="input-13">
                            <span class="input__label-content input__label-content--chisato" data-content="Пароль">Пароль</span>
                        </label>
                        <i class="mdi mdi-lock"></i>
                    </span>
                    <div class="block"></div>
                    <div class="wrong_data-container">
                        <#if error??>
                            <div class="wrong_data">Неправильный логин или пароль</div>
                        </#if>
                    </div>
                    <input style="display: none;" type="checkbox" name="remember-me" checked="checked" />
                    <div class="button" onclick="document.getElementById('signin_form').submit();">Войти</div>
                </div>
            </@form.form>
            </div>
        </div>
    </div>
</div>

<#include "modules/footer.ftl">
