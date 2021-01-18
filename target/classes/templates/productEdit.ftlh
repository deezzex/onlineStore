<#import "parts/common.ftl" as c>

<@c.page>
    <div class="alert alert-success" role="alert">
        <h4 class="alert-heading">Редагування товару!</h4>
        <p>${stock}</p>
        <hr>
        <p class="mb-0">
        <form action="/product/stock" method="post">
            <input class="mt-1" type="hidden" name="product" value="${product.id}">
            <input class="mt-1" type="hidden" name="_csrf" value="${_csrf.token}" />
            <button class="btn btn-info mt-2 d-flex justify-content-center" type="submit">Змінити статус</button>
        </form>
        </p>
    </div>


    <form action="/product" method="post">
        <div class="form-group row mt-3">
            <label class=" col-form-label">Назва:</label>
            <input class="form-control mb-1" type="text" name="name" value="${product.name!}">
            <label class=" col-form-label">Склад:</label>
            <input class="form-control mb-1" type="text" name="consist" value="${product.consist!}">
            <label class=" col-form-label">Опис:</label>
            <input class="form-control mb-1" type="text" name="description" value="${product.descriptions!}">
            <label class=" col-form-label">Підзаголовок:</label>
            <input class="form-control mb-1" type="text" name="subtitle" value="${product.subtitle!}">
            <label class=" col-form-label">Виробник:</label>
            <input class="form-control mb-1" type="text" name="producer" value="${product.producer!}">
            <label class=" col-form-label">Вага:</label>
            <input class="form-control mb-1" type="text" name="weight" value="${product.weight!}">
            <label class=" col-form-label">Ціна:</label>
            <input class="form-control mb-1" type="text" name="price" value="${product.price!}">
            <label class=" col-form-label">Форма Оцінювання:</label>
            <input class="form-control mb-1" type="text" name="evaluationForm" value="${product.evaluationForm!}">

        </div>
        <hr/>
        <#list categories as category>
            <div>
                <label><input type="checkbox" name="${category}" ${product.categories?seq_contains(category)?string("checked", "")}>  ${category}</label>
            </div>
        </#list>

        <input type="hidden" value="${product.id}" name="productId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button class="btn btn-primary" type="submit">Зберегти</button>
    </form>

    <div class="d-flex justify-content-end">
        <form action="/product/${product.id}/delete" method="post">
            <input class="mt-1" type="hidden" name="product" value="${product.id}">
            <input class="mt-1" type="hidden" name="_csrf" value="${_csrf.token}" />
            <button class="btn btn-danger mt-2 d-flex justify-content-center" type="submit">Видалити</button>
        </form>
    </div>

</@c.page>