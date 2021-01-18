<#import "parts/common.ftl" as c>
<#import "parts/pager.ftl" as p>
<@c.page>
    <div class="alert alert-success" role="alert">
        <h4>Ваші вподобані товари: </h4>
    </div>
    <@p.pager url page1/>
    <div class="card-columns">
        <#list page1.content as product>
            <#if product.meLiked!>
                <div class="card my-3 text-center border border-secondary border-5 rounded" style="width: 300px; height: 480px; background-color: #bdc3db;">

                    <img src="/img/${product.fileName!}" class="card-img-top" style="height: 300px">
                    <h4 class="card-title mt-3">${product.subtitle!}</h4>
                    <h6 class="card-subtitle text-muted mb-2">${product.producer!}</h6>
                    <p class="card-text">Ціна: ${product.price!} грн.</p>
                    <a href="/product/${product.id}" class="btn btn-info mb-2">Детальніше</a>

                    <a href="/product/${product.id}/like">
                        <#if product.meLiked!>
                            <i class="fas fa-heart"></i>
                        <#else>
                            <i class="far fa-heart"></i>
                        </#if>
                    </a>

                </div>
            </#if>
        </#list>
    </div>
</@c.page>