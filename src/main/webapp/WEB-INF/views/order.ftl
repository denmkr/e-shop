<#ftl encoding="utf-8">
<#setting locale="ru_RU">

<#assign security=JspTaglibs["http://www.springframework.org/security/tags"] />
<#assign c=JspTaglibs["http://java.sun.com/jsp/jstl/core"] />
<#assign form=JspTaglibs["http://www.springframework.org/tags/form"]>

<!-- Header -->
<#include "modules/header.ftl">

<!-- Main panel -->
<div class="main cartpage singleorderpage">
    <div class="header-container"></div>
    <div class="cart_container">
        <div class="table_panel">
            <div class="inside">
            <@security.authorize access="isAuthenticated()">
                <div id="order">
                    <div class="panel">
                        <div class="row middle">
                            <div class="col-7 left">
                                <div class="breadcrumbs_container">
                                    <div class="title">
                                        <a href="/orders">
                                            <div class="back">
                                                <i class="mdi mdi-chevron-left"></i>
                                                <span>Все заказы</span>
                                            </div>
                                        </a>
                                        <span>Заказ № ${order.code}</span>
                                        <div class="amount"><a>${order.quantity}</a>тов.</div>
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

                    <div class="information">
                        <div class="row bottom">
                            <div class="col-6 left">
                                <div class="number">Номер заказа: <a>${order.code}</a></div>
                                <div class="date">Дата и время: <a>${order.date}</a></div>
                                <div class="quantity">Количество товаров: <a>${order.quantity}</a></div>
                                <#setting locale="ru_RU">
                                <div class="name">Имя пользователя: <a>${order.user.name}</a></div>
                                <div class="status">
                                    Статус заказа:
                                    <div class="level no"></div>
                                    <a>Не обработан</a>

                                    <div class="level uchet"></div>
                                    <a>Учтен</a>

                                    <div class="level otgruz"></div>
                                    <a>Отгружен</a>

                                </div>
                            </div>
                            <div class="col-6 right">
                                <div class="price">Общая сумма: <a>${order.price?string[",##0.00######"]} руб.</a></div>
                            </div>
                        </div>
                    </div>

                    <table class="single_order_table order_table catalog_table">
                        <thead>
                            <th class="sort" data-sort="code"><a>Код</a><i class="mdi mdi-chevron-down"></i></th>
                            <th class="sort" data-sort="articule"><a>Артикул</a><i class="mdi mdi-chevron-down"></i></th>
                            <th class="sort" data-sort="name"><a>Название</a><i class="mdi mdi-chevron-down"></i></th>
                            <th class="sort" data-sort="price"><a>Цена</a><i class="mdi mdi-chevron-down"></i></th>
                            <th class="sort" data-sort="quantity"><a>Количество</a><i class="mdi mdi-chevron-down"></i></th>
                            <th class="sort" data-sort="sumprice"><a>Общая стоимость</a><i class="mdi mdi-chevron-down"></i></th>
                        </thead>
                        <tbody class="list">
                            <#list order.orderProducts as orderProduct>
                            <tr>
                                <td class="code"><a>${orderProduct.product.code}</a></td>
                                <td class="articule"><a>${orderProduct.product.articule}</a></td>
                                <td class="name"><a target="_blank" href="/product/${orderProduct.product.code}" style="color: #618ce5; cursor: pointer">${orderProduct.product.name}</a></td>
                                <td class="price">
                                    <@security.authorize access="hasRole('ROLE_USER')">
                                        <a>${orderProduct.product.retailPrice?string[",##0.00######"]}</a> ${orderProduct.product.currency}.
                                    </@security.authorize>
                                    <@security.authorize access="isAnonymous()">
                                        <a>${orderProduct.product.retailPrice?string[",##0.00######"]}</a> ${orderProduct.product.currency}.
                                    </@security.authorize>
                                    <@security.authorize access="hasRole('ROLE_ADMIN')">
                                        <a>${orderProduct.product.retailPrice?string[",##0.00######"]}</a> ${orderProduct.product.currency}.
                                    </@security.authorize>
                                    <@security.authorize access="hasRole('ROLE_PARTNER')">
                                        <a>${orderProduct.product.wholesalePrice?string[",##0.00######"]}</a> ${orderProduct.product.currency}.
                                    </@security.authorize>
                                </td>
                                <td class="quantity"><a>${orderProduct.quantity}</a></td>
                                <td class="sumprice">
                                    <@security.authorize access="hasRole('ROLE_USER')">
                                        <a>${(orderProduct.quantity * orderProduct.price)?string[",##0.00######"]}</a> ${orderProduct.product.currency}.
                                    </@security.authorize>
                                    <@security.authorize access="hasRole('ROLE_PARTNER')">
                                        <a>${(orderProduct.quantity * orderProduct.price)?string[",##0.00######"]}</a> ${orderProduct.product.currency}.
                                    </@security.authorize>
                                    <@security.authorize access="isAnonymous()">
                                        <a>${(orderProduct.quantity * orderProduct.price)?string[",##0.00######"]}</a> ${orderProduct.product.currency}.
                                    </@security.authorize>
                                    <@security.authorize access="hasRole('ROLE_ADMIN')">
                                        <a>${(orderProduct.quantity * orderProduct.price)?string[",##0.00######"]}</a> ${orderProduct.product.currency}.
                                    </@security.authorize>
                                </td>
                            </tr>
                            </#list>
                        </tbody>
                    </table>
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


