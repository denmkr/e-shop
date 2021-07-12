<#ftl encoding="utf-8">
<#setting locale="ru_RU">
<#assign security=JspTaglibs["http://www.springframework.org/security/tags"] />

<div class="photo">
    <img src="/resources/images/no-image.png">
</div>
<div class="content">
    <div class="sub">
        <div class="breadcrumbs">
            <li><a rel="">Каталог</a></li>
            <#if product.productGroup??>
                <i class="mdi mdi-chevron-right"></i>
                <#if product.productGroup.parentGroup??>
                    <#if product.productGroup.parentGroup.parentGroup??>
                        <#if product.productGroup.parentGroup.parentGroup.parentGroup??>
                            <#if product.productGroup.parentGroup.parentGroup.parentGroup.parentGroup??>
                                <li><a rel="${product.productGroup.parentGroup.parentGroup.parentGroup.parentGroup.groupId}">${product.productGroup.parentGroup.parentGroup.parentGroup.parentGroup.name}</a></li>
                                <i class="mdi mdi-chevron-right"></i>
                            </#if>
                            <li><a rel="${product.productGroup.parentGroup.parentGroup.parentGroup.groupId}">${product.productGroup.parentGroup.parentGroup.parentGroup.name}</a></li>
                            <i class="mdi mdi-chevron-right"></i>
                        </#if>
                        <li><a rel="${product.productGroup.parentGroup.parentGroup.groupId}">${product.productGroup.parentGroup.parentGroup.name}</a></li>
                        <i class="mdi mdi-chevron-right"></i>
                    </#if>
                    <li><a rel="${product.productGroup.parentGroup.groupId}">${product.productGroup.parentGroup.name}</a></li>
                    <i class="mdi mdi-chevron-right"></i>
                </#if>
                <li><a rel="${product.productGroup.groupId}">${product.productGroup.name}</a></li>
            </#if>
        </div>
    </div>
    <div class="head">${product.name}</div>
    <div class="info">
        <div class="code">
            <div class="name">Код</div>
        <#if product.code??>
            <div class="text">${product.code}</div>
        </#if>
        </div>
        <div class="articule">
            <div class="name">Артикул</div>
            <#if product.articule??>
            <div class="text">${product.articule}</div>
            </#if>
        </div>
        <div class="stock">
            <div class="name">На складе (шт.)</div>
            <div class="text">${product.stock}</div>
        </div>
        <div class="price">
        <#setting locale="ru_RU">
            <div class="name">Цена за шт.</div>
            <@security.authorize access="hasRole('ROLE_USER')">
                <div class="text">${product.retailPrice?string[",##0.00######"]} ${product.currency}</div>
            </@security.authorize>
        <@security.authorize access="hasRole('ROLE_ADMIN')">
            <div class="text">${product.retailPrice?string[",##0.00######"]} ${product.currency}</div>
        </@security.authorize>
            <@security.authorize access="hasRole('ROLE_PARTNER')">
                <div class="text">${product.wholesalePrice?string[",##0.00######"]} ${product.currency}</div>
            </@security.authorize>
            <@security.authorize access="isAnonymous()">
                <div class="text">${product.retailPrice?string[",##0.00######"]} ${product.currency}</div>
            </@security.authorize>
        </div>
    </div>
    <div class="cart">
        <form class="cart_form">
            <input name="amount" maxlength="2" type="text" placeholder="0" value="1">
            <div class="buttons">
                <div class="plus"><i class="mdi mdi-chevron-up"></i></div>
                <div class="minus"><i class="mdi mdi-chevron-down"></i></div>
            </div>
        </form>
        <div class="button">
            <i class="mdi mdi-cart"></i>
            <span>В корзину</span>
        </div>
    </div>
</div>