<#ftl encoding="utf-8">
<#setting locale="ru_RU">

<#assign security=JspTaglibs["http://www.springframework.org/security/tags"] />
<#assign c=JspTaglibs["http://java.sun.com/jsp/jstl/core"] />
<#assign form=JspTaglibs["http://www.springframework.org/tags/form"]>

<!-- Header -->
<#include "modules/header.ftl">

<!-- Main panel -->
<div class="main place sign">
    <div class="header-container"></div>
    <div class="place_container">
        <div class="inside">
            <div class="buttons">
                <a href="/cart">
                    <div class="button">
                        <i class="mdi mdi-cart"></i>
                        <span>Корзина</span>
                    </div>
                </a>
                <a>
                    <div class="button active">
                        <i class="mdi mdi-image-filter-none"></i>
                        <span>Ввод данных</span>
                    </div>
                </a>
                <a>
                    <div class="button nohover">
                        <i class="mdi mdi-bookmark-check"></i>
                        <span>Подтверждение</span>
                    </div>
                </a>
            </div>
            <div class="signup">
                <@form.form method="POST" id="placeorder_form" action="/placeorder/confirm">
                    <div class="title">Ввод данных</div>
                    <div class="inputs">
                        <span class="input input--chisato <#if error??>input--wrong</#if>">
                            <input class="input__field input__field--chisato" type="text" id="input-13" name="email" placeholder="otrajenie@email.com" />
                            <label class="input__label input__label--chisato" for="input-13">
                                <span class="input__label-content input__label-content--chisato" data-content="E-mail">E-mail</span>
                            </label>
                        </span>
                        <div class="block"></div>
                        <div class="button" onclick="document.getElementById('placeorder_form').submit();">Подтвердить</div>
                    </div>
                </@form.form>
            </div>
        </div>
    </div>
</div>

<#include "modules/footer.ftl">
