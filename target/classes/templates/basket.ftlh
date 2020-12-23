<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">
<@c.page>

    <#if isCurrentUser>
        <table class="table table-primary table-striped  mt-2">
            <thead class="table-light">
            <tr>
                <th scope="col">Назва товару</th>
                <th scope="col">Номер заказу</th>
                <th scope="col">Кількість</th>
                <th scope="col">Автор</th>
                <th scope="col"></th>

            </tr>
            </thead>
            <tbody>
            <#list orders as order>
                <tr>
                    <td>${order.product.name!}</td>
                    <td>${order.orderId!}</td>
                    <td>${order.count!}</td>
                    <td>${order.author.username!}</td>
                    <td>
                        <form action="/basket/${user.id}/delete" method="post">
                            <input class="mt-1" type="hidden" name="order" value="${order.orderId}">
                            <input class="mt-1" type="hidden" name="_csrf" value="${_csrf.token}" />
                            <button class="btn btn-primary mt-2" type="submit">Видалити</button>
                        </form>
                    </td>
                </tr>
            </#list>
            <#else>
                No
            </tbody>
        </table>

    </#if>
    <div class="container">
        <a class="btn btn-success" href="#">Сформувати заказ</a>
    </div>
    
</@c.page>