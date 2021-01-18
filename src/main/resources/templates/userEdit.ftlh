<#import "parts/common.ftl" as c>

<@c.page>
    <h3>Редагування користувача</h3>

    <form action="/user" method="post">
        <div class="form-group row mt-3">
            <label class=" col-form-label">Нікнейм:</label>
            <input class="form-control mb-1" type="text" name="username" value="${user.username!}">
            <label class=" col-form-label">Ім'я:</label>
            <input class="form-control mb-1" type="text" name="firstName" value="${user.firstName!}">
            <label class="col-form-label">Прізвище:</label>
            <input class="form-control " type="text" name="lastName" value="${user.lastName!}">
        </div>

        <#list roles as role>
            <div >
                <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>  ${role}</label>
            </div>
        </#list>

        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button class="btn btn-primary" type="submit">Зберегти</button>
    </form>
</@c.page>