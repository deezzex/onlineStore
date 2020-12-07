<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <p>Ввійдіть в обліковий запис!</p>
    <@l.login "/login" />
    <p>У вас ще немає облікового запису?</p>
    <a href="/registration">Зареєстуйтесь!</a>
</@c.page>