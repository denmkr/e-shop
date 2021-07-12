<#ftl encoding="utf-8">
<#setting locale="ru_RU">

<#assign security=JspTaglibs["http://www.springframework.org/security/tags"] />
<#assign c=JspTaglibs["http://java.sun.com/jsp/jstl/core"] />
<#assign form=JspTaglibs["http://www.springframework.org/tags/form"]>

<!-- Header -->
<#include "modules/header.ftl">

<div class="pre-loader-container">
    <div class="pre-loader">
        <div class="logo">
            <img style="width: 140px;" src="/resources/images/logo_blue.png">
        </div>
        <div class="rings">
            <div class="ring"></div>
            <div class="ring"></div>
            <div class="ring"></div>
        </div>
    </div>

</div>

<!-- Main panel -->
<div class="wrapper">
    <div class="content">
        <div class="main mainpage">
            <div class="search">
                <div class="inside">
                    <form id="mainsearch_form" action="/catalog/page/1" method="get">
                        <span class="input input--makiko">
                            <input class="input__field input__field--makiko" type="text" name="search" onkeydown="if (event.keyCode == 13) document.getElementById('mainsearch_form').submit();" id="input-16">
                            <label class="input__label input__label--makiko" for="input-16">
                                <span class="input__label-content input__label-content--makiko">Введите название или артикул интересующего Вас товара</span>
                            </label>
                            <i onclick="document.getElementById('mainsearch_form').submit();" class="mdi mdi-magnify"></i>
                        </span>
                    </form>
                </div>
                <div class="groups">
                    <div class="inside">
                        <div class="title">Каталог</div>
                        <ul>
                        <#list groups as group>
                            <a href="/catalog/page/1?groupId=${group.groupId}"><li><span>${group.name}</span></li></a>
                        </#list>
                        </ul>
                        <a href="/catalog"><div class="button"><span>Перейти к каталогу</span><i class="mdi mdi-chevron-right"></i></div></a>
                    </div>
                </div>
            </div>
            <div class="site">
                <div class="inside">
                    <div class="block">
                        <div class="img"></div>
                        <div class="content">
                            <div class="text">Также у нас есть основной сайт, в котором Вы можете посмотреть характеристики продуктов подробнее</div>
                            <a href="http://otrajenie.com"><div class="button"><span>Перейти на сайт</span></div></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="sign">
                <div class="inside">
                    <div class="img"></div>
                    <a href="/signin"><div class="button"><span>Вход</span></div></a>
                    <a href="/signup"><div class="button"><span>Регистрация</span></div></a>
                </div>
            </div>

        </div>
    </div>
    <footer>
        <div class="inside">
            <div class="row">
                <div class="col-6 left">
                    <ul>
                        <li>Главная</li>
                        <li>Каталог</li>
                        <li>Корзина</li>
                        <li>Мой заказы</li>
                        <li class="button">Основной сайт</li>
                    </ul>
                </div>
                <div class="col-6 right">
                    <!--<div class="text">	Вся информация на сайте и b2b «Отражение», касающаяся технических характеристик, описания внешнего вида и совместимости с другими продуктами носит информационный характер. ООО «Отражение» не несёт ответственности за действия клиентов, основанные на приведённых в каталоге данных.</div>-->
                    <ul>
                        <li>Оферта</li>
                        <li>Политика обработки персональных данных</li>
                        <li>@2017 Otrajenie</li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
</div>

<#include "modules/footer.ftl">