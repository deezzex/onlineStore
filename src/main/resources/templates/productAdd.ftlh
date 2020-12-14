<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>

    <h3>Додавання нового товару</h3>
    <div class="form-group mt-4">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" class="form-control" name="name" placeholder="Назва" />
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="consist" placeholder="Склад">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="description" placeholder="Опис">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="producer" placeholder="Виробник">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="price" placeholder="Ціна">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="subtitle" placeholder="Підзаголовок">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="weight" placeholder="Вага">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="evaluationForm" placeholder="Форма оцінювання">
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file" id="customFile">
                    <label class="custom-file-label" for="customFile">Вибрати фото</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Добавити товар</button>
            </div>
        </form>
    </div>


</@c.page>