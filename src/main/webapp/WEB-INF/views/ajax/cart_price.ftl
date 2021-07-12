<#ftl encoding="utf-8">
<#assign security=JspTaglibs["http://www.springframework.org/security/tags"] />
<#setting locale="ru_RU">

<#if cart_price.fNum != 0>
    ${cart_price.fNum?string[",##0.00######"]} руб.
<#else>
    0 руб.
</#if>

