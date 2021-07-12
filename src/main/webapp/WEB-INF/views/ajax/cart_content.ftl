<#ftl encoding="utf-8">
<#setting locale="ru_RU">
<#assign security=JspTaglibs["http://www.springframework.org/security/tags"] />

<#if cart.cartProducts??>
    <#if cart.size!=0>
        <div class="table_panel">
            <div class="inside">
                <div id="cart">
                    <div class="panel">
                        <div class="row middle">
                            <div class="col-7 left">
                                <div class="breadcrumbs_container">
                                    <div class="title">
                                        <span>Корзина</span>
                                        <div class="amount"><a>${cart.size}</a>тов.</div>
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
                    <table class="cart_table catalog_table">
                        <thead>
                            <th class="sort" data-sort="code"><a>Код</a><i class="mdi mdi-chevron-down"></i></th>
                            <th class="sort" data-sort="articule"><a>Артикул</a><i class="mdi mdi-chevron-down"></i></th>
                            <th class="sort" data-sort="name"><a>Название</a><i class="mdi mdi-chevron-down"></i></th>
                            <th class="sort" data-sort="price"><a>Цена</a><i class="mdi mdi-chevron-down"></i></th>
                            <th class="sort" data-sort="quantity"><a>Количество</a><i class="mdi mdi-chevron-down"></i></th>
                            <th class="sort" data-sort="sumprice"><a>Общая стоимость</a><i class="mdi mdi-chevron-down"></i></th>
                            <th class="cart"><a>Удалить</a></th>
                        </thead>
                        <tbody class="list">
                            <#list cart.cartProducts as cartProduct>
                            <tr>
                                <td class="code"><a>${cartProduct.product.code}</a></td>
                                <td class="articule"><a>${cartProduct.product.articule}</a></td>
                                <td class="name"><a target="_blank" href="/product/${cartProduct.product.code}" style="color: #618ce5; cursor: pointer">${cartProduct.product.name}</a></td>

                                <#setting locale="ru_RU">
                                <@security.authorize access="hasRole('ROLE_USER')">
                                    <td class="price"><a>${cartProduct.product.retailPrice?string[",##0.00######"]}</a> ${cartProduct.product.currency}.</td>
                                </@security.authorize>
                                <@security.authorize access="hasRole('ROLE_PARTNER')">
                                    <td class="price"><a>${cartProduct.product.wholesalePrice?string[",##0.00######"]}</a> ${cartProduct.product.currency}.</td>
                                </@security.authorize>
                                <@security.authorize access="isAnonymous()">
                                    <td class="price"><a>${cartProduct.product.retailPrice?string[",##0.00######"]}</a> ${cartProduct.product.currency}.</td>
                                </@security.authorize>
                                <@security.authorize access="hasRole('ROLE_ADMIN')">
                                    <td class="price"><a>${cartProduct.product.retailPrice?string[",##0.00######"]}</a> ${cartProduct.product.currency}.</td>
                                </@security.authorize>
                                <td class="cart quantity">
                                    <form id="cart_form_set" class="cart_form">
                                    <input name="amount" maxlength="2" type="text" placeholder="0" value="${cartProduct.count}"/>
                                    <div class="buttons">
                                        <div class="plus"><i class="mdi mdi-chevron-up"></i></div>
                                        <div class="minus"><i class="mdi mdi-chevron-down"></i></div>
                                    </div>
                                    </form>
                                    <div class="reload">
                                        <i class="mdi mdi-reload"></i>
                                    </div>
                                </td>
                                <@security.authorize access="hasRole('ROLE_USER')">
                                    <td class="sumprice"><a>${(cartProduct.count * cartProduct.product.retailPrice)?string[",##0.00######"]}</a> ${cartProduct.product.currency}.</td>
                                </@security.authorize>
                                <@security.authorize access="hasRole('ROLE_PARTNER')">
                                    <td class="sumprice"><a>${(cartProduct.count * cartProduct.product.wholesalePrice)?string[",##0.00######"]}</a> ${cartProduct.product.currency}.</td>
                                </@security.authorize>
                                <@security.authorize access="isAnonymous()">
                                    <td class="sumprice"><a>${(cartProduct.count * cartProduct.product.retailPrice)?string[",##0.00######"]}</a> ${cartProduct.product.currency}.</td>
                                </@security.authorize>
                                <@security.authorize access="hasRole('ROLE_ADMIN')">
                                    <td class="sumprice"><a>${(cartProduct.count * cartProduct.product.retailPrice)?string[",##0.00######"]}</a> ${cartProduct.product.currency}.</td>
                                </@security.authorize>
                                <td class="remove">
                                    <div class="button" onclick="removeProductsFromCart('${cartProduct.product.code}')"><i class="mdi mdi-close"></i></div>
                                </td>
                            </tr>
                            </#list>
                        </tbody>
                    </table>
                </div>
                <div class="cart_bottom">
                    <div class="inside">
                        <div class="row middle">
                            <div class="col-4 left">
                                <div class="removeall" onclick="removeAllProductsFromCart()">Очистить корзину</div>
                            </div>
                            <div class="col-8 right">
                                <div class="sum">
                                    Итого:
                                    <a>${cart.price?string[",##0.00######"]} руб.</a>
                                </div>
                                <a href="/placeorder/place">
                                    <div class="button">
                                        <span>Оформить заказ</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <#else>
    <div class="inside">
        <div class="empty">
            <div class="block">
                <div class="img">
                    <div class="hex"></div>
                </div>
                <div class="content">
                    <div class="text">Ваша корзина пустая</div>
                    <a href="/catalog"><div class="button"><span>Перейти к каталогу</span><i class="mdi mdi-chevron-right"></i></div></a>
                </div>
            </div>
        </div>
    </div>
    </#if>
</#if>
