<#include "security.ftl">
<#import "login.ftl" as l>

<nav class="navbar navbar-expand-lg navbar-dark border-bottom border-info border-5" style="background-color: #919cc2;">
    <a class="align-self-center navbar-brand" href="#">
        <i class="fas fa-home fa-1x"></i>
    </a>
    <a class="navbar-brand" href="/">Все для газди!</a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">


                 <div class="btn-group" role="group" aria-label="Basic outlined example">

                     <#if user??>
                         <a type="button"  href="/main" class="btn btn-outline-light">Товари</a>
                         <a type="button" href="/user/profile" class="btn btn-outline-light">Профіль</a>
                         <a type="button" href="/basket/${user.id}" class="btn btn-outline-light">Корзина</a>
                     </#if>

                 </div>
                     <#if isAdmin>
                         <div class="btn-group  ml-5" role="group" aria-label="Basic outlined example">
                             <a type="button" href="/user" class="btn btn-outline-light">Користувачі</a>
                             <a type="button" href="/product" class="btn btn-outline-light">Товари</a>
                             <a type="button" href="#" class="btn btn-outline-light">Замовлення</a>
                             <a type="button" href="/product/add" class="btn btn-outline-light">Додати</a>
                         </div>

                     </#if>
            <#if !user??>
                <a class="navbar-brand text-center d-flex justify-content-center " style="color: #e7eba4;" href="/">Для того щоб побачити каталог товарів потрібно увійти в обліковий запис! </a>
            </#if>
        </ul>
        <#if user??>

        <a class="mr-3 align-self-center" href="#">
            <i class="far fa-heart fa-2x"></i>
        </a>

        </#if>
        <a class="mr-3 align-self-center" href="https://www.google.com.ua/maps/place/%D0%92%D1%81%D0%B5+%D0%B4%D0%BB%D1%8F+%D0%B3%D0%B0%D0%B7%D0%B4%D0%B8+-+%D0%A3+%D0%92%D0%B0%D1%81%D0%B8%D0%BB%D1%8F/@49.2970172,25.6892303,18.5z/data=!4m5!3m4!1s0x0:0x1ffdd58c15330e8d!8m2!3d49.2976051!4d25.6900397?hl=uk&authuser=0">
            <i class="fas fa-map-marked-alt fa-2x"></i>
        </a>
        <a class="mr-3 align-self-center" href="https://www.facebook.com/%D0%9C%D0%B0%D0%B3%D0%B0%D0%B7%D0%B8%D0%BD-%D0%B3%D0%BE%D1%81%D0%BF%D0%BE%D0%B4%D0%B0%D1%80%D1%81%D1%8C%D0%BA%D0%B8%D1%85-%D1%82%D0%BE%D0%B2%D0%B0%D1%80%D1%96%D0%B2-%D0%92%D1%81%D0%B5-%D0%B4%D0%BB%D1%8F-%D0%B4%D0%BE%D0%BC%D1%83%D0%A3-%D0%92%D0%B0%D1%81%D0%B8%D0%BB%D1%8F-104928374787762">
            <i class="fab fa-facebook fa-2x"></i>
        </a>

        <span class="badge  bg-warning text-dark navbar-text mr-3"> ${name} </span>

        <#if user??><@l.logout /></#if>
        <#if !user??>
            <a type="button" href="/login" class="btn btn-success border">Увійти</a>
        </#if>
    </div>
</nav>