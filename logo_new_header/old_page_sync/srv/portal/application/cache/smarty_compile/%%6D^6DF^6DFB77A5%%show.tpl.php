<?php /* Smarty version 2.6.22, created on 2024-03-17 14:37:21
         compiled from video/show.tpl */ ?>
<script type="text/javascript" src="/sources/js/clappr.min.js"></script>

<?php if ($this->_tpl_vars['is_news_subsite']): ?>
   <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'news_subsite/newcenter_menu.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php endif; ?>

<ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/">Головна</a></li>
            <li class="breadcrumb-item"><a href="/video/">Медійна бібліотека</a></li>
            <li class="breadcrumb-item"><a href="/video/"> Відеоматеріали</a></li>
            <li class="breadcrumb-item active">
                <?php echo $this->_tpl_vars['item']->i_name; ?>

            </li>
</ol>

  
<div class="gallery_content">
    
    
     
               <div class="publications-heading__block no-border-top">
                    <h1><?php echo $this->_tpl_vars['item']->i_name; ?>
</h1>
                    
                    <div class="small-text">
                        
                        <?php if ($this->_tpl_vars['current_node']->t_seo_name == 'rada-tv'): ?>
  
	<span class="date">

               <?php echo '
          <script type="text/javascript">
<!--      
    var now = new Date();

    var months = new Array(
        "січня",
        "лютого",
        "березня",
        "квітня",
        "травня",
        "червня",
        "липня",
        "серпня",
        "вересня",
        "жовтня",
        "листопада",
        "грудня");
    var days = new Array(
        "неділя",
        "понеділок",
        "вівторок",
        "середа",
        "четвер",
        "п\'ятниця",
        "субота");
    var date = ((now.getDate()<10) ? "0" : "")+ now.getDate();
    function fourdigits(number)    {
      return (number < 1000) ? number + 1900 : number;}
    today = "Сьогодні " + date + " " + months[now.getMonth()] + " " +
       " " + (fourdigits(now.getYear())) +
       ", " + days[now.getDay()];
     document.write(today);
-->
</script>
          '; ?>

	</span>

	       <?php else: ?>
	       <span class="date">
                   <?php echo $this->_tpl_vars['item']->day; ?>
 <?php echo $this->_tpl_vars['item']->month; ?>
 <?php echo $this->_tpl_vars['item']->year; ?>

               </span>
	       <?php endif; ?>
               
                    </div>
                    
                                   </div>

                    <div class="main-content">
                        <div class="middle-column max730">
                            
                            <?php $_from = $this->_tpl_vars['attachments']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['data']):
?>

        <?php $_from = $this->_tpl_vars['data']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['video']):
?>  
            <?php if ($this->_tpl_vars['video']->ia_type == 'flv'): ?>
                <div id="player<?php echo $this->_tpl_vars['video']->ia_id; ?>
" style="width:400px;height:315px"></div>
                                   
            <?php endif; ?>
        <?php endforeach; endif; unset($_from); ?>

    <?php endforeach; endif; unset($_from); ?>      
    
    
                 <?php if ($this->_tpl_vars['item']->i_full): ?>
                    <?php if ($this->_tpl_vars['current_node']->t_seo_name != 'rada-tv'): ?>
                        <?php echo $this->_tpl_vars['item']->i_full; ?>

                    <?php else: ?>
                        <?php echo $this->_tpl_vars['item']->i_full; ?>

                    <?php endif; ?>
                <?php else: ?>
                    <?php echo $this->_tpl_vars['item']->i_anons; ?>

                <?php endif; ?> 
                <div class="clr"></div>
                        </div>
                    
                    <!-- social-aside -->
                <!-- /social-aside -->
                    </div>
                      

    </div>