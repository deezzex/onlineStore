<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>

    <div class="alert alert-primary" role="alert">
        Ввійдіть в обліковий запис! <a href="#" class="alert-link"></a>
    </div>

    <@l.login "/login" false/>

    <#if Session?? && Session.SPRING_SECURITY_LAST_EXCEPTION??>
        <div class="alert alert-danger" role="alert">
            ${Session.SPRING_SECURITY_LAST_EXCEPTION.message}
        </div>
    </#if>

</@c.page>