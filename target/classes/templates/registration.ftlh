<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <div class="alert alert-primary" role="alert">
        Зареєструйтесь! <a href="#" class="alert-link"></a>
    </div>

    ${message!}
    <@l.register "/registration" true/>
</@c.page>