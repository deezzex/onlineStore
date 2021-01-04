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
                <input type="text" name="username"
                       value="<#if user??>${user.username}</#if>"
                       class="form-control ${(usernameError??)?string('is-invalid','')}"
                       placeholder="username" />
                <#if usernameError??>
                    <div class="invalid-feedback">
                        ${usernameError}
                    </div>
                </#if>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-12">
                <input type="password" name="password"
                       class="form-control ${(passwordError??)?string('is-invalid','')}"
                       placeholder="password" />
            </div>
            <#if passwordError??>
                <div class="invalid-feedback">
                    ${passwordError}
                </div>
            </#if>
        </div>

        <div class="form-group row">
            <div class="col-sm-12">
                <input type="password" name="password2" class="form-control ${(password2Error??)?string('is-invalid','')}" placeholder="Retype password" />
            </div>
            <#if password2Error??>
                <div class="invalid-feedback">
                    ${password2Error}
                </div>
            </#if>
        </div>

        <div class="form-group row">
            <div class="col-sm-12">
                <input type="email" name="email"
                       value="<#if user??>${user.email}</#if>"
                       class="form-control ${(emailError??)?string('is-invalid','')}"
                       placeholder="email" />
            </div>
            <#if emailError??>
                <div class="invalid-feedback">
                    ${emailError}
                </div>
            </#if>
        </div>

        <div class="form-group row">
            <div class="col-sm-12">
                <input type="text" name="firstName"
                       value="<#if user??>${user.firstName}</#if>"
                       class="form-control ${(firstNameError??)?string('is-invalid','')}"
                       placeholder="firstName (Ім'я)" />
            </div>
            <#if firstNameError??>
                <div class="invalid-feedback">
                    ${firstNameError}
                </div>
            </#if>
        </div>

        <div class="form-group row">
            <div class="col-sm-12">
                <input type="text" name="lastName"
                       value="<#if user??>${user.lastName}</#if>"
                       class="form-control ${(lastNameError??)?string('is-invalid','')}"
                       placeholder="lastName (Прізвище)" />
            </div>
            <#if lastNameError??>
                <div class="invalid-feedback">
                    ${lastNameError}
                </div>
            </#if>
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