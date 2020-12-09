<#import "parts/common.ftl" as c>

<@c.page>

    <div class="badge bg-warning text-wrap mb-3" style="width: 6rem;">
        <h3>${username}</h3>
    </div>
    ${message!}

    <ul class="list-group mb-3">
        <li class="list-group-item">${user.firstName}</li>
        <li class="list-group-item">${user.lastName}</li>
        <li class="list-group-item">${user.email}</li>
    </ul>

    <a class="btn btn-info mb-3" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Показати пароль</a>
    <div class="collapse" id="collapseExample">
        <div class="form-group">
                <div class="form-group">
                    <ul class="list-group mb-3">
                        <li class="list-group-item">${user.password}</li>
                    </ul>
                </div>
        </div>
    </div>


    <form method="post">
        <div class="alert alert-info row" role="alert">
            Форма редагування профілю <a href="#" class="alert-link"></a>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Новий пароль:</label>
            <div class="col-sm-6">
                <input type="password" name="password" class="form-control" placeholder="Password" />
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Новий Емейл:</label>
            <div class="col-sm-6">
                <input type="email" name="email" class="form-control" placeholder="some@some.com" value="${email!''}" />
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-primary" type="submit">Зберегти</button>
    </form>
</@c.page>