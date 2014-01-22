{strip}
<div class="well">
	{$HTML_TABLE}

	<div class="pull-right">
		<a href="javascript:showid('graph_conteneur');" title=""><i class="icon-bar-chart icon-large"></i></a>
	</div>
	<div class="clearfix"></div>

	<div id="graph_conteneur">
	{foreach $Exercices as $Row}
		<div id="testgraphexo{$Row.exercice_id}"></div>
	{/foreach}
	</div>

</div>
{/strip}
{literal}
<script type="text/javascript">
<!--
	$(document).ready(function() 
    { 
        $("#tableau_test").tablesorter({
            dateFormat: "uk",
            headers: {0: {sorter: "shortDate"}},
            sortList: [[0,1]]
        }); 
    } 
); 
//-->
</script>
{/literal}-