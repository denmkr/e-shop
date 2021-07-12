<#ftl encoding="utf-8">
<#setting locale="ru_RU">

<#assign security=JspTaglibs["http://www.springframework.org/security/tags"] />
<#assign c=JspTaglibs["http://java.sun.com/jsp/jstl/core"] />
<#assign form=JspTaglibs["http://www.springframework.org/tags/form"]>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>Интернет-магазин</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/normalize.css" />
    <link href="/resources/css/animate.css" rel="stylesheet" />
    <link href="/resources/css/balloon.min.css" rel="stylesheet" />
    <link href="/resources/css/pretty.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/resources/css/set2.css" />
    <link href="/resources/css/materialdesignicons.min.css" media="all" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/cs-select.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/cs-skin-border.css" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/resources/css/component.css" />

    <link rel="stylesheet" type="text/css" href="/resources/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/sweetalert.css">
    <link href="/resources/css/style2.css" rel="stylesheet" />

    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</head>
<body>

<div class="modal_container">
    <img src="/resources/images/close.png">
</div>
<div class="modal">
</div>
<div class="progress-bar"></div>

<!-- Header -->
    <header>
        <div class="inside">
            <div class="row">
                <div class="col-2 left">
                    <div class="logo_container">
                        <div class="logo">
                            <img src="/resources/images/logo_blue.png">
                        </div>
                    </div>
                </div>
                <div class="col-8 center">
                    <ul class="main_menu">
                        <li <#if page??><#if page == "main">class="current"</#if></#if>>
                            <a href="/">Главная</a>
                        </li>
                        <li <#if page??><#if (page == "catalog") || (page == "product")>class="current"</#if></#if>>
                            <a href="/catalog">Каталог</a>
                        </li>
                        <li <#if page??><#if page == "cart">class="current"</#if></#if>>
                            <a href="/cart">Корзина</a>
                            <div class="amount"><span><#include "../ajax/cart_size.ftl"></span></div>
                        </li>
                    </ul>
                </div>
                <div class="col-2 right">
                    <@security.authorize access="isAuthenticated()">
                        <div class="user">
                            <div class="user_text">${username.email}</div>
                            <div class="img">
                                <i class="mdi show mdi-chevron-down"></i>
                            </div>
                            <div class="user_menu">
                                <div class="info">
                                    <i class="mdi mdi-account-circle"></i>
                                    <div class="name">${username.name}</div>
                                    <div class="company">${username.company}</div>
                                </div>
                                <ul>
                                    <li><a href="/orders">Мои заказы</a></li>
                                    <li><a href="/account">Настройки профиля</a></li>
                                    <@security.authorize access="hasRole('ROLE_ADMIN')">
                                        <li><a href="/admin">Админ. панель</a></li>
                                    </@security.authorize>
                                    <li><a href="/logout">Выйти</a></li>
                                </ul>
                                <div class="close">
                                    <i class="mdi mdi-close"></i>
                                </div>
                            </div>
                        </div>
                    </@security.authorize>
                    <@security.authorize access="isAnonymous()">
                        <a href="/signin">
                            <div class="image">
                                <i class="mdi mdi-account-outline"></i>
                            </div>
                            <div class="user">
                                <div class="user_text">Войти</div>
                            </div>
                        </a>
                    </@security.authorize>
                </div>
            </div>
        </div>
    </header>