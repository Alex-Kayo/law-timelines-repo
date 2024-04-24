<div id="footer">
    {*  ----------- MAP ------------------------------------                      *}
                        {if !$items_hide}
                            {include file= "main_page/map.tpl"} 
                        {else}
                            {include file= "main_page/map4inet.tpl"}       
                        {/if} 
{*  ----------- End MAP ------------------------------------                      *}
    <div class="sub-footer container">
        <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="lang_block">

                            <select class="selectpicker" onchange="location = this.value;">
                            <option value="/en">In English</option>
                            <option value="/">Українською</option>
                            
                        </select>
                            <svg class="icn-world" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                <path class="icn-world__fill" fill-rule="evenodd" d="M16.55 18.571c.497-.958.883-2.078 1.13-3.314a11.339 11.339 0 0 0 1.902-.725 8.026 8.026 0 0 1-3.031 4.04m-12.133-4.04a11.35 11.35 0 0 0 1.902.725c.248 1.236.633 2.356 1.129 3.314a8.032 8.032 0 0 1-3.031-4.039m3.03-9.104c-.26.503-.49 1.048-.685 1.633-.335-.162-.56-.314-.67-.437a8.08 8.08 0 0 1 1.356-1.196m10.454 1.19c-.114.127-.338.278-.666.44a11.431 11.431 0 0 0-.686-1.63c.495.345.946.747 1.352 1.19m-.164 2.41a5.426 5.426 0 0 0 1.326-.773 7.946 7.946 0 0 1 .915 3.347c-.1.415-.78.978-2.012 1.455.02-.347.032-.7.032-1.057 0-1.039-.092-2.036-.261-2.973m-4.74 4.95V9.972a17.732 17.732 0 0 0 2.81-.354 15.08 15.08 0 0 1 .102 4.018c-.847.17-1.816.294-2.911.341m0 5.726v-3.726a22.416 22.416 0 0 0 2.51-.244c-.552 1.974-1.502 3.39-2.51 3.97m-2-3.726v3.726c-1.008-.58-1.958-1.996-2.51-3.97.812.126 1.657.21 2.51.244m0-11.68v3.668a15.244 15.244 0 0 1-2.326-.29C9.24 6.01 10.097 4.817 11 4.296m4.326 3.377c-.656.14-1.432.243-2.326.291V4.297c.904.52 1.76 1.712 2.326 3.377M8 12c0-.844.07-1.64.192-2.382.885.19 1.842.307 2.808.354v4.005a18.937 18.937 0 0 1-2.911-.34A15.08 15.08 0 0 1 7.999 12m-3.978-.398a7.932 7.932 0 0 1 .915-3.347 5.4 5.4 0 0 0 1.325.772A16.773 16.773 0 0 0 6 12c0 .357.012.71.032 1.057-1.232-.477-1.913-1.04-2.011-1.455M22 11.5c0-.06-.023-.112-.034-.168C21.62 6.13 17.288 2 12 2c-5.288 0-9.62 4.13-9.966 9.332-.01.056-.034.108-.034.168 0 .054.014.106.018.16-.004.114-.018.225-.018.34 0 5.513 4.487 10 10 10 5.514 0 10-4.487 10-10 0-.115-.013-.226-.017-.34.004-.054.017-.106.017-.16"/>
                            </svg>
                            
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-6">
                        <ul class="social-footer">
{*                            <li><span>Verkhovna Rada in social networks:</span></li>*}
                            <li>
                                {*<a class="facebook-ico" href="https://www.facebook.com/verkhovna.rada.ukraine/" target="_blank">*}
                                <a class="facebook-ico" href="https://www.facebook.com/profile.php?id=100089703132729" target="_blank">  
                                    <i class="fab fa-facebook-square"></i>
                                    Facebook
                                </a>
                            </li>
                            <li>
                              {*<a class="twitter-ico" href="https://twitter.com/verkhovna_rada" target="_blank">*}
                                <a class="twitter-ico" href="https://twitter.com/ua_parliament?s=21&t=yYReODyOF6eSQP-atB2U1w" target="_blank">    
                                    <i class="fab fa-twitter"></i>
                                    Twitter
                                </a>
                            </li>
                            <li>
                                <a class="youtube-ico" href="https://www.youtube.com/user/RadaTVchannel" target="_blank">
                                    <i class="fab fa-youtube"></i>
                                    YouTube
                                </a>
                            </li>
                            <li>
                                <a class="instagram-ico" href="https://www.instagram.com/verkhovna_rada_of_ukraine/" target="_blank" title="Інстаграм">
                                    <i class="fab-fa-instagram"></i>
                                    Instagram
                                </a>
                            </li>
                            <li>
                                    <a class="telegram-ico" href="https://t.me/verkhovnaradaukraine" target="_blank">
{*                                    <a class="telegram-ico" href=" " target="_blank">    *}
                                        <i class="fab fa-telegram-plane"></i>
                                    Telegram  
                                    </a>
                                </li>
                            {*<li>
                                <a class="fliker-ico" href="#" target="_blank">
                                    <i class="fab fa-flickr"></i>
                                    Flickr
                                </a>
                            </li>*}
                        </ul>
                    </div>
    </div>
        <div class="row">
                    
                    <div class="col-lg-8 col-md-6 order-md-2">


                        <ul class="column-2-list-bold">
{*                            <li><a href="https://itd.rada.gov.ua/SessionRequest" target="_blank">Application form for a plenary session visit</a></li>*}
                            <li><a href="https://vzvernen.rada.gov.ua/" target="_blank">Department of citizens appeals</a></li>
                            <li><a href="https://itd.rada.gov.ua/services/appeal-of-citizens/" target="_blank">Electronic application form</a></li>
                            <li><a href="/fba">Media accreditation form</a></li>
                            <li><a href="https://itd.rada.gov.ua/idsrv/en">Electronic cabinet  of a citizen</a></li>
                            
                            <li><a href="#{*http://w1.c1.rada.gov.ua/pls/site2/p_aparat*}">Сontact us:</a></li>
                        </ul>

                        <hr>

                        <ul class="column-2-list">
                            {*<li><a href="http://chairman.rada.gov.ua/" target="_blank">Вебсайт Голови Верховної Ради України</a></li>*}
{*                            <li><a href="http://w1.c1.rada.gov.ua/pls/site2/p_komitis_site" target="_blank">VRU committees’ websites</a></li>*}
                            <li><a href="https://www.rada.gov.ua/documents/contacts/228558.html" target="_blank">VRU committees’ websites</a></li>
                            <li><a href="https://vrkadry.rada.gov.ua/" target="_blank">VRU Administration Personnel Directorate’s website</a></li>
{*                            <li><a href="/documents/parl_office_ms/">Local Government Parliamentary Office</a></li>*}
{*                            <li><a href="http://euinfocenter.rada.gov.ua/" target="_blank">European Research and Information Centre</a></li>*}
                            <li><a href="http://lib.rada.gov.ua/" target="_blank">Library and bibliographic resources</a></li>
                            <li><a href="/documents">Electronic document archives</a></li>
                            <li><a href="https://research.rada.gov.ua/" target="_blank">Research Service of the Verkhovna Rada of Ukraine</a></li>
{*                            <li><a href="http://instzak.rada.gov.ua/" target="_blank">VRU Legislation Institute</a></li>*}
                            <li><a href="http://tv.rada.gov.ua/" target="_blank">SE “Parliamentary TV Channel “Rada”</a></li>
                            <li><a href="http://radabook.com/" target="_blank">VRU Publishing House</a></li>
                            <li><a href="/documents/gosp_fin_dij_doc/other/125075.html">Executive Directorate</a></li>
                        </ul>
                    </div>
            
            <div class="col-lg-4 col-md-6 order-md-1">
                
                <svg style="margin: -3px 5px 0 0" width="24px" height="24px"  version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" >
    <!-- Generator: sketchtool 52.5 (67469) - http://www.bohemiancoding.com/sketch -->
    
    <path d="M12,2 C17.514,2 22,6.486 22,12 C22,17.514 17.514,22 12,22 L12,20 C16.411,20 20,16.411 20,12 C20,7.589 16.411,4 12,4 C7.589,4 4,7.589 4,12 C4,14.885 5.528,17.478 8,18.908 L8,16 C8,15.448 8.448,15 9,15 C9.552,15 10,15.448 10,16 L10,21 C10,21.552 9.552,22 9,22 L4,22 C3.448,22 3,21.552 3,21 C3,20.448 3.448,20 4,20 L6.026,20 C3.515,18.133 2,15.211 2,12 C2,6.486 6.486,2 12,2 Z M16,13 L12,13 C11.448,13 11,12.552 11,12 L11,6 L13,6 L13,11 L16,11 L16,13 Z" id="Fill-2">
        
    </path>
                </svg>  
                
                
                        <a href="https://iportal.rada.gov.ua" target="_blank" style="margin-top: 13px">Older version of webportal</a>
                
                

                        <p style="margin-top: 2em;">&copy; Verkhovna Rada of Ukraine 1994—{$smarty.now|date_format:"%Y"}</p>
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
