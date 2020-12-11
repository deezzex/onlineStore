<#include "security.ftl">
<#import "login.ftl" as l>

<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #7d8cc4;">
    <a class="navbar-brand" href="/">Все для газди!</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
                 <li class="nav-item">
                     <div class="spinner-border text-primary  mr-3 mt-3" role="status">
                         <span class="visually-hidden"></span>
                     </div>

                 <div class="btn-group mb-3" role="group" aria-label="Basic outlined example">

                     <#if user??>
                         <a type="button"  href="/main" class="btn btn-outline-light">Каталог товарів</a>
                         <a type="button" href="/user/profile" class="btn btn-outline-light">Мій профіль</a>
                         <a type="button" href="/user/basket" class="btn btn-outline-light">Корзина</a>
                     </#if>

                 </div>
                     <#if isAdmin>
                         <div class="btn-group mb-3 ml-5" role="group" aria-label="Basic outlined example">
                             <a type="button" href="/user" class="btn btn-outline-light">Список користувачів</a>
                             <a type="button" href="/product" class="btn btn-outline-light">Список товарів</a>
                             <a type="button" href="/product/add" class="btn btn-outline-light">Додати</a>
                         </div>
                     </#if>
        </ul>

        <span class="badge  bg-warning text-dark navbar-text mr-3"> ${name} </span>

        <#if user??><@l.logout /></#if>
        <#if !user??>
            <a type="button" href="/login" class="btn btn-success border">Увійти</a>
        </#if>
    </div>
</nav>