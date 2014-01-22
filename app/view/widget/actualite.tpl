{foreach $Actus as $Row}
	<span>{$Row.creat_on|date_format:$config.format_date_day} - <a href="javascript:getDetailActu({$Row.id})" title="">{$Row.titre}</a></span><br/>
{/foreach}

<!--
<div id="diag-actualite-detail"></div>
-->

<script type="text/javascript">
<!--

function getDetailActu(aid){
	$('#modal-index-contenu').html();
    $.get(
        '{getLink("widget/getWidgetActualiteDetail/'+ aid +'")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#modal-index-contenu').html(data); }
    )
    {/literal}
    /*
     $( "#diag-actualite-detail" ).dialog('open');
     */
    $('#modal-index').modal('show')
}

//-->
</script>