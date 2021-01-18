<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>
    <h3>Список сформованих замовлень</h3>

    <table class="table table-light table-striped table-bordered mt-2">
        <thead class="table-light">
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Товари</th>
            <th scope="col">Адрес</th>
            <th scope="col">Імя замовникв</th>
            <th scope="col">Прізвище замовника</th>
            <th scope="col">Номер</th>
            <th scope="col">Сума</th>
            <th scope="col">Статус</th>
            <th scope="col"></th>

        </tr>
        </thead>
        <tbody>
        <#list confirmedOrders! as order>
            <tr>
                <td>${order.id}</td>
                <td><#list order.orders as or >${or}<#sep>, </#list></td>
                <td>${order.cityDestination!}, ${order.streetDestination!}</td>
                <td>${order.firstNameOfCustomer!}</td>
                <td>${order.lastNameOfCustomer!}</td>
                <td>${order.phone}</td>
                <td>${order.total}</td>
                <td>
                    <#list order.statuses! as s >${s}<#sep>, </#list>
                    <hr/>
                    <a class="btn btn-info btn-sm" href="/basket/all/${order.id}/change-status">Змінити</a>
                </td>
                <td>
                    <form action="/basket/all" method="post">
                        <input class="mt-1" type="hidden" name="order" value="${order.id}">
                        <input class="mt-1" type="hidden" name="_csrf" value="${_csrf.token}" />
                        <button class="btn btn-danger btn-sm mt-2 d-flex justify-content-center" type="submit">Видалити</button>
                    </form>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>
</@c.page>