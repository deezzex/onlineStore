<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">
<@c.page>



    <#if isCurrentUser>

        <div class="alert alert-success" role="alert">
            <h4 class="alert-heading">Корзина!</h4>
            <p>Сума замовлення становить: ${total} грн.</p>
            <hr>
            <p class="mb-0"> <a class="btn btn-success" href="#">Сформувати заказ</a></p>
        </div>

        <table class="table table-success table-striped mt-2">
            <thead class="table-light">
            <tr>
                <th scope="col">Фото</th>
                <th scope="col">Назва товару</th>
                <th scope="col">Кількість</th>
                <th scope="col">Ціна</th>
                <th scope="col">Керувати</th>

            </tr>
            </thead>
            <tbody>
            <#list orders as order>
                <tr>
                    <td><img src="/img/${order.product.fileName!}" class="card-img-top" style="height: 50px;width: 50px;"></td>
                    <td><a href="/product/${order.product.id}">${order.product.subtitle!}</a></td>
                    <td>${order.count!}</td>
                    <td>${order.product.price!}</td>
                    <td>
                        <form action="/basket/${user.id}/delete" method="post">
                            <input class="mt-1" type="hidden" name="order" value="${order.orderId}">
                            <input class="mt-1" type="hidden" name="_csrf" value="${_csrf.token}" />
                            <button class="btn btn-primary mt-2" type="submit">Видалити</button>
                        </form>
                    </td>
                </tr>
            <#else>
            </#list>
            </tbody>
        </table>
    </#if>


</@c.page>