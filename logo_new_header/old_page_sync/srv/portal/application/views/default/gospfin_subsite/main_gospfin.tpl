{*  Хедер та меню новинного сайту      *}
{include file= "gospfin_subsite/gospfin_menu.tpl"}
{*/  Хедер та меню новинного сайту      *}
{*{literal}
<style>
    #menu1 {
	padding-top: 12rem;
	margin-top: -10rem;
}
    #menu2 {
	padding-top: 12rem;
	margin-top: -10rem;
}
    #menu3 {
	padding-top: 12rem;
	margin-top: -10rem;
}
    #menu4 {
	padding-top: 12rem;
	margin-top: -10rem;
}
     
</style>
{/literal} *}
<div class="container" style="padding-left: 1rem;padding-right: 1rem;">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Головна</a></li>
            <li class="breadcrumb-item active">Діяльність</li>
            <li class="breadcrumb-item"><a href="/gospfin">Фінансово- господарська діяльність</a></li>
        </ol>

        <div class="page-heading">
           Бюджетне планування
        </div>

        <div class="row">
        {*<div class="col-lg-9 col-md-8">
            <div class="contents-pages" style="background: rgba(238, 234, 5, 0.1);">
                <h2 class="section-heading">Бюджетне планування</h2>
            
        </div>
    </div>*}
        <div class="row">
            <div class="col-lg-3 col-md-4">
                <div class="contents-pages">
                    <h4 class="section-heading">Зміст розділу</h4>

                    <ul>
                        <li><a href="#menu1" class="scrollLink">Бюджетні запити</a></li>
                        <li><a href="#menu2" class="scrollLink">Проект кошторису Верховної Ради України</a></li>
                        <li><a href="#menu3" class="scrollLink">Кошториси розпорядників та одержувачів бюджетних коштів</a></li>
                        <li><a href="#menu4" class="scrollLink">Паспорти бюджетних програм</a></li>
                        {*<li><a href="#menu3" class="scrollLink">Інформація про бюджет</a></li>
                        <li><a href="#menu4" class="scrollLink">Річні плани закупівель</a></li>*}
                        {*<li><a href="#menu5" class="scrollLink">Відкриті торги</a></li>
                        <li><a href="#menu6" class="scrollLink">Внутрішній аудит</a></li>*}
                    </ul>
                </div>

                              
                {*<h4 class="section-heading">Транспорт, компенсації, оренда держмайна</h4>
                <ul class="section__list">
                    <li><a href="/documents/gosp_fin_dij_doc/other/inf_transp_zas">Використання транспортних засобів народними депутатами України службових чергових автомобілів</a></li>
                    <li><a href="/documents/gosp_fin_dij_doc/komnsecii-nd/">Компенсації народним депутатам України для оренди житла</a></li>
                    <li><a href="/documents/gosp_fin_dij_doc/other/125075.html">Оголошення господарсько-фінансової діяльності</a></li>
                </ul>*}
            </div>
                        
            
            <div class="col-lg-9 col-md-8">
                <h2 class="hub-page__heading">
                    <a id="menu1" style="padding-top: 12rem;margin-top: -10rem;"></a>
                    Бюджетні запити
                    <i class="link-ico"></i>
                </h2>
                <div class="row">
                    {*                    
                    {foreach item=data from=$block_data.10.items}
                        <div class="slice3 col-lg-4 col-md-6">
                            <div class="hub-request__heading"><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a></div>
                                <ul class="hub-request__files">
                                    
                                    <li>
                                        <div>
                                            <a href="/uploads/documents/52704.doc">Бюджетний запит 2019-3.2</a>
                                        </div>
                                        <span>Файл Microsoft Word, 110 KБайт</span>
                                    </li>
                                </ul>                                
                        </div>
                    {/foreach}
                    *}
                    <div class="slice3 col-lg-4 col-md-6">
                        <div class="hub-request__heading">Бюджетні запити на 2024-2026 роки</div>
                        <ul class="hub-request__files">
                            <li>
                                <div>
                                    <a href="/uploads/documents/74546.pdf">Бюджетний запит на 2024-2026 форма БЗ-1</a>
                                </div>
                                <span>Файл Portable Document Format, 0.35 MБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/74545.pdf">Бюджетний запит на 2024-2026 форма БЗ-2 010</a>
                                </div>
                                <span>Файл Portable Document Format, 0,36 MБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/74544.pdf">Бюджетний запит на 2024-2026 форма БЗ-2 020</a>
                                </div>
                                <span>Файл Portable Document Format, 0,37 MБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/74543.pdf">Бюджетний запит на 2024-2026 форма БЗ-2 090</a>
                                </div>
                                <span>Файл Portable Document Format, 0,35 MБайт</span>
                            </li>
                        </ul>
                    </div>
                    <div class="slice3 col-lg-4 col-md-6">
                        <div class="hub-request__heading">Бюджетні запити на 2023-2025 роки</div>
                        <ul class="hub-request__files">
                            <li>
                                <div>
                                    <a href="/uploads/documents/73952.pdf">Бюджетний запит на 2023-2025 роки загальний (Форма 2023-1)</a>
                                </div>
                                <span>Файл Portable Document Format, 0.35 MБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/73951.pdf">Бюджетний запит на 2023-2025 роки індивідуальний, Форма 2023-2</a>
                                </div>
                                <span>Файл Portable Document Format, 0,52 MБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/73950.pdf">Бюджетний запит на 2023 рік додатковий, Форма 2023-3, п. 1-2.1</a>
                                </div>
                                <span>Файл Portable Document Format, 0,37 MБайт</span>
                            </li>                            
                        </ul>
                    </div>
                     <div class="slice3 col-lg-4 col-md-6">
                        <div class="hub-request__heading">Бюджетні запити на 2022-2024 роки</div>
                        <ul class="hub-request__files">
                            <li>
                                <div>
                                    <a href="/uploads/documents/70224.doc">Бюджетний запит на 2023-2024 роки (форма 3, п.2.2)</a>
                                </div>
                                <span>Файл Microsoft Word, 0.13 MБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/70223.doc">Бюджетний запит на 2022 рік (форма 2022-3, п.1-2,1)</a>
                                </div>
                                <span>Файл Microsoft Word, 0,14 MБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/70220.doc"> Бюджетний запит на 2022-2024 роки (форма 2022-2)</a>
                                </div>
                                <span>Файл Microsoft Word, 1,04 MБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/70219.doc">Бюджетний запит на 2022-2024 роки (форма 2022-1)</a>
                                </div>
                                <span>Файл Microsoft Word, 0,05 MБайт</span>
                            </li>
                        </ul>
                    </div>
                     <div class="slice3 col-lg-4 col-md-6">
                        <div class="hub-request__heading">Бюджетні запити на 2021-2023 роки</div>
                        <ul class="hub-request__files">
                            <li>
                                <div>
                                    <a href="/uploads/documents/64416.rtf">Бюджетний запит на 2022-2023 роки (форма 2021-3, п.2.2)</a>
                                </div>
                                <span>Файл Rich Text Format, 180 КБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/64415.rtf">Бюджетний запит на 2021 рік (форма 2021-3, п.1-2,1)</a>
                                </div>
                                <span>Файл Rich Text Format, 190 КБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/64414.rtf"> Бюджетний запит на 2021-2023 роки (форма 2021-2)</a>
                                </div>
                                <span>Файл Rich Text Format, 1,62 MБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/64413.doc">Бюджетний запит на 2021-2023 роки (форма 2021-1)</a>
                                </div>
                                <span>Файл Microsoft Word, 50 KБайт</span>
                            </li>
                        </ul>
                    </div>
                    <div class="slice3 col-lg-4 col-md-6">
                        <div class="hub-request__heading">Бюджетні запити на 2020-2022 роки</div>
                        <ul class="hub-request__files">
                            <li>
                                <div>
                                    <a href="/uploads/documents/58263.rtf">Бюдзапит на 2021-2022 (c п 22)</a>
                                </div>
                                <span>Файл Rich Text Format, 319 КБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/58262.rtf">Бюдзапит на 2020 рік </a>
                                </div>
                                <span>Файл Rich Text Format, 349 КБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/58261.doc">Бюджетний запит на 2020-2022 роки (Форма 2020-2)</a>
                                </div>
                                <span>Файл Microsoft Word, 769 KБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/58260.rtf">Бюджетний запит на 2020-2022 роки (Форма 2020-1)</a>
                                </div>
                                <span>Файл Rich Text Format, 89,1 КБайт</span>
                            </li>
                        </ul>
                    </div>
                    <div class="slice3 col-lg-4 col-md-6">
                        <div class="hub-request__heading">Бюджетні запити - 2019 рік</div>
                        <ul class="hub-request__files">
                            <li>
                                <div>
                                    <a href="/uploads/documents/52704.doc">Бюджетний запит 2019-3.2</a>
                                </div>
                                <span>Файл Microsoft Word, 110 KБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/52703.doc">Бюджетний запит 2019-3.1</a>
                                </div>
                                <span>Файл Microsoft Word, 147 KБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/52702.doc">Бюджетний запит 2019-2</a>
                                </div>
                                <span>Файл Microsoft Word, 740 KБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/52701.doc">Бюджетний запит 2019-1</a>
                                </div>
                                <span>Файл Microsoft Word, 43,5 KБайт</span>
                            </li>
                        </ul>
                    </div>
                    <div class="slice3 col-lg-4 col-md-6">
                        <div class="hub-request__heading">Бюджетні запити - 2018 рік</div>
                        <ul class="hub-request__files">
                            <li>
                                <div>
                                    <a href="/uploads/documents/43674.doc">Бюджетний запит 2018-3.2</a>
                                </div>
                                <span>Файл Microsoft Word, 106 KБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/43673.doc">Бюджетний запит 2018-3.1</a>
                                </div>
                                <span>Файл Microsoft Word, 127 KБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/43672.doc">Бюджетний запит 2018-2</a>
                                </div>
                                <span>Файл Microsoft Word, 889 KБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/43671.doc">Бюджетний запит 2018-1</a>
                                </div>
                                <span>Файл Microsoft Word, 41,5 KБайт</span>
                            </li>
                        </ul>
                    </div>
                    <div class="slice3 col-lg-4 col-md-6">
                        <div class="hub-request__heading">Бюджетні запити - 2017 рік</div>
                        <ul class="hub-request__files">
                            <li>
                                <div>
                                    <a href="/uploads/documents/43670.rtf">Бюджетний запит 2017-2</a>
                                </div>
                                <span>Файл Rich Text Format, 1,7 МБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/43669.rtf">Бюджетний запит 2017</a>
                                </div>
                                <span>Файл Rich Text Format, 39 KБайт</span>
                            </li>
                        </ul>
                    </div>                   
                    
                    <div class="show-prev-request col-lg-6">
                        <a href="#">Показати запити попередніх років</a>
                    </div>                   
                    <div class="more-link col-lg-6 text-right pt-0 pr-3">
                        <a href="/documents/gosp_fin_dij_doc/bd_zap/">Усі бюджетні запити</a>
                    </div>
                </div><!--/row-->

                                 
                     <!--/row-->
{*99999999999999999999999999999999999999999999999*}
{*<div class="col-md-9">*}

                <h2 class="hub-page__heading">
                   <a id="menu2" style="padding-top: 12rem;margin-top: -10rem;"> </a> 
                    Проект кошторису Верховної Ради України{*<br>Верховна Рада України*}
                    <i class="link-ico"></i>
                </h2>
                    
                <ul class="link-list">
                    
                    <div class="news-group__list  {*column-2-list*} {*column-list*} ">  
                
                {*----------Динаміка - вивід новин депутатських груп з міжпарламентських зв’язків із зарубіжними країнами---------*}               
                                 <div class="row">
                                      
                    {*{foreach item=data from=$block_data.6.items}*}
                    {foreach item=data from=$project_kosht}
                        <div class="  col-lg-4  col-md-6   ">
                             
                            <div class="news-item">
                                 <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year};{$data->hour}</span>
                                 <div class="hub-request__heading ">
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">
                                 {$data->i_name}
                            </a>
                                 </div>
                                </div>
                            {if $data->cntat}
                                <a href="#" class="paperclip-link">
                                    <i class="fas fa-paperclip"></i>
                                    {$data->cntat} вкладені файли
                                </a>
                            {/if} 
                    
                        </div>
                    {/foreach}
                </div>
                     <div class="more-link text-right   "><a href="{$lang_prefix}/{$data->i_categories}">Вся інформація розділу</a> </div>
            </div>
                </ul>
             
             
                        
 
                <h2 class="hub-page__heading">
                    <a id="menu3" style="padding-top: 12rem;margin-top: -10rem;"> </a>
                    Кошториси розпорядників та одержувачів бюджетних коштів{*<br>Верховна Рада України*}
                    <i class="link-ico"></i>
                </h2>
                      
                <ul class="link-list">
                    
                    <div class="news-group__list  {*column-2-list*} {*column-list*} ">  
                
                {*----------Динаміка - вивід новин депутатських груп з міжпарламентських зв’язків із зарубіжними країнами---------*}               
                                 <div class="row">
                    {*{foreach item=data from=$block_data.6.items}*}
                    {foreach item=data from=$kosht_rozporjad}
                        <div class="  col-lg-4  col-md-6   ">
                             
                            <div class="news-item">
                                 <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year};{$data->hour}</span>
                                 <div class="hub-request__heading ">
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">
                                 {$data->i_name}
                            </a>
                                 </div>
                                </div>
                            {if $data->cntat}
                                <a href="#" class="paperclip-link">
                                    <i class="fas fa-paperclip"></i>
                                    {$data->cntat} вкладені файли
                                </a>
                            {/if} 
                    
                        </div>
                    {/foreach}
                </div>
                     <div class="more-link text-right   "><a href="{$lang_prefix}/{$data->i_categories}">Вся інформація розділу</a> </div>
            </div>
                </ul>
             

{*99999999999999999999999999999*}

                <h2 class="hub-page__heading">
                    <a id="menu4" style="padding-top: 12rem;margin-top: -10rem;"></a>
                    Паспорти бюджетних програм
                    <i class="link-ico"></i>
                </h2>
                <div class="row">
                    <div class="slice3 col-lg-4 col-md-6">
                        <div class="hub-request__heading">Паспорти бюджетних програм на 2023 рік</div>
                        <ul class="hub-request__files">
                            <li>
                                <div>
                                    <a href="/uploads/documents/74713.pdf">Паспорт на 2023 рік за КПКВК 0111010 у редакції 07.11.2023 </a>
                                </div>
                                <span>Файл Portable Document Format, 0,37 МБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/74712.pdf">Паспорт на 2023 рік за КПКВК 0111020 у редакції 07.11.2023</a>
                                </div>
                                <span>Файл Portable Document Format, 0,38 МБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/74087.pdf">Паспорт на 2023 рік за КПКВК 0111010</a>
                                </div>
                                <span>Файл Portable Document Format, 0,38 МБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/74086.pdf">Паспорт на 2023 рік за КПКВК 0111020</a>
                                </div>
                                <span>Файл Portable Document Format, 0,39 МБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/74088.pdf">Паспорт на 2023 рік за КПКВК 0111090</a>
                                </div>
                                <span>Файл Portable Document Format, 0,35 МБайт</span>
                            </li>
                        </ul>
                    </div>
                    <div class="slice3 col-lg-4 col-md-6">
                        <div class="hub-request__heading">Паспорти бюджетних програм на 2022 рік</div>
                        <ul class="hub-request__files">
                            <li>
                                <div>
                                    <a href="/uploads/documents/72929.pdf"> Паспорт на 2022 рік за КПКВК 0111020 у редакції від 10.02.2022 </a>
                                </div>
                                <span>Файл Portable Document Format, 2,28 МБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/72928.pdf"> Паспорт на 2022 рік за КПКВК 0111010 у редакції від 10.02.2022</a>
                                </div>
                                <span>Файл Portable Document Format, 2,94 МБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/72815.pdf">  Паспорт на 2022 рік за КПКВК 0111090 у редакції від 04.02.2022</a>
                                </div>
                                <span>Файл Portable Document Format, 2,2 МБайт</span>
                            </li>
                                                          
                             
                        </ul>
                    </div>
                    <div class="slice3 col-lg-4 col-md-6">
                        <div class="hub-request__heading">Паспорти бюджетних програм на 2021 рік</div>
                        <ul class="hub-request__files">
                            <li>
                                <div>
                                    <a href="/uploads/documents/72463.pdf">     Паспорт на 2021 рік за КПКВК-0111010 у редакції від 30.12.2021</a>
                                </div>
                                <span>Файл Portable Document Format, 3,27 МБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/72462.pdf">    Паспорт на 2021 рік за КПКВК-0111090 у редакції від 23.12.2021 </a>
                                </div>
                                <span>Файл Portable Document Format, 2,06 МБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/72454.pdf">   Паспорт на 2021 рік за КПКВК-0111010 у редакції від 21.12.2021 </a>
                                </div>
                                <span>Файл Portable Document Format, 3,33 МБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/70818.pdf">  Паспорт на 2021 рік за КПКВК-0111010 у редакції від 11.10.2021 </a>
                                </div>
                                <span>Файл Portable Document Format, 3,95 МБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/69865.pdf"> Паспорт на 2021 рік за КПКВК-0111010 у редакції від 01.09.2021</a>
                                </div>
                                <span>Файл Portable Document Format, 4,24 МБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/69527.pdf"> Паспорт на 2021 рік за КПКВК-0111020 у редакції від 11.08.2021</a>
                                </div>
                                <span>Файл Portable Document Format, 3,44 МБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/68861.pdf"> Паспорт на 2021 рік за КПКВК-0111020 у редакції від 01.07.2021</a>
                                </div>
                                <span>Файл Portable Document Format, 3,35 МБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/68860.pdf"> Паспорт на 2021 рік за КПКВК-0111010 у редакції від 01.07.2021</a>
                                </div>
                                <span>Файл Portable Document Format, 3,65 МБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/66000.pdf"> Паспорт на 2021 рік за КПКВК-0111020</a>
                                </div>
                                <span>Файл Portable Document Format, 3,61 МБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/65976.pdf">Паспорт на 2021 рік за КПКВК 0111090</a>
                                </div>
                                <span>Файл Portable Document Format, 2,04 МБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/65971.pdf">Паспорт на 2021 рік за КПКВК 0111010</a>
                                </div>
                                <span>Файл Portable Document Format, 3,75 МБайт</span>
                            </li>
                        </ul>
                    </div>
                    <div class="slice3 col-lg-4 col-md-6">
                        <div class="hub-request__heading">Паспорти бюджетних програм на 2020 рік</div>
                        <ul class="hub-request__files">
                            {*<li>
                                <div>
                                    <a href="/uploads/documents/66010.doc">Звіти про виконання паспортів бюджетних програм за 2020 рік  </a>
                                </div>
                                <span>Файл Microsoft Word, 40 KБайт</span>
                            </li>*}
                            <li>
                                <div>
                                    <a href="/uploads/documents/65199.doc">Паспорт на 2020 рік за КПКВК 0111020 у редакції від 02.12.2020</a>
                                </div>
                                <span>Файл Microsoft Word, 110 KБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/65198.doc">Паспорт на 2020 рік за КПКВК 0111010 у редакції від 02.12.2020</a>
                                </div>
                                <span>Файл Microsoft Word, 100 KБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/64685.doc">Паспорт на 2020 рік за КПКВК 0111020 у редакції від 08.10.2020</a>
                                </div>
                                <span>Файл Rich Text Format, 200 KБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/64684.doc">Паспорт на 2020 рік за КПКВК 0111010 у редакції від 08.10.2020</a>
                                </div>
                                <span>Файл Rich Text Format, 170 KБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/64509.doc">Паспорт на 2020 рік за КПКВК 0111090 у редакції від 18.09.2020</a>
                                </div>
                                <span>Файл Microsoft Word, 80 KБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/63853.doc">Паспорт на 2020 рік за КПКВК 0111020 у редакції від 07.08.2020</a>
                                </div>
                                <span>Файл Microsoft Word, 120 KБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/62926.doc">Паспорт на 2020 рік за КПКВК 0111020 у редакції від 11.06.2020</a>
                                </div>
                                <span>Файл Microsoft Word, 123 KБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/62925.doc">Паспорт на 2020 рік за КПКВК 0111010 у редакції від 11.06.2020</a>
                                </div>
                                <span>Файл Microsoft Word, 111 KБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/61256.doc">Паспорт на 2020 рік за КПКВК 0111020</a>
                                </div>
                                <span>Файл Microsoft Word, 122 KБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/61255.doc">Паспорт на 2020 рік за КПКВК 0111090</a>
                                </div>
                                <span>Файл Microsoft Word, 71 KБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/61254.doc">Паспорт на 2020 рік за КПКВК 0111010</a>
                                </div>
                                <span>Файл Microsoft Word, 91 KБайт</span>
                            </li>
                        </ul>
                    </div>
                    <div class="slice3 col-lg-4 col-md-6">
                        <div class="hub-request__heading">Паспорти бюджетних програм на 2019 рік</div>
                        <ul class="hub-request__files">
                            <li>
                                <div>
                                    <a href="/uploads/documents/61350.doc">Звіти про виконання паспортів бюджетних програм на 2019 рік </a>
                                </div>
                                <span>Файл Rich Text Format, 74 KБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/59909.doc">Паспорт на 2019 рік за КПКВК 0111090 станом на 08.11.2019</a>
                                </div>
                                <span>Файл Microsoft Word, 70 KБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/59908.doc">Паспорт на 2019 рік за КПКВК 0111020 станом на 02.12.2019</a>
                                </div>
                                <span>Файл Microsoft Word, 108 KБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/59907.doc">Паспорт на 2019 рік за КПКВК 0111010 станом на 02.12.2019</a>
                                </div>
                                <span>Файл Microsoft Word, 100 KБайт</span>
                            </li>
                        </ul>
                        {*<ul class="hub-request__files">
                            <li>
                                <div>
                                    <a href="/uploads/documents/54471.doc">Паспорт на 2019 рік за КПКВК 0111090</a>
                                </div>
                                <span>Файл Microsoft Word, 79 KБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/54470.doc">Паспорт на 2019 рік за КПКВК 0111020</a>
                                </div>
                                <span>Файл Microsoft Word, 108 KБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/54469.doc">Паспорт на 2019 рік за КПКВК 0111010</a>
                                </div>
                                <span>Файл Microsoft Word, 114 KБайт</span>
                            </li>
                        </ul>*}
                    </div>
                    <div class="slice3 col-lg-4 col-md-6">
                        <div class="hub-request__heading">Паспорти бюджетних програм на 2018 рік</div>
                        <ul class="hub-request__files">
                            <li>
                                <div>
                                    <a href="/uploads/documents/61257.doc">Звіт про виконання паспортів бюджетних програм за 2018 рік</a>
                                </div>
                                <span>Файл Microsoft Word, 32 KБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/54368.doc">Паспорт на 2018 рік за КПКВК 0111090</a>
                                </div>
                                <span>Файл Microsoft Word, 74 KБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/54367.doc">Паспорт на 2018 рік за КПКВК 0111020</a>
                                </div>
                                <span>Файл Microsoft Word, 136 KБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/54366.doc">Паспорт на 2018 рік за КПКВК 0111010</a>
                                </div>
                                <span>Файл Microsoft Word, 115 KБайт</span>
                            </li>
                        </ul>
                    </div>
                    <div class="slice3 col-lg-4 col-md-6">
                        <div class="hub-request__heading">Паспорти бюджетних програм на 2017 рік</div>
                        <ul class="hub-request__files">
                            <li>
                                <div>
                                    <a href="/uploads/documents/46436.doc">2017-звіт про виконання паспорта</a>
                                </div>
                                <span>Файл Microsoft Word, 291 КБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/45887.doc">Паспорт бюджетної програми 0111110</a>
                                </div>
                                <span>Файл Microsoft Word, 56 КБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/45886.doc">Паспорт бюджетної програми 0111110</a>
                                </div>
                                <span>Файл Microsoft Word, 99,5 КБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/45886.doc">Зміни до Паспорту 2017 0111020</a>
                                </div>
                                <span>Файл Microsoft Word, 100 КБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/45886.doc">Зміни до Паспорту 2017 0111010</a>
                                </div>
                                <span>Файл Microsoft Word, 105 КБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/45886.pdf">Паспорт бюджетної програми 2017</a>
                                </div>
                                <span>Файл Portable Document Format, 9,84 МБайт</span>
                            </li>
                        </ul>
                    </div>

                    <div class="slice3 col-lg-4 col-md-6">
                        <div class="hub-request__heading">Паспорти бюджетних програм на 2016 рік</div>
                        <ul class="hub-request__files">
                            <li>
                                <div>
                                    <a href="/uploads/documents/43681.rtf">Звіт про виконання паспорта бюджетної програми за 2016</a>
                                </div>
                                <span>Файл Rich Text Format, 693 КБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/43680.pdf">Внесення змін до Паспорту 2016</a>
                                </div>
                                <span>Файл Portable Document Format, 9,5 МБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/43679.pdf">Паспорт бюджетної програми 2016-0111090</a>
                                </div>
                                <span>Файл Portable Document Format, 0,3 MБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/43678.pdf">Паспорт бюджетної програми 2016-0111020</a>
                                </div>
                                <span>Файл Portable Document Format, 0,5 MБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/43677.pdf">Паспорт бюджетної програми 2016-0111010</a>
                                </div>
                                <span>Файл Portable Document Format, 0,4 MБайт</span>
                            </li>
                        </ul>
                    </div>
                    
                    <div class="slice3 col-lg-4 col-md-6">
                        <div class="hub-request__heading">Паспорти бюджетних програм на 2015 рік</div>
                        <ul class="hub-request__files">                            
                            <li>
                                <div>
                                    <a href="/uploads/documents/43676.pdf">Звіт про виконання паспорта бюджетної програми за 2015</a>
                                </div>
                                <span>Файл Portable Document Format, 0,2 МБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/43675.pdf">Паспорт бюджетної програми 2015</a>
                                </div>
                                <span>Файл Portable Document Format, 1 MБайт</span>
                            </li>                            
                        </ul>
                    </div>


                    <div class="show-prev-request col-lg-6">
                        <a href="#">Показати паспорти попередніх років</a>
                    </div>
                    <div class="more-link col-lg-6 text-right pt-0 pr-3">
                        <a href="/documents/gosp_fin_dij_doc/p_bd_pr/">Усі паспорти бюджетних програм</a>
                    </div> 
                    </div><!--/row-->

                <div class="row">
                    <div class="hub-page__block col-lg-6 pb-0">
                        <h2 class="hub-page__heading">
                           {* <a id="menu6"></a>*}
                           <span id="audit" class="anchor-section" style="padding-top: 12rem;margin-top: -10rem;"></span>
                            Внутрішній аудит
                            <i class="link-ico"></i>
                        </h2>
                        <div class="hub-request__heading">Планування діяльності з внутрішнього аудиту</div>
                        <ul class="hub-request__files">
                             
                            <li>
                                <div>
                                    <a href="/uploads/documents/74054.pdf">    План діяльності з внутрішнього аудиту на 2023-2025 роки Апарату Верховної Ради України </a>
                                </div>
                                <span>Файл Portable Document Format, 9.84 Mb</span>
                            </li> {*додано 30-01-2023 javir*}
                         
                           <li>
                                <div>
                                    <a href="/uploads/documents/74053.pdf"> Стратегічний план діяльності з внутрішнього аудиту (із змінами від 29.12.2022 року) на 2022-2024 роки Апарату Верховної Ради України</a>
                                </div>
                                <span>Файл Portable Document Format, 8.75 Mb</span>
                            </li> {*додано 30-01-2023 javir*}
                           <li>
                                <div>
                                    <a href="/uploads/documents/74052.pdf">  Операційний план діяльності з внутрішнього аудиту (із змінами від 29.12.2022 року) на 2022 рік Апарату Верховної Ради України</a>
                                </div>
                                <span>Файл Portable Document Format, 4.04 Mb</span>
                            </li> {*додано 30-01-2023 javir*}
                        </ul>
                    </div>                        
                    <div class="hub-page__block col-lg-6 pb-0">
                        <h2 class="hub-page__heading">
                           
                           <span id="audit" class="anchor-section" style="padding-top: 12rem;margin-top: -10rem;"></span>
                            {*Внутрішній аудит*}
{*                            <i class="link-ico"></i>*}<br>
                        </h2>
                        <div class="hub-request__heading">Планування діяльності з внутрішнього аудиту у попередні роки</div>
                        <ul class="hub-request__files">
                             
                            <li>
                                <div>
                                    <a href="/uploads/documents/73947.pdf">   Операційний план діяльності з внутрішнього аудиту (із змінами) на 2022 рік Апарату Верховної Ради України (у редакції від 07.09.2022 року)</a>
                                </div>
                                <span>Файл Portable Document Format, 4.01 Mb</span>
                            </li> {*додано 21092022 javir*}
                                                        
                            <li>
                                <div>
                                    <a href="/uploads/documents/73914.pdf">  Операційний план діяльності з внутрішнього аудиту (із змінами) на 2022 рік Апарату Верховної Ради України</a>
                                </div>
                                <span>Файл Portable Document Format, 3.0 Mb</span>
                            </li>
                          <li>
                                <div>
                                    <a href="/uploads/documents/72517.pdf">Операційний план діяльності з внутрішнього аудиту на 2022 рік</a>
                                </div>
                                <span>Файл Portable Document Format, 3.9 Mb</span>
                            </li>
                           <li>
                                <div>
                                    <a href="/uploads/documents/73948.pdf">   Стратегічний план діяльності з внтурішнього аудиту (із змінами) на 2022-2024 роки Апарату Верховної Ради України (у редакції від 07.09.2022 року)</a>
                                </div>
                                <span>Файл Portable Document Format, 8.57 Mb</span>
                            </li> {*додано 21092022 javir*}
                            <li>
                                <div>
                                    <a href="/uploads/documents/73913.pdf">Стратегічний план діяльності з внутрішнього аудиту (із змінами) на 2022-2024 роки</a>
                                </div>
                                <span>Файл Portable Document Format, 6.0 Mb</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/72516.pdf">Стратегічний план діяльності з внутрішнього аудиту на 2022-2024 роки</a>
                                </div>
                                <span>Файл Portable Document Format, 8.03 Mb</span>
                            </li>
                            {*<li>
                                <div>
                                    <a href="/uploads/documents/70541.pdf">Операційний план діяльності з внутрішнього аудиту (із змінами) Управління справами Апарату Верховної Ради України на 2021 рік у редакції від 23.09.2021</a>
                                </div>
                                <span>Файл Portable Document Format, 4.4 Mb</span>
                            </li>
                            <li>
                                <div>
                                  <a href="/uploads/documents/70542.pdf">Стратегічний план діяльності з внутрішнього аудиту Управління справами Апарату Верховної Ради України (із змінами) на 2019-2021 роки у редакції від 23.09.2021</a>
                                </div>
                                <span>Файл Portable Document Format, 8 Mb</span>
                            </li>
                            <li>
                                <div>
                                  <a href="/uploads/documents/65600.pdf">Стратегічний план діяльності з внутрішнього аудиту Управління справами Апарату Верховної Ради України (із змінами) на 2019-2021 роки</a>
                                </div>
                                <span>Файл Portable Document Format, 4.38 Mb</span>
                            </li>
                            <li>
                                <div>
                                  <a href="/uploads/documents/65599.pdf">Операційний план діяльності з внутрішнього аудиту Управління справами Апарату Верховної Ради України (із змінами) на 2020 рік</a>
                                </div>
                                <span>Файл Portable Document Format, 2.02 Mb</span>
                            </li>
                            <li>
                                <div>
                                  <a href="/uploads/documents/65598.pdf">Операційний план діяльності з внутрішнього аудиту Управління справами Апарату Верховної Ради України на 2021 рік</a>
                                </div>
                                <span>Файл Portable Document Format, 1.08 Mb</span>
                            </li>*}
                            {*<li>
                                <div>
                                  <a href="/uploads/documents/60819.pdf">Операційний план діяльності з внутрішнього аудиту на 2020 рік</a>
                                </div>
                                <span>Файл Portable Document Format, 293 КБайт</span>
                            </li>*}
                            {*<li>
                                <div>
                                  <a href="/uploads/documents/64952.pdf"> Операційний план діяльності з внутрішнього аудиту (із змінами) на 2020 рік Управління справами Апарату Верховної Ради України</a>
                                </div>
                                <span>Файл Portable Document Format, 2.29 Mb</span>
                            </li>*}
                            {*<li>
                                <div>
                             <a href="/uploads/documents/58808.pdf">Стратегічний та Операційний план діяльності з внутрішнього аудиту </a>
                                </div>
                                <span>Файл Portable Document Format, 816 КБайт</span>
                            </li>*}
                            {*<li>
                                <div>
                             <a href="/uploads/documents/64953.pdf">Стратегічний план діяльності з внутрішнього аудиту (із змінами)  на 2019 - 2020 роки  Управління справами Апарату Верховної Ради України </a>
                                </div>
                                <span>Файл Portable Document Format, 4.81 Mb</span>
                            </li>*}
                        </ul>
                        <div class="more-link">
                            <a href="/documents/gosp_fin_dij_doc/vnt_audyt/">Уся інформація про аудит</a>
                        </div>
                    </div>                        
                     
                </div><!--/row-->
                
                
                
                {*<h2 class="hub-page__heading">
                    <a id="menu6"></a>
                    Внутрішній аудит
                    <i class="link-ico"></i>
                </h2>
                
                    <div class="hub-request__heading">Планування діяльності з внутрішнього аудиту</div>
                    <div class="row">
                    <div class="slice3 col-lg-4 col-md-6">
                        <ul class="hub-request__files">
                            <li>
                                <div>
                                    <a href="/uploads/documents/60819.pdf">Операційний план діяльності з внутрішнього аудиту на 2020 рік</a>
                                </div>
                                <span>Файл Portable Document Format, 293 КБайт</span>
                            </li>
                            <li>
                                <div>
                                    <a href="/uploads/documents/58808.pdf">Стратегічний та Операційний план діяльності з внутрішнього аудиту </a>
                                </div>
                                <span>Файл Portable Document Format, 816 КБайт</span>
                            </li>
                        </ul>
                    </div><br><br>                    
                    </div>               
                    <div class="more-link col-lg-6 text-right pt-0 pr-3" style="float: right;">
                        <a href="/documents/gosp_fin_dij_doc/vnt_audyt/">Уся інформація про аудит</a>
                    </div>*}
                    
                <!--/row-->

            </div>
        </div>
    </div>
    </div>

{literal}
<script>
    $(document).ready(function(){
        $( "a.scrollLink" ).click(function( event ) {
            event.preventDefault();
            $("html, body").animate({ scrollTop: $($(this).attr("href")).offset().top - 100 }, 500);
        });
        
        $(".row").each(function () {
            $(this).find('.slice3').slice(0, 3).show();;
        });
        
        $(".show-prev-request").on('click', function (e) {
            e.preventDefault();
            $(this).parent().children('.slice3:hidden').slice(0, 3).show();
            if ($(this).parent().children('.slice3:hidden').length == 0) {
                $(this).fadeOut('fast');
            }
        });
    });   
</script>
{/literal}
