<div class="container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Головна</a></li>
            <li class="breadcrumb-item active">Діяльність</li>            
        </ol>

        <div class="page-heading">
            Запобігання та протидія корупції
        </div>
</div>

<hr class="full-width">

<div class="container">  
    <div class="row">
            <div class="col-md-3">
                <div class="contents-pages">
                    <h4 class="section-heading">Зміст сторінки</h4>

                    <ul>
                        <li><a href="#menu1" class="scrollLink">Акти антикорупційного законодавства</a></li>
                        <li><a href="#menu2" class="scrollLink">Нормативні та організаційно-розпорядчі документи Апарату Верховної Ради України з питань запобігання корупції</a></li>
                        <li><a href="#menu3" class="scrollLink">Інформаційно-довідкові матеріали</a></li>                      
                    </ul>
                </div>
                
                {*
                <h4 class="section-heading">Європейська інтеграція</h4>
                <ul class="section__list">
                    <li><a href="https://zakon4.rada.gov.ua/rada/show/984_a11">Угода про асоціацію між Україною та Європейським Союзом</a></li>
                    <li><a href="/documents/interparlam/110358.html">Стан ратифікації Угоди про асоціацію між Україною та Європейським Союзом</a></li>
                </ul>

                <div class="parline-block">
                    <img src="img/parline.jpg" alt="">
                    <p>
                        <a href="http://archive.ipu.org/parline-e/parlinesearch.asp" target="_blank">
                            <b>Національні парламенти</b> <i class="icn-external"></i>
                        </a>
                    </p>
                    <a href="http://archive.ipu.org/parline-e/parlinesearch.asp" target="_blank">База даних «РARLINE»</a>
                </div>
                *}
            </div>
            <div class="col-md-9">
                <h2 class="hub-page__heading">
                    <a id="menu1"></a>
                    Акти антикорупційного законодавства
                    <i class="link-ico"></i>
                </h2>

                <ul class="link-list">
                    <li><a href="/documents/z_prd_k/150621.html">Перелік актів</a></li>                    
                </ul>

                <h2 class="hub-page__heading">
                    <a id="menu2"></a>
                    Нормативні та організаційно-розпорядчі документи Апарату Верховної Ради України з питань запобігання корупції
                    <i class="link-ico"></i>
                </h2>
                <ul class="link-list">
                    <li><a href="/documents/z_prd_k/150620.html">Перелік документів</a></li>                   
                </ul>

                <h2 class="hub-page__heading">
                    <a id="menu3"></a>
                    Інформаційно-довідкові матеріали
                    <i class="link-ico"></i>
                </h2>
                <ul class="link-list">
                    <li><a href="/documents/z_prd_k/150622.html">Список матеріалів</a></li>                    
                </ul>
                
                {*
                <h2 class="hub-page__heading">
                    <a id="menu4"></a>
                    Спільні міжпарламентські комісії
                    <i class="link-ico"></i>
                </h2>
                <ul class="link-list">
                    <li><a href="http://w1.c1.rada.gov.ua/pls/mpz2/organizations.inter_commission_members?inter_commission=573">Міжпарламентська комісія зі співробітництва Верховної Ради України та Національних Зборів Республіки Білорусь</a></li>
                </ul>
                
                <h2 class="hub-page__heading">
                    <a id="menu5"></a>
                    Депутатські групи з міжпарламентських зв'язків із зарубіжними країнами
                    <i class="link-ico"></i>
                </h2>
                <ul class="link-list">
                    <li><a href="http://w1.c1.rada.gov.ua/pls/mpz2/organizations.dep_groups">Перелік зарубіжних країн щодо яких створюються депутатські групи</a></li>
                </ul>
                *}

            </div>
        </div><!--/row-->
        
    </div><!--/container-->
    
    {*
    <hr class="full-width">
    
    <section class="news-group">
        <div class="container">
            <div class="table-block">
                <div class="tr-block">
                    <div class="td-block">
                        <h2>Новини депутатських груп з міжпарламентських зв’язків із зарубіжними країнами</h2>
                    </div>
                    <div class="td-block">
                        <div class="more-link full-bg">
                            <a id="menu5" href="http://w1.c1.rada.gov.ua/pls/mpz2/organizations.dep_groups">Список усіх депутатських груп</a>
                        </div>
                    </div>
                </div>
                
                
            </div>
            
            <div class="news-group__list column-3-list">
                
                ----------Динаміка - вивід новин депутатських груп з міжпарламентських зв’язків із зарубіжними країнами-------------
                {foreach item=data from=$block_data.11.items}
                            <div class="news-item">
                                 <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year};{$data->hour}</span>
                                 <p>
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">
                                 {$data->i_name}
                            </a>
                                 </p>
                                 </div>
                    {/foreach}
                
                <div class="breakavoid">
                    <span class="date">23:38, 20 грудня 2018</span>
                    <a href="#">
                        Комітет з питань екологічної політики, природокористування та ліквідації наслідків Чорнобильської катастрофи надав рекомендації за результатами аудиту Рахункової палати щодо ефективності використання коштів на виплати постраждалим внаслідок аварії на ЧАЕС
                    </a>
                </div>
                
                <div class="breakavoid">
                    <span class="date">23:38, 20 грудня 2018</span>
                    <a href="#">
                        Комітет з питань законодавчого забезпечення правоохоронної діяльності рекомендує Верховній Раді прийняти за основу законопроект щодо забезпечення гармонізації кримінального законодавства з положеннями міжнародного права


                    </a>
                </div>
                
                <div class="breakavoid">
                    <span class="date">23:38, 20 грудня 2018</span>
                    <a href="#">
                        У Комітеті з питань запобігання і протидії корупції розглянули питання забезпечення належного збереження і охорони будинків–пам’яток у Києві


                    </a>
                </div>
                
            </div>
            
        </div><!--/container-->    
        
    </section>
    *}
    
    
{literal}
<script>
    $(document).ready(function(){
        $( "a.scrollLink" ).click(function( event ) {
            event.preventDefault();
            $("html, body").animate({ scrollTop: $($(this).attr("href")).offset().top - 100 }, 500);
        });
    });   
</script>
{/literal}