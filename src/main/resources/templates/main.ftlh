<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <div>
        <@l.logout />
    </div>
    <div>
        <form method="post">
            <input type="text" name="name" placeholder="Товар" />
            <input type="text" name="price" placeholder="Ціна">
            <input type="text" name="consist" placeholder="Склад">
            <input type="text" name="description" placeholder="Опис">
            <input type="text" name="producer" placeholder="Виробник">
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <button type="submit">Додати</button>
        </form>
    </div>
    <div>Список товарів</div>
    <form method="get" action="/main">
        <input type="text" name="filter" value="${filter!}">
        <button type="submit">Знайти</button>
    </form>
    <#list products as product>
        <div>
            <b>${product.name}</b>
            <span>${product.consist}</span>
            <span>${product.descriptions}</span>
            <span>${product.producer}</span>
            <i>${product.price}</i>
        </div>
    <#else>
        Немає такого товару
    </#list>
</@c.page>