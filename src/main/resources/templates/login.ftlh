<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <div class="alert alert-primary" role="alert">
        Ввійдіть в обліковий запис! <a href="#" class="alert-link"></a>
    </div>
    <@l.login "/login" false/>
</@c.page>