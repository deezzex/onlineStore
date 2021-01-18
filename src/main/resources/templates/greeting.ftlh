<#import "parts/common.ftl" as c>

<@c.page>
    <h2 class="text-center mb-3 ">Вітаємо вас у нашому магазині!</h2>


    <div class="container form-row">
        <a class="btn btn-info mt-3 form-group col" data-toggle="collapse" href="#collapseExample1" role="button" aria-expanded="false" aria-controls="collapseExample">
            Про нас</a>
        <div class="collapse" id="collapseExample1">
            <div class="form-group mt-3">
                <div class="card card-body">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.
                </div>
            </div>
        </div>
        <a class="btn btn-warning mt-3 form-group col ml-2" data-toggle="collapse" href="#collapseExample2" role="button" aria-expanded="false" aria-controls="collapseExample">
            Послуги</a>
        <div class="collapse" id="collapseExample2">
            <div class="form-group mt-3">
                <div class="card card-body">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.
                </div>
            </div>
        </div>
        <a class="btn btn-success mt-3 form-group col ml-2" data-toggle="collapse" href="#collapseExample3" role="button" aria-expanded="false" aria-controls="collapseExample">
            Команда</a>
        <div class="collapse" id="collapseExample3">
            <div class="form-group mt-3">
                <div class="card card-body">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.
                </div>
            </div>
        </div>
    </div>

    <div class="card text-dark bg-light mb-3 mt-3">
        <h4 class="card-header d-flex justify-content-center">Оффлайн магазин</h4>
        <div class="card-body">
            <p class="card-text">Нас можна знайти за адресою: Тернопільська обл., м.Теребовля, вул. Паращука 33 (на ринку)</p>

            <div class="card-footer ">
                <ul class="list-group list-group-flush ">
                    <li class="list-group-item d-flex justify-content-center">
                        <h4>Графік роботи:</h4>
                    </li>
                    <li class="list-group-item d-flex justify-content-center text-muted">Понеділок - Пятниця: 08:00 - 17:00</li>
                    <li class="list-group-item d-flex justify-content-center text-muted">Субота: 08:00 - 16:00</li>
                    <li class="list-group-item d-flex justify-content-center text-muted">Неділя: 09:00 - 14:00</li>
                </ul>
            </div>
        </div>
    </div>

    <div class="container">
        <a class="btn btn-primary mt-3 form-group col" data-toggle="collapse" href="#collapseResponse" role="button" aria-expanded="false" aria-controls="collapseExample">
            Відгуки наших клієнтів <3 </a>
        <div class="collapse col" id="collapseResponse">
            <div class="form-group mt-3">
                <div class="card row">
                    <h5 class="card-header">Іван Іваненко</h5>
                    <div class="card-body">
                        <h5 class="card-title">Чудовий персонал!</h5>
                        <p class="card-text">With supporting text below as a natural lead-in to additional content. Cards assume no specific width to start, so they’ll be 100% wide unless otherwise stated. You can change this as needed with custom CSS, grid classes, grid Sass mixins, or utilities.</p>
                    </div>
                </div>

                <div class="card row mt-2">
                    <h5 class="card-header">Сергій Козаков</h5>
                    <div class="card-body">
                        <h5 class="card-title">Зручний сайт!</h5>
                        <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                    </div>
                </div>

                <div class="card row mt-2">
                    <h5 class="card-header">Петро Петренко</h5>
                    <div class="card-body">
                        <h5 class="card-title">Швидка доставка!</h5>
                        <p class="card-text">With supporting text below as a natural lead-in to additional content. With supporting text below as a natural lead-in to additional content.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="d-flex justify-content-center">
        <div class="spinner-grow text-primary m-5" role="status">
            <span class="visually-hidden"></span>
        </div>
        <div class="spinner-grow text-secondary m-5" role="status">
            <span class="visually-hidden"></span>
        </div>
        <div class="spinner-grow text-success m-5" role="status">
            <span class="visually-hidden"></span>
        </div>
        <div class="spinner-grow text-danger m-5" role="status">
            <span class="visually-hidden"></span>
        </div>
        <div class="spinner-grow text-warning m-5" role="status">
            <span class="visually-hidden"></span>
        </div>
        <div class="spinner-grow text-info m-5" role="status">
            <span class="visually-hidden"></span>
        </div>
        <div class="spinner-grow text-dark m-5" role="status">
            <span class="visually-hidden"></span>
        </div>
    </div>
</@c.page>