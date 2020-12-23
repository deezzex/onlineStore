<#import "parts/common.ftl" as c>

<@c.page>
    <h3>Редагування товару</h3>

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
        <#list categories as category>
            <div >
                <label><input type="checkbox" name="${category}" ${product.categories?seq_contains(category)?string("checked", "")}>  ${category}</label>
            </div>
        </#list>

        <input type="hidden" value="${product.id}" name="productId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button class="btn btn-primary" type="submit">Зберегти</button>
    </form>
</@c.page>