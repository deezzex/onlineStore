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
                    <a class="nav-link" href="/main">Товари</a>
                </li>

            <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link" href="/user">Список користувачів</a>
                </li>
            </#if>
            <#if user??>
                <li class="nav-item">
                    <a class="nav-link" href="/user/profile">Профіль</a>
                </li>
            </#if>
        </ul>
        <span class="badge  bg-warning text-dark navbar-text mr-3"> ${name} </span>

        <#if user??><@l.logout /></#if>
    </div>
</nav>