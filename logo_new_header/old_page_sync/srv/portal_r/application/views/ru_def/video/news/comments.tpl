{literal}
    <script type="text/javascript">

        function clickCommentsPagination() {



            $('.pages a').click(function() {
                $.ajax({
                    type: "POST",
                    data: "item_id=" + $('#item_id').attr('value'),
                    url: $(this).attr('href'),
                    success: function(data, textStatus) {
                        $('#list_comments').html(data);
                        clickCommentsPagination();
                        return false;
                    }
                });
                return false;


            });
            return false;
        }


        $(document).ready(function() {
            clickCommentsPagination();
        });




        function addComment() {
            $.ajax({
                url: '{/literal}{$lang_prefix}{literal}/comments/add',
                type: 'post',
                data: {name: $('#name').val(), text: $('#text').val(), captcha: $('#captcha').val(), add_comment: '1', 'item_id': $('#item_id').attr('value')},
                dataType: "html",
                success: function(msg) {
                    $('#add_comments').html(msg);

                }

            });

        }




    </script>
{/literal}



<!-- comments block -->
<div class="comments_block" id="comments">    
    {if $item->comment_type > 1}
        <input type="hidden" id="item_id" value="{$item->i_id}"/>
        <div id="add_comments">        
            {include file="news/add_comments.tpl"}
        </div>
    {/if}

    <h3>{$i18n.comments_title}:</h3>
    <div class="comments_list"  id="list_comments">            
        {include file="news/list_comments.tpl"}
    </div>    
</div>
<!-- end comments block -->


