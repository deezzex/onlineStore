<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">
<@c.page>


    <div class="form-group row">
        <label class="col">
            <div class="alert alert-success " role="alert">
                <h3>${product.name!}</h3> <a href="#" class="alert-link"></a>
                <hr>
                <p class="mb-0">${product.subtitle!}</p>
            </div>
            <div class="alert alert-info " role="alert">
                <h3>${product.price!} грн.</h3> <a href="#" class="alert-link"></a>
                <hr>
                <p class="mb-0">${product.evaluationForm!}</p>
            </div>

            <a type="button" href="#" class="btn btn-success">Добавити в корзину</a>
            <#if isAdmin>
            <a type="button" href="/product/edit/${product.id}" class="btn btn-secondary">Редагувати товар</a>
            </#if>
        </label>

        <div class="col card">
            <img src="/img/${product.fileName!}" class="card-img-top">
        </div>

    </div>


    <table class="table table-primary table-striped table-hover table-bordered mt-5">
        <thead class="table table-striped">
        <tr>
            <th scope="col">Назва</th>
            <th scope="col">Склад</th>
            <th scope="col">Опис</th>
            <th scope="col">Виробник</th>
            <th scope="col">Вага</th>
            <th scope="col">Ціна</th>
            <th scope="col">Форма оцінювання</th>
        </tr>
        </thead>
        <tbody>
            <tr>
                <td>${product.subtitle!}</td>
                <td>${product.consist!}</td>
                <td>${product.descriptions!}</td>
                <td>${product.producer!}</td>
                <td>${product.weight!} кг.</td>
                <td>${product.price!} грн.</td>
                <td>${product.evaluationForm!}</td>
            </tr>
        </tbody>
    </table>


</@c.page>