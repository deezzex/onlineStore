<#import "parts/common.ftl" as c>
<#import "parts/pager.ftl" as p>
<#include "parts/security.ftl">
<@c.page>
    <h3>Список товарів</h3>


    <div class="form-row">
        <div class="form-group col">
            <form method="get" action="/product" class="form-inline">
                <div class="col-sm-11 col-form-label form-group row">
                    <input type="text" name="filter" class="form-control col" value="${filter!}" placeholder="Пошук за назвою">
                </div>
                <button type="submit" class="btn btn btn-success ml-2">Шукати</button>
            </form>
        </div>
    </div>

    <@p.pager url page1/>
    <table class="table table-primary table-striped table-hover table-bordered mt-2">
        <thead class="table-dark">
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Назва</th>
            <th scope="col">Підзаголовок</th>
            <th scope="col">Виробник</th>
            <th scope="col">Вага</th>
            <th scope="col">Ціна</th>
            <th scope="col">Категорії</th>
            <th scope="col">Наявність</th>
            <th scope="col"></th>

        </tr>
        </thead>
        <tbody>
        <#list page1.content as product>
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.subtitle!}</td>
                <td>${product.producer!}</td>
                <td>${product.weight!}</td>
                <td>${product.price!}</td>
                <td><#list product.categories as category>${category}<#sep>, </#list></td>
                <td><#list product.inStock as inStock >${inStock}<#sep>, </#list></td>
                <td><a href="/product/edit/${product.id}" type="button" class="btn btn-secondary">Редагувати</a></td>
            </tr>
        </#list>
        </tbody>
    </table>
</@c.page>