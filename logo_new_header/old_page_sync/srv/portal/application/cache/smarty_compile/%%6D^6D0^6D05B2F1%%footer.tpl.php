<?php /* Smarty version 2.6.22, created on 2024-04-11 10:41:29
         compiled from main_page/footer.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'date_format', 'main_page/footer.tpl', 120, false),)), $this); ?>
<div id="footer">
                            <?php if (! $this->_tpl_vars['items_hide']): ?>
                            <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "main_page/map.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?> 
                        <?php else: ?>
                            <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "main_page/map4inet.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>       
                        <?php endif; ?> 
    <div class="sub-footer container">
        <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="lang_block">

                            <select class="selectpicker" onchange="location = this.value;">
                            <option value="/en">English</option>
                            <option value="/">Українською</option>
                            
                        </select>
                            <i class="icn-world fa fa-language" style="font-size:1.5rem" title="Interface language"></i>
                                                        
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-6">
                        <ul class="social-footer">
                            <li>
                                                                <a class="facebook-ico" href="https://www.facebook.com/profile.php?id=100089703132729" target="_blank">  
                                    <i class="fa fa-facebook-official"></i>
                                    Facebook
                                </a>
                            </li>
                            <li>
                                                              <a class="twitter-ico" href="https://twitter.com/ua_parliament?s=21&t=yYReODyOF6eSQP-atB2U1w" target="_blank">    
                                    <i class="fa fa-twitter"></i>
                                    Twitter
                                </a>
                            </li>
                            <li>
                                <a class="youtube-ico" href="https://www.youtube.com/user/RadaTVchannel" target="_blank">
                                    <i class="fa fa-youtube-play"></i>
                                    YouTube
                                </a>
                            </li>
                            <li>
                                <a class="instagram-ico" href="https://www.instagram.com/verkhovna_rada_of_ukraine/" target="_blank" title="Інстаграм">
                                    <i class="fa fa-instagram"></i>
                                    Instagram
                                </a>
                            </li>
                            <li>
                                    <a class="telegram-ico" href="https://t.me/verkhovnaradaukraine" target="_blank">
                                        <i class="fa fa-paper-plane"></i>
                                    Telegram  
                                    </a>
                                </li>
                                                    </ul>
                    </div>
    </div>
        <div class="row">
                    
                    <div class="col-lg-8 col-md-6 order-md-2">


                        <ul class="column-2-list-bold">
                            <li><a href="https://vzvernen.rada.gov.ua/" target="_blank">Department of citizens appeals</a></li>
                            <li><a href="https://itd.rada.gov.ua/services/appeal-of-citizens/" target="_blank">Electronic application form</a></li>
                            <li><a href="/fba">Media accreditation form</a></li>
                            <li><a href="https://itd.rada.gov.ua/idsrv/en">Electronic cabinet  of a citizen</a></li>
                            
                            <li><a href="#">Сontact us:</a></li>
                        </ul>

                        <hr>

                        <ul class="column-2-list">
                                                        <li><a href="https://www.rada.gov.ua/documents/contacts/228558.html" target="_blank">VRU committees’ websites</a></li>
                            <li><a href="https://vrkadry.rada.gov.ua/" target="_blank">VRU Administration Personnel Directorate’s website</a></li>
                            <li><a href="http://lib.rada.gov.ua/" target="_blank">Library and bibliographic resources</a></li>
                            <li><a href="/documents">Electronic document archives</a></li>
                            <li><a href="https://research.rada.gov.ua/" target="_blank">Research Service of the Verkhovna Rada of Ukraine</a></li>
                            <li><a href="http://tv.rada.gov.ua/" target="_blank">SE “Parliamentary TV Channel “Rada”</a></li>
                            <li><a href="http://radabook.com/" target="_blank">VRU Publishing House</a></li>
                            <li><a href="/documents/gosp_fin_dij_doc/other/125075.html">Executive Directorate</a></li>
                        </ul>
                    </div>
            
            <div class="col-lg-4 col-md-6 order-md-1">
                
                                
                
                                        
                

                        <p style="margin-top: 2em;">&copy; Verkhovna Rada of Ukraine 1994—<?php echo ((is_array($_tmp=time())) ? $this->_run_mod_handler('date_format', true, $_tmp, "%Y") : smarty_modifier_date_format($_tmp, "%Y")); ?>
</p>
                        <p>Technical support — <a href="http://w1.c1.rada.gov.ua/pls/site2/p_pidrozdil2?pidid=1266">Directorate of computerized systems</a></p>
                        <p>Informational support — <a href="http://w1.c1.rada.gov.ua/pls/site2/p_pidrozdil2?pidid=1292">Information Directorate,</a><a href="http://w1.c1.rada.gov.ua/pls/site2/p_pidrozdil2?pidid=1682"> Press Service of VRU Administration</a></p>

                        <div class="beta-block">
                            This portal is being tested. Some functions may be out of order. Should you have any observations or proposals, please feel free to contact us: <a href="/feedback">Feedback form</a>
                        </div>
                        <div class="cc-block">
                            Entire content is available under licence <a href="https://creativecommons.org/licenses/by/4.0/deed.uk" target="_blank">Creative Commons Attribution 4.0 International license</a>, unless stipulated otherwise
                        </div>
                        <div class="kitsoft-block">
                            <a href="https://www.kitsoft.kiev.ua/" target="_blank">KitSoft — Design developer</a>
                        </div>
                    </div>
        </div>

    </div>
</div>