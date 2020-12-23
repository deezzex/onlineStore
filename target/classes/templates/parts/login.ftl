<#macro login path isRegisterForm>
    <form  action="${path}" method="post">
        <div class="form-group row">
            <div class="col-sm-12">
                <input type="text" name="username" class="form-control" placeholder="User name" />
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-12">
                <input type="password" name="password" class="form-control" placeholder="Password" />
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-success" type="submit"><#if isRegisterForm>Create<#else>Увійти</#if></button>
        <#if !isRegisterForm><a href="/registration" class="btn btn-warning m-3 ">Зареєструватись</a></a></#if>
    </form>
</#macro>

<#macro register path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row">
            <div class="col-sm-12">
                <input type="text" name="username" class="form-control" placeholder="username" />
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-12">
                <input type="password" name="password" class="form-control" placeholder="password" />
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-12">
                <input type="email" name="email" class="form-control" placeholder="email" />
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-12">
                <input type="text" name="firstName" class="form-control" placeholder="firstName (Ім'я)" />
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-12">
                <input type="text" name="lastName" class="form-control" placeholder="lastName (Прізвище)" />
            </div>
        </div>

        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-success" type="submit"><#if isRegisterForm>Заруєструватись<#else>Увійти</#if></button>
    </form>
    <div class="alert alert-success mt-5" role="alert">
        <h4 class="alert-heading">Круто!</h4>
        <p>Після того як нажмеш кнопку "Зареєструватись" на вказану електронну пошту прийде код активації, будь-ласка перейди по посиланню яке буде в листі.</p>
        <hr>
        <p class="mb-0">Хорошого для.</p>
    </div>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-danger" type="submit">Вийти</button>
    </form>
</#macro>