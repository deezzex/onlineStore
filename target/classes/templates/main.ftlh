<#import "parts/common.ftl" as c>

<@c.page>
    <div>
        <form method="post" action="/">
            <input type="text" name="name" placeholder="Введіть назву продукту" />
            <input type="text" name="consist" placeholder="Введіть склад продукту">
            <input type="text" name="description" placeholder="Введіть опис продукту">
            <input type="text" name="producer" placeholder="Введіть виробника продукту">
            <input type="text" name="price" placeholder="Введіть ціну продукту">
            <button type="submit">Добавить</button>
        </form>
    </div>
    <div>Список товарів</div>
    <form method="get" action="/main">
        <input type="text" name="filter" value="${name!}">
        <button type="submit">Знайти</button>
    </form>
    <#list products as product>
        <div>
            <b>${product.name}</b>
            <span>${product.consist}</span>
            <i>${product.descriptions}</i>
            <strong>${product.producer}</strong>
            <i>${product.price}</i>
        </div>
    <#else>
        No message
    </#list>
</@c.page>