<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">
<@c.page>


    <div class="form-group row">
        <label class="col">
            <div class="alert alert-success " role="alert">
                <h3>${product.name!}</h3>
                <hr>
                <p class="mb-0">${product.subtitle!}</p>
            </div>
            <div class="alert alert-info " role="alert">
                <h3>${product.price!} грн.</h3> <a href="#" class="alert-link"></a>
                <hr>
                <p class="mb-0">${product.evaluationForm!}</p>
            </div>
            <#if stock>
                <div class="alert alert-warning " role="alert">
                    <h6>Товар в наявності</h6>
                </div>
            </#if>
            <#if !stock>
                <div class="alert alert-danger" role="alert">
                    <h6>Товару немає наявності</h6>
                </div>
            </#if>
            <#if stock>
            <form action="/basket/${user.id}" method="post">
                <div class="form-group row">
                    <div class="input-group input-group-lg col-sm-8">
                        <span class="input-group-text" id="inputGroup-sizing-lg">Обовязково!</span>
                        <input type="text" class="col form-control ${(textError??)?string('is-invalid','')}"  placeholder="Кількість товарів" name="count" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
                    </div>
                <input class="mt-1" type="hidden" name="product" value="${product.id}">
                <input class="mt-1" type="hidden" name="_csrf" value="${_csrf.token}" />
                <button class="btn btn-primary mr-2 ml-4 col-sm-3" type="submit">В корзину</button>
                </div>
            </form>
            </#if>

            <#if isAdmin>
            <a type="button"  href="/product/edit/${product.id}" class="btn btn-secondary mt-2">Редагувати товар</a>
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