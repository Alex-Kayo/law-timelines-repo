{literal}
    <style>
    #navbar,
    #footer,
    .breadcrumb,
    .aside-column,
    .social-aside,
    .back-to,
    .btn-print,
    .right-column-content,
    .add-to-favorite,
    .rada-cab,
    .logo-main .rada-logo  {
        display: none;
    }
    body,
    #header {
        background: none;
    }
    #page {
        box-shadow: none;
        max-width: 730px;
        padding: 0 1rem 1rem 1rem;
    }
    .text-column {
        margin-left: 0px;
        margin-right: 0px;
        position: static;
        flex: 0 0 100%;
        max-width: 100%;
    }
    .logo-main a,
    .publications-heading__block .tags {
        text-decoration: none;
    }
    .logo-print {
        display: block;
        display: inline-block;
        vertical-align: top;
        margin: 0 1rem 1rem 0;
        float: left;
    }
    .logo-main {
        text-align: left;
    }
    .logo-main h1 {
        padding-bottom: 0px;
        padding-top: 1rem;
        display: inline-block;
        vertical-align: top;
    }
    .header_body {
        padding: 20px 0 50px 0;
    }
    .header_body a {
        color: #22324d;
    }
    .logo-main p {
        color: #22324d;

    }
    .main {
        padding: 0px;
        clear: both;
    }
    .sticky .main {
        padding-top: 0px;
    }
    .sticky #header {
        position: static;
    }
    .sticky #header .logo-main {
        display: block;
    }
    iframe {
        margin: 1rem auto;
        max-width: 100%;
    }
    .publications-heading__block p {
        padding-bottom: 0.5rem;
    }

    @media (max-width: 575px) {
        body {
            font-size: 1rem;
            line-height: 1.3em;
        }
        .logo-print {
            max-height: 50px;
            width: auto;
            margin-top: 0.8rem;
        }
        .header_body {
            padding: 0.5rem 0 1rem 0;
        }
    }
{/literal}
</style>
<div id="content-all">
      <div class="panel">

        <div class="panel1">
          <div class="panel2">
            <div class="panel-head clr">
             
{*                <a href="/print/{$i_id}.html" class="print">Надрукувати</a>  *}
              {*  <a href="{$base_url}{$i_id}.html" class="shslink">Зменшити зону перегляду</a>           *}
              {*  <h3>{$current_node->t_name}</h3>  *}
       </div> 
            <div class="white3-panel">
              <div class="white3-panel1-lock">

            <div class="publications-heading__block">
              <h1>{$item->i_name}</h1>
              
              <p>
            {if $item->i_author}
            <span class="author">{$item->i_author}</span>
            <br>
            {/if}
            <span class="date">{$item->day}&nbsp;{$item->month}&nbsp;{$item->year},&nbsp;{$item->hour}:{$item->minute}</span> 
            </p>
            </div>
                <div class="fs_item_content">
                
				{if $item->i_full}
				    {$item->i_full}
				{else}
				    {$item->i_anons}
				{/if}
                </div>
              </div>
            </div>
          </div>
        </div>
       </div>
       <div id="print_sourse"> <a href="{$site_domain|regex_replace:"/\/$/":""}{$base_url}{$i_id}.html"> {$site_domain|regex_replace:"/\/$/":""}{$base_url}{$i_id}.html</a>   
                                  
                                  
        </div>     
</div>

