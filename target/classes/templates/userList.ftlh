<#import "parts/common.ftl" as c>

<@c.page>
    <strong>Список користувачів</strong>

    <table>
        <thead>
        <tr>
            <th>Id</th>
            <th>Нікнейм</th>
            <th>Імя</th>
            <th>Прізвище</th>
            <th>Імейл</th>
            <th>Права доступу</th>
            <th></th>
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
                <td><a href="/user/${user.id}">Редагувати</a></td>
            </tr>
        </#list>
        </tbody>
    </table>
    <div>
        <br>
        <a href="/main">Повернутись</a>
    </div>


</@c.page>