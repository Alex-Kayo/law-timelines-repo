<?php /* Smarty version 2.6.22, created on 2024-02-05 12:44:58
         compiled from memorial_subsite/show.tpl */ ?>

<?php echo '
    <style>
        .item_content_m{
            background-color: black;
            color: white;
            padding: 0 1.5em 0 1.5em;
            text-align: justify;
            text-indent: 1.5em;
        }
        .item_content_m p {
    padding-bottom: 0.75rem;
    text-indent: 1.5em;
    max-width: 100%;
}
        .item_content_m > span {
     margin-left: -1.5em;
}
        .text-column img, .middle-column img, .item_content img, .fs_item_content img {
  max-width: 100%;
  width: auto;
  height: auto;
  margin-bottom: 0.8em;
  padding: 0.5rem;
    padding-right: 0.5rem;
  padding-right: 1.2em;
}
     @media screen and (max-width: 575px){
.publications-heading__block p {
  font-size: 1.1rem;
  line-height: 1.39em;
  color: #fff;
}
.item_content_m p {
  font-size: 1.1rem;
  line-height: 1.39em;
  color: #fff;
}
 .item_content_m{
            background-color: black;
            color: white;
            padding: 0.3em;
        }
        
         
 .publications-heading__block h2, .publications-heading__block h1 {
  font-size: 1.5rem;
  line-height: 1.4em;
  padding: 0.5rem 0;
}
        
        }
    @media screen and (max-width: 710px) {
    .event-press{

  }


  }
    </style>
'; ?>



<?php if ($this->_tpl_vars['is_news_subsite']): ?>
    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'news_subsite/newcenter_menu.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php endif; ?>

<?php if ($this->_tpl_vars['current_node']->t_name): ?>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/">Головна</a></li>
                <?php $_from = $this->_tpl_vars['path_way']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['data']):
?>
            <li class="breadcrumb-item"><a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->t_parents; ?>
/"><?php echo $this->_tpl_vars['data']->t_name; ?>
</a></li>
        <?php endforeach; endif; unset($_from); ?>
        <li class="breadcrumb-item"><a href=" /memorial"> <?php echo $this->_tpl_vars['current_node']->t_name; ?>
</a></li>
    </ol>
<?php endif; ?>

<div class="publications-heading__block no-border-top" style="background-color: black; color: white  ">
    <h2><?php echo $this->_tpl_vars['item']->i_name; ?>
</h2>
    <hr>

<!-- main-content -->
<div class="main-content">
    <div class="row">
        <div class="text-column col-md-12 ">
            <div class="item_content_m">
                <?php echo $this->_tpl_vars['item']->i_full; ?>

            </div>

        </div>

    </div>

</div>
</div>
            

<!-- /main-content -->

<?php echo '
    <script>

        $(function () {


            $(\'.sections_tabs li a.active\').parent().addClass(\'selected\');

            // TinyNav.js 1
            $(\'.sections_tabs\').tinyNav();

        });

        if (($(window).width() > 768)) {
            $(function () {
                var a = document.querySelector(\'.social-aside\'), b = null, P = 200;

                if (a !== null) {
                    window.addEventListener(\'scroll\', Ascroll, false);
                    document.body.addEventListener(\'scroll\', Ascroll, false);
                }

                function Ascroll() {
                    if (b == null) {
                        var Sa = getComputedStyle(a, \'\'), s = \'\';
                        for (var i = 0; i < Sa.length; i++) {
                            if (Sa[i].indexOf(\'overflow\') == 0 || Sa[i].indexOf(\'padding\') == 0 || Sa[i].indexOf(\'border\') == 0 || Sa[i].indexOf(\'outline\') == 0 || Sa[i].indexOf(\'box-shadow\') == 0 || Sa[i].indexOf(\'background\') == 0) {
                                s += Sa[i] + \': \' + Sa.getPropertyValue(Sa[i]) + \'; \'
                            }
                        }
                        b = document.createElement(\'div\');
                        b.style.cssText = s + \' box-sizing: border-box; width: \' + a.offsetWidth + \'px;\';
                        a.insertBefore(b, a.firstChild);
                        var l = a.childNodes.length;
                        for (var i = 1; i < l; i++) {
                            b.appendChild(a.childNodes[1]);
                        }
                        a.style.height = b.getBoundingClientRect().height + \'px\';
                        a.style.padding = \'0\';
                        a.style.border = \'0\';
                    }
                    var Ra = a.getBoundingClientRect(),
                        R = Math.round(Ra.top + b.getBoundingClientRect().height - document.querySelector(\'.social-aside-stop\').getBoundingClientRect().bottom);
                    if ((Ra.top - P) <= 0) {
                        if ((Ra.top - P) <= R) {
                            b.className = \'stop\';
                            b.style.top = -R + \'px\';
                        } else {
                            b.className = \'sticky\';
                            b.style.top = P + \'px\';
                        }
                    } else {
                        b.className = \'\';
                        b.style.top = \'\';
                    }
                    window.addEventListener(\'resize\', function () {
                        a.children[0].style.width = getComputedStyle(a, \'\').width
                    }, false);
                }
            });
        }


        $(document).ready(function () {


            if ($(\'.sections_tabs li a\').hasClass(\'active\')) {
                $(this).parent().addClass(\'selected\');
            }

            $("#test-circle").circliful({
                animationStep: 5,
                foregroundBorderWidth: 15,
                backgroundBorderWidth: 15,
                percent: 72,
                fgcolor: "#556b2f",
                textColor: \'#333\'
            });

            $(\'.nice-select\').niceSelect();

            $(\'.slider-main\').slick({
                slidesToShow: 1,
                slidesToScroll: 1,
                arrows: false,
                fade: true,
                asNavFor: \'.slider-nav\'
            });
            $(\'.slider-nav\').slick({
                slidesToShow: 3,
                slidesToScroll: 1,
                asNavFor: \'.slider-main\',
                focusOnSelect: true,
                centerMode: true,
                centerPadding: "40px",
                responsive: [
                    {
                        breakpoint: 768,
                        settings: {
                            arrows: false,
                            centerMode: true,
                            dots: true,
                            infinite: true,
                            slidesToShow: 1,


                        }
                    }
                ]
            });


        });


    </script>
'; ?>
