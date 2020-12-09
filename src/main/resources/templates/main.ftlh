<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<#include "parts/security.ftl">

<@c.page>
    <img src="/img/1.jpg" class="d-block w-100 border border-9 border-primary" alt="...">

    <#if isAdmin>
        <a class="btn btn-primary mt-3" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
            Добавити новий товар</a>
        <div class="collapse" id="collapseExample">
            <div class="form-group mt-3">
                <form method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <input type="text" class="form-control" name="name" placeholder="Назва" />
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="consist" placeholder="Склад">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="description" placeholder="Опис">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="producer" placeholder="Виробник">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="price" placeholder="Ціна">
                    </div>
                    <div class="form-group">
                        <div class="custom-file">
                            <input type="file" name="file" id="customFile">
                            <label class="custom-file-label" for="customFile">Вибрати фото</label>
                        </div>
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Добавити товар</button>
                    </div>
                </form>
            </div>
        </div>
    </#if>
    <div class="container mt-3">
    <div class="form-row">
        <div class="form-group col">
            <form method="get" action="/main" class="form-inline">
                <div class="col-sm-11 col-form-label form-group row">
                    <input type="text" name="filter" class="form-control col" value="${filter!}" placeholder="Пошук за назвою">
                </div>
                <button type="submit" class="btn btn btn-success ml-2">Шукати</button>
            </form>
        </div>
    </div>
    </div>
    <div class="card-columns">
        <#list products as product>
            <div class="card my-3 text-center border border-primary border-5 rounded" style="width: 18rem;">

                    <img src="/img/${product.fileName!}" class="card-img-top">
                <h4 class="card-title ml-3">${product.name}</h4>
                <h6 class="card-subtitle mb-2 ml-3 text-muted">${product.producer}</h6>
                <p class="card-text ml-3">Ціна: ${product.price} грн.</p>
                <a href="#" class="btn btn-info m-3 ">Детальніше</a>
            </div>

        <#else>
           <h4>Такого товару немає</h4>
        </#list>
    </div>
</@c.page>