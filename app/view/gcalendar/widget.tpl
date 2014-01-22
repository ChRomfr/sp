<!-- gcalendar/widget.tpl -->
{strip}
<ul class="unstyled">
{foreach $Events as $Row}
	<li style="width:100%;">{$Row->when[0]->startTime|date_google_to_sql} <a href="javascript:showEvent('{$Row->id|base64_encode}');" title="">{$Row->title}</a></li>
{/foreach}
</ul>
{/strip}
<script>
function showEvent(event_id){
	$('#modal-index-contenu').html();
    $.get(
        '{getLink("gcalendar/showEvent/")}'+event_id,{literal}
        {nohtml:'nohtml'},
        function(data){ $('#modal-index-contenu').html(data); }
    )
    {/literal}
    
     $('#modal-index').modal('show');
}
</script>