<#import "parts/common.ftl" as c>

<@c.page>

    <form method="post" action="/basket/new-order">
        <div class="form-group">
            <input type="text" class="form-control" name="city" placeholder="Місто доставки" />
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="street" placeholder="Адрес доставки">
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="phone" placeholder="Мобільний телефон">
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="firstName" placeholder="Імя одержувача">
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="lastName" placeholder="Прізвище одержувача">
        </div>
        <div class="alert alert-warning" role="alert">
            <p>Після формування замовлення з Вами звяжеться продавець для підтвердження замовлення.</p>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <div class="form-group">
            <button type="submit" class="btn btn-success">Готово!</button>
        </div>
    </form>

</@c.page>