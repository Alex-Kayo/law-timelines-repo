<?php /* Smarty version 2.6.22, created on 2024-04-10 12:43:52
         compiled from print/show.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'regex_replace', 'print/show.tpl', 138, false),)), $this); ?>
<?php echo '
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
    .logo-main .rada-logo,
    .logo_rada .header_body{
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
'; ?>

</style>
<div id="content-all">
      <div class="panel">

        <div class="panel1">
          <div class="panel2">
            <div class="panel-head clr">
             
                                   </div> 
            <div class="white3-panel">
              <div class="white3-panel1-lock">

            <div class="publications-heading__block">
              <h1><?php echo $this->_tpl_vars['item']->i_name; ?>
</h1>
              
              <p>
            <?php if ($this->_tpl_vars['item']->i_author): ?>
            <span class="author"><?php echo $this->_tpl_vars['item']->i_author; ?>
</span>
            <br>
            <?php endif; ?>
            <span class="date"><?php echo $this->_tpl_vars['item']->day; ?>
&nbsp;<?php echo $this->_tpl_vars['item']->month; ?>
&nbsp;<?php echo $this->_tpl_vars['item']->year; ?>
,&nbsp;<?php echo $this->_tpl_vars['item']->hour; ?>
:<?php echo $this->_tpl_vars['item']->minute; ?>
</span> 
            </p>
            </div>
                <div class="fs_item_content">
                
				<?php if ($this->_tpl_vars['item']->i_full): ?>
				    <?php echo $this->_tpl_vars['item']->i_full; ?>

				<?php else: ?>
				    <?php echo $this->_tpl_vars['item']->i_anons; ?>

				<?php endif; ?>
                </div>
              </div>
            </div>
          </div>
        </div>
       </div>
       <div id="print_sourse"> <a href="<?php echo ((is_array($_tmp=$this->_tpl_vars['site_domain'])) ? $this->_run_mod_handler('regex_replace', true, $_tmp, "/\/\$/", "") : smarty_modifier_regex_replace($_tmp, "/\/\$/", "")); ?>
<?php echo $this->_tpl_vars['base_url']; ?>
<?php echo $this->_tpl_vars['i_id']; ?>
.html"> <?php echo ((is_array($_tmp=$this->_tpl_vars['site_domain'])) ? $this->_run_mod_handler('regex_replace', true, $_tmp, "/\/\$/", "") : smarty_modifier_regex_replace($_tmp, "/\/\$/", "")); ?>
<?php echo $this->_tpl_vars['base_url']; ?>
<?php echo $this->_tpl_vars['i_id']; ?>
.html</a>   
                                  
                                  
        </div>     
</div>
