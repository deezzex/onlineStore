<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    Зареєструйтесь!
    ${message!}
    <@l.register "/registration" />
</@c.page>