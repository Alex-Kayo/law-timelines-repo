{$timeoutError}
<div class="feedback-form">
    <div class="accreditation-form__heading">
        Fill out the feedback form 
    </div>

    <div class="alert alert-warning">
       All fields are required
    </div>

    <div class="row">
        <div class="form-group col-md-12">
            <label for="exampleAdresat">{$i18n.recipient}</label>
            <select class="selectpicker" name="addressee" id="addressee">
                {foreach item=data from=$addressee}
                    <option value="{$data.fba_id}" {$data.selected}>{$data.fba_nickname} </option>
                {/foreach}
                {*<option>Верховна Рада України</option>
                <option>test 2</option>*}
            </select>
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-6">
            <label>{$i18n.name}</label>
            <input type="text" class="form-control" name="lname" id="name" value="{$value.name}">
            <span class="warn">{$errors.name}</span>
        </div>
            <div class="form-group col-md-6">
            <label>{$i18n.email}</label>
            <input type="text" class="form-control" name="email" id="email" value="{$value.email}">
            <span class="warn">{$errors.email}</span>
        </div>
        {*<div class="form-group col-md-6">
            <label>{$i18n.post}</label>
            <input type="text" class="form-control" name="job" id="job" value="">
            <span class="warn"></span>
        </div>*}
    </div>
    <div class="row">
        {*<div class="form-group col-md-6">
            <label>{$i18n.email}</label>
            <input type="text" class="form-control" name="email" id="email" value="">
            <span class="warn"></span>
        </div>*}
        {*<div class="form-group col-md-6">
            <label>{$i18n.phone}</label>
            <input type="text" class="form-control" name="phone" id="phone" value="">
            <span class="warn"></span>
        </div>*}
    </div>
    <div class="row">
        <div class="form-group col-md-12">
            <label>{$i18n.theme}</label>
            <input type="text" class="form-control" name="theme" id="theme" value="{$value.theme}">
            <span class="warn">{$errors.theme}</span>
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-12">
            <label>{$i18n.message}</label>
            <textarea class="form-control" rows="6" id="text">{$value.text}</textarea>
            <span class="warn">{$errors.text}</span>
        </div>
    </div>


    <!-- -->
{*    Captcha here*}
    <!-- -->
    <div class="form-group capchure">

         <label><span class="starr"></span>{$i18n.captcha}</label>
         <div class="g-recaptcha" data-sitekey="Ключ">{$captcha}</div>
{*            {$captcha}*}
            <input type="text" class="form-control" name="captcha" value="" id="captcha"/>
            <span class="warn">{$errors.captcha}</span>
        {*        <div class="g-recaptcha" data-sitekey="Ключ"></div>*}
    </div>

    <div class="form-group">
        <input type="submit" class="btn btn-primary" value="Submit" onclick="sendMsg();
                        return false;">
    </div>


</div>


