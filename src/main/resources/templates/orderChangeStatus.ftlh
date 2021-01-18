<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">
<@c.page>
    <form action="/basket/all/${order.id}/change-status" method="post">
        <#list status as s>
            <div>
                <label><input type="checkbox" name="${s}" ${order.statuses?seq_contains(s)?string("checked", "")}>  ${s}</label>
            </div>
        </#list>

        <input type="hidden" value="${order.id}" name="orderId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button class="btn btn-primary" type="submit">Зберегти</button>
    </form>
</@c.page>