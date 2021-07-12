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

<!-- Sidebar -->
<#include "modules/aside.ftl">

<!-- Main panel -->
<div class="main catalogpage">
    <div class="header-container"></div>
    <div class="catalog_container">
        <div class="panel_container">
            <div class="inside">
                <div class="panel">
                    <div class="row middle">
                        <div class="col-7 left">
                            <div class="breadcrumbs_container">
                                <#include "modules/breadcrumbs.ftl">
                            </div>
                        </div>
                        <div class="col-5 right">
                            <div class="search">
                                <form class="search_form" onkeypress="return event.keyCode != 13;">
                                    <div class="search_input">
                                        <input type="text" name="search" placeholder="Поиск" onkeyup="filterProducts()">
                                        <i onclick="document.getElementById('mainsearch_form').submit();" class="mdi mdi-magnify"></i>
                                    </div>
                                    <div class="mode">
                                        <div class="current" rel="cur">Текущий</div>
                                        <div rel="all">Весь</div>
                                    </div>
                                </form>
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
                                    <div class="stock">
                                        <a>Отображать товары</a>
                                        <div class="pretty success circle smooth">
                                            <input onchange="filterProducts()" id="check" name="stock" type="checkbox">
                                            <label><i class="mdi mdi-check"></i>В наличии</label>
                                        </div>
                                    </div>
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
                                            <option value="code_ASC">По коду (возр.)</option>
                                            <option value="code_DESC">По коду (убыв.)</option>
                                        </select>
                                    </div>
                                    <div class="mode">
                                        <a>Поиск по каталогу</a>
                                        <div class="current" rel="cur">Текущий</div>
                                        <div rel="all">Весь</div>
                                    </div>
                                </form>
                                <div class="close_button">
                                    <i class="mdi mdi-close"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="table_panel">
            <div class="table_space"></div>
            <div class="inside">
                <#include "ajax/catalog_content.ftl">
            </div>
        </div>

    </div>

</div>

<#include "modules/footer.ftl">