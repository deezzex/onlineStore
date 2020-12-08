<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <p>Ввійдіть в обліковий запис!</p>
    <@l.login "/login" false/>
</@c.page>