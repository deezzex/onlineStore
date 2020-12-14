<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<#import "parts/pager.ftl" as p>
<#include "parts/security.ftl">

<@c.page>
    <img src="/img/1.jpg" class="d-block w-100 border border-9 border-primary" alt="...">

    <div class="form-row mt-3">
        <div class="form-group col">
            <form method="get" action="/main" class="form-inline">
                <div class="col-sm-11 col-form-label form-group row">
                    <input type="text" name="filter" class="form-control col" value="${filter!}" placeholder="Пошук за назвою">
                </div>
                <button type="submit" class="btn btn btn-success ml-2">Шукати</button>
            </form>
        </div>
    </div>

    <div class="card-columns">
        <#list page1.content as product>
            <div class="card my-3 text-center border border-secondary border-5 rounded" style="width: 300px; height: 480px; background-color: #f0cccf">

                    <img src="/img/${product.fileName!}" class="card-img-top" style="height: 300px">
                <h4 class="card-title mt-3">${product.name!}</h4>
                <h6 class="card-subtitle text-muted mb-2">${product.producer!}</h6>
                <p class="card-text">Ціна: ${product.price!} грн.</p>
                <a href="/product/${product.id}" class="btn btn-info mb-2">Детальніше</a>
            </div>

        <#else>
           <h4>Такого товару немає</h4>
        </#list>
    </div>

    <@p.pager url page1/>

</@c.page>