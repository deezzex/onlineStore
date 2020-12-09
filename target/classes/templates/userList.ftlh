<#import "parts/common.ftl" as c>

<@c.page>
    <h3>Список користувачів</h3>

    <table class="table table-primary table-striped table-hover table-bordered mt-5">
        <thead class="table-dark">
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Нікнейм</th>
            <th scope="col">Імя</th>
            <th scope="col">Прізвище</th>
            <th scope="col">Імейл</th>
            <th scope="col">Права доступу</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>${user.firstName!}</td>
                <td>${user.lastName!}</td>
                <td>${user.email!}</td>
                <td><#list user.roles as role>${role}<#sep>, </#list></td>
                <td><a href="/user/${user.id}" type="button" class="btn btn-secondary">Редагувати</a></td>
            </tr>
        </#list>
        </tbody>
    </table>
    <div>
        <br>
        <a href="/main" type="button" class="btn btn-primary">Повернутись</a>
    </div>


</@c.page>