<#ftl encoding="utf-8">
<#setting locale="ru_RU">

<#assign security=JspTaglibs["http://www.springframework.org/security/tags"] />
<#assign c=JspTaglibs["http://java.sun.com/jsp/jstl/core"] />
<#assign form=JspTaglibs["http://www.springframework.org/tags/form"]>

<!-- Header -->
<#include "modules/header.ftl">

<!-- Main panel -->
<div class="main signup-success-page">
    <div class="header-container"></div>
    <div class="cart_container">
        <div class="inside">
            <div class="empty">
                <div class="block">
                    <div class="img"><i class="mdi mdi-account"></i></div>
                    <div class="content">
                        <div class="text">Ваш аккаунт успешно подтвержден</div>
                        <div class="sub">Теперь Вы можете войти с помощью данных, которые указывали при регистрации</div>
                        <a href="/signin"><div class="button"><span>Войти</span><i class="mdi mdi-chevron-right"></i></div></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<#include "modules/footer.ftl">





