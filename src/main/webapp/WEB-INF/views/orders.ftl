<#ftl encoding="utf-8">
<#setting locale="ru_RU">

<#assign security=JspTaglibs["http://www.springframework.org/security/tags"] />
<#assign c=JspTaglibs["http://java.sun.com/jsp/jstl/core"] />
<#assign form=JspTaglibs["http://www.springframework.org/tags/form"]>

<!-- Header -->
<#include "modules/header.ftl">

<!-- Main panel -->
<div class="main cartpage orderpage">
    <div class="header-container"></div>
    <div class="cart_container">
        <div class="table_panel">
            <div class="inside">
                <@security.authorize access="isAuthenticated()">
                    <div id="orders">
                        <div class="panel">
                            <div class="row middle">
                                <div class="col-7 left">
                                    <div class="breadcrumbs_container">
                                        <div class="title">
                                            <span>Мои заказы</span>
                                            <#if orders??>
                                                <#if orders?has_content>
                                                    <div class="amount"><a>${orders?size}</a>зак.</div>
                                                </#if>
                                            </#if>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-5 right">
                                    <div class="search">
                                        <div class="search_input">
                                            <input class="search" type="text" name="search" placeholder="Поиск">
                                            <i class="mdi mdi-magnify"></i>
                                        </div>
                                    </div>
                                    <div class="filter_button">
                                        <i class="mdi mdi-filter"></i>
                                        <a>Фильтр</a>
                                    </div>
                                </div>
                            </div>
                            <div class="filter">
                                <div class="row middle">
                                    <div class="col-12 right">
                                        <form class="filter_form">
                                            <div class="title">Фильтр</div>
                                            <div class="order">
                                                <a>Сортировка</a>
                                                <select name="sort" id="select_sort" class="cs-select cs-skin-rotate">
                                                    <option value="name_ASC">По названию (возр.)</option>
                                                    <option value="name_DESC">По названию (убыв.)</option>
                                                    <option value="retailPrice_ASC">По цене (возр.)</option>
                                                    <option value="retailPrice_DESC">По цене (убыв.)</option>
                                                    <option value="stock_ASC">По наличию (возр.)</option>
                                                    <option value="stock_DESC">По наличию (убыв.)</option>
                                                    <option value="articule_ASC">По артикулу (возр.)</option>
                                                    <option value="articule_DESC">По артикулу (убыв.)</option>
                                                </select>
                                            </div>
                                        </form>
                                        <div class="close_button">
                                            <i class="mdi mdi-close"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <#if orders??>
                            <#if orders?has_content>
                            <table class="order_table catalog_table">
                                <thead>
                                <th class="sort" data-sort="number"><a>№ заказа</a><i class="mdi mdi-chevron-down"></i></th>
                                <th class="sort current" data-sort="date"><a>Дата и время</a><i class="mdi mdi-chevron-down"></i></th>
                                <th class="sort" data-sort="status"><a>Статус заказа</a><i class="mdi mdi-chevron-down"></i></th>
                                <th class="sort" data-sort="quantity"><a>Количество товаров</a><i class="mdi mdi-chevron-down"></i></th>
                                <th class="sort" data-sort="price"><a>Общая сумма</a><i class="mdi mdi-chevron-down"></i></th>
                                <th></th>
                                </thead>
                                <tbody class="list">
                                    <#list orders as order>
                                        <tr href="/order?orderId=${order.id}">
                                            <td class="number">${order.code}</td>
                                            <td class="date">${order.date}</td>
                                            <td class="status">

                                                    <div class="level no"></div>
                                                    <a>Не обработан</a>

                                                    <div class="level uchet"></div>
                                                    <a>Учтен</a>

                                                    <div class="level otgruz"></div>
                                                    <a>Отгружен</a>

                                            </td>
                                            <td class="quantity">${order.quantity}</td>
                                            <#setting locale="ru_RU">
                                            <td class="price">${order.price?string[",##0.00######"]} руб.</td>
                                            <td class="next">
                                                <i class="mdi mdi-chevron-right"></i>
                                            </td>
                                        </tr>
                                    </#list>
                                </tbody>
                            </table>
                            <#else>
                                <div class="inside">
                                    <div class="empty">
                                        <div class="block">
                                            <div class="img"><img src="/resources/images/noone.png"></div>
                                            <div class="content">
                                                <div class="text">Заказов не найдено</div>
                                                <a href="/catalog"><div class="button"><span>Перейти к каталогу</span><i class="mdi mdi-chevron-right"></i></div></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </#if>
                        </#if>
                    </div>
                </@security.authorize>
                <@security.authorize access="isAnonymous()">
                    <div class="buttons">
                        <a href="/signin">
                            <div class="button login">
                                <i class="mdi mdi-account-box"></i>
                                <span>Войти</span>
                            </div>
                        </a>
                        <a>
                            <div class="button register active">
                                <i class="mdi mdi-account-multiple-plus"></i>
                                <span>Зарегистрироваться</span>
                            </div>
                        </a>
                    </div>
                </@security.authorize>
            </div>
        </div>
    </div>
</div>

<#include "modules/footer.ftl">





