<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<#import "parts/pager.ftl" as p>
<#include "parts/security.ftl">

<@c.page>
    <img src="/img/2.jpg" class="d-block w-100 border border-9 border-primary" alt="...">

    <div class="form-row mt-3">
        <div class="form-group col">
            <form method="get" action="/main" class="form-inline">
                <div class="col-sm-10 col-form-label form-group row">
                    <input type="text" name="filter" class="form-control col" value="${filter!}" placeholder="Пошук за назвою">
                </div>
                <button type="submit" class="btn btn btn-success ml-2">Шукати</button>

                <a class="btn btn-warning ml-2" data-toggle="collapse" href="#collapseCategory" role="button" aria-expanded="false" aria-controls="collapseExample">
                    Категорії</a>
            </form>
        </div>
    </div>

    <div class="collapse" id="collapseCategory">
        <table class="table mt-2">
            <tbody>
            <tr>
                <form method="get" action="/main/category" class="form-inline">
                    <input type="hidden" name="category" value="TOOL">
                    <td><button type="submit" class="btn btn btn-outline-info">Інструменти</button></td>
                </form>
                <form method="get" action="/main/category" class="form-inline">
                    <input type="hidden" name="category" value="FURNITURE">
                    <td><button type="submit" class="btn btn btn-outline-info">Фурнітура</button></td>
                </form>
                <form method="get" action="/main/category" class="form-inline">
                    <input type="hidden" name="category" value="PLUMBING">
                    <td><button type="submit" class="btn btn btn-outline-info">Сантехніка</button></td>
                </form>
                <form method="get" action="/main/category" class="form-inline">
                    <input type="hidden" name="category" value="SUPPLIES">
                    <td><button type="submit" class="btn btn btn-outline-info">Витратні матеріали</button></td>
                </form>
                <form method="get" action="/main/category" class="form-inline">
                    <input type="hidden" name="category" value="PAINT">
                    <td><button type="submit" class="btn btn btn-outline-info">Краски</button></td>
                </form>
            </tr>
            <tr>
                <form method="get" action="/main/category" class="form-inline">
                    <input type="hidden" name="category" value="METAL">
                    <td><button type="submit" class="btn btn btn-outline-info">Метал</button></td>
                </form>
                <form method="get" action="/main/category" class="form-inline">
                    <input type="hidden" name="category" value="LIGHTING">
                    <td><button type="submit" class="btn btn btn-outline-info">Освітлення</button></td>
                </form>
                <form method="get" action="/main/category" class="form-inline">
                    <input type="hidden" name="category" value="GARDEN">
                    <td><button type="submit" class="btn btn btn-outline-info">Для саду</button></td>
                </form>
                <form method="get" action="/main/category" class="form-inline">
                    <input type="hidden" name="category" value="ELECTRIC">
                    <td><button type="submit" class="btn btn btn-outline-info">Електрика</button></td>
                </form>
                <form method="get" action="/main/category" class="form-inline">
                    <input type="hidden" name="category" value="BUILD_MATERIAL">
                    <td><button type="submit" class="btn btn btn-outline-info">Буд. матеріали</button></td>
                </form>
            </tr>

            <tr>
                <form method="get" action="/main/category" class="form-inline">
                    <input type="hidden" name="category" value="ACCESSORIES">
                    <td><button type="submit" class="btn btn btn-outline-info">Аксесуари</button></td>
                </form>
                <form method="get" action="/main/category" class="form-inline">
                    <input type="hidden" name="category" value="SCREW">
                    <td><button type="submit" class="btn btn btn-outline-info">Гвинти</button></td>
                </form>
                <form method="get" action="/main/category" class="form-inline">
                    <input type="hidden" name="category" value="TECHNIC">
                    <td><button type="submit" class="btn btn btn-outline-info">Техніка</button></td>
                </form>
                <form method="get" action="/main/category" class="form-inline">
                    <input type="hidden" name="category" value="FASTENING">
                    <td><button type="submit" class="btn btn btn-outline-info">Кріплення</button></td>
                </form>
                <form method="get" action="/main/category" class="form-inline">
                    <input type="hidden" name="category" value="LINOLEUM">
                    <td><button type="submit" class="btn btn btn-outline-info">Лінолеуми</button></td>
                </form>
            </tr>
            </tbody>
        </table>
    </div>

    <@p.pager url page1/>
    <hr/>
    <div class="card-columns">
        <#list page1.content as product>
            <div class="card my-3 text-center border border-secondary border-5 rounded" style="width: 300px; height: 490px; background-color: #bdc3db;">

                <img src="/img/${product.fileName!}" class="card-img-top" style="height: 300px">
                <h4 class="card-title mt-3">${product.subtitle!}</h4>

                <h6 class="card-subtitle text-muted mb-2">${product.producer!}</h6>
                <p class="card-text">Ціна: ${product.price!} грн.</p>
                <a href="/product/${product.id}" class="btn btn-info mb-2">Детальніше</a>
                <#if !filterIsEmpty??>
                    <a href="/product/${product.id}/like" class="ml-1">
                        <#if product.meLiked!>
                            <i class="fas fa-heart"></i>
                        <#else>
                            <i class="far fa-heart"></i>
                        </#if>
                        ${product.likes!}
                    </a>
                </#if>
            </div>

        <#else>
            <h4>Такого товару немає</h4>
        </#list>
    </div>
    <hr/>
    <@p.pager url page1/>

</@c.page>