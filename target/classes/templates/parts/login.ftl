<#macro login path>
    <form action="${path}" method="post">
        <div><label> User Name : <input type="text" name="username"/> </label></div>
        <div><label> Password: <input type="password" name="password"/> </label></div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <div><input type="submit" value="Увійти!"/></div>
    </form>
</#macro>

<#macro register path>
    <form action="${path}" method="post">
        <div><label> UserName : <input type="text" name="username"/> </label></div>
        <div><label> Password: <input type="password" name="password"/> </label></div>
        <div><label> email: <input type="email" name="email"/> </label></div>
        <div><label> FirstName: <input type="text" name="firstName"/> </label></div>
        <div><label> LastName: <input type="text" name="lastName"/> </label></div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <div><input type="submit" value="Зареєструватись!"/></div>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <input type="submit" value="Вийти з профілю!"/>
    </form>
</#macro>