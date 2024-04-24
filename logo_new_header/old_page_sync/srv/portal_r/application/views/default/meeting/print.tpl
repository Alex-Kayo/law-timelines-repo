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
    .logo-main .rada-logo {
        display: none;
    }
    .rada-cab {
        display: none;
    }
    body,
    #header {
        background: none;
    }
    #page {
        box-shadow: none;
        max-width: 930px;
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
        font-size: 1.2rem;

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
    /*.pr_item_content  p span  {
        font-size: 1.5rem !important;
    }*/
S
    img {
        display: none;
    }
{/literal}
</style>
<div id="content-all">
      <div  >

        <div  >
          <div  >
            <div  >
             
       </div> 
            <div  >
              <div  >
                  

            <div class="publications-heading__block">
              <h1>{$item->mi_name}</h1>
              
              <p>
            {*{if $item->i_author}
            <span class="author">{$item->i_author}</span>
            <br>
            {/if}*}
            <span class="date"> Опубліковано {$item->day}.&nbsp;{$item->month}.&nbsp;{$item->year}</span>
            </p>
            </div>
            <div class="middle-column">
                <div class="item_content">
                <div class="pr_item_content">

                    {$item->mi_text}

                </div>
                </div>
            </div>
              </div>
            </div>
          </div>
        </div>
       </div>
                    <hr>
       <div id="print_sourse"> <a href="{$site_domain}{$item_url}"> {$site_domain}{$item_url}</a>
                                  
                                  
        </div>     
</div>

