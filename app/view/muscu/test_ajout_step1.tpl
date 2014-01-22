<script type="text/javascript">
jQuery(document).ready(function(){
    // binds form submission and fields to the validation engine
    jQuery("#formAdd").validationEngine();
});

function generateTest(){
	
	exo1 = $("#exo1").val();
	exo2 = $("#exo2").val();
	exo3 = $("#exo3").val();
	exo4 = $("#exo4").val();
	exo5 = $("#exo5").val();
	exo6 = $("#exo6").val();
	exo7 = $("#exo7").val();
	exo8 = $("#exo8").val();
	exo9 = $("#exo9").val();
	exo10 = $("#exo10").val();
	
	$.get(
		'{getLink("muscu/ajaxGetTabTestAdd")}',{literal}
		{exo1: exo1, exo2: exo2, exo3: exo3, exo4: exo4, exo5: exo5, exo6: exo6, exo7: exo7, exo8: exo8, exo9: exo9, exo10: exo10, nohtml:'nohtml'},
		function(data){ $("#muscuAddTest").html(data); }
	)
	{/literal}	
}

</script>

{strip}
{if $smarty.const.BREAD == true}
<div id="bread">
    <a href="{getLink("index/index")}" title="">{$lang.Accueil}</a>&nbsp;>>&nbsp;
    <a href="{getLink("muscu/index")}" title="">{$lang.Musculation}</a>&nbsp;>>&nbsp;
    <a href="{getLink("muscu/testListe")}" title="">{$lang.Tests}</a>&nbsp;>>&nbsp;
    {$lang.Nouveau}
</div>
{/if}

<div id="muscuAddTest">

	<form class="form">
		<dl>
			<dt><label for="exo1">{$lang.Exercice} 1:</label></dt>
			<dd>
				<select id="exo1">
					<option></option>
					{foreach $Exercices as $Row}
					<option value="{$Row.id}">{$Row.nom}</option>
					{/foreach}
				</select>
			</dd>
		</dl>
		
		<dl>
			<dt><label for="exo2">{$lang.Exercice} 2:</label></dt>
			<dd>
				<select id="exo2">
					<option></option>
					{foreach $Exercices as $Row}
					<option value="{$Row.id}">{$Row.nom}</option>
					{/foreach}
				</select>
			</dd>
		</dl>
		
		<dl>
			<dt><label for="exo3">{$lang.Exercice} 3:</label></dt>
			<dd>
				<select id="exo3">
					<option></option>
					{foreach $Exercices as $Row}
					<option value="{$Row.id}">{$Row.nom}</option>
					{/foreach}
				</select>
			</dd>
		</dl>
		
		<dl>
			<dt><label for="exo4">{$lang.Exercice} 4:</label></dt>
			<dd>
				<select id="exo4">
					<option></option>
					{foreach $Exercices as $Row}
					<option value="{$Row.id}">{$Row.nom}</option>
					{/foreach}
				</select>
			</dd>
		</dl>
		
		<dl>
			<dt><label for="exo5">{$lang.Exercice} 5:</label></dt>
			<dd>
				<select id="exo5">
					<option></option>
					{foreach $Exercices as $Row}
					<option value="{$Row.id}">{$Row.nom}</option>
					{/foreach}
				</select>
			</dd>
		</dl>
		
		<dl>
			<dt><label for="exo6">{$lang.Exercice} 6:</label></dt>
			<dd>
				<select id="exo6">
					<option></option>
					{foreach $Exercices as $Row}
					<option value="{$Row.id}">{$Row.nom}</option>
					{/foreach}
				</select>
			</dd>
		</dl>
		
		<dl>
			<dt><label for="exo7">{$lang.Exercice} 7:</label></dt>
			<dd>
				<select id="exo7">
					<option></option>
					{foreach $Exercices as $Row}
					<option value="{$Row.id}">{$Row.nom}</option>
					{/foreach}
				</select>
			</dd>
		</dl>
		
		<dl>
			<dt><label for="exo8">{$lang.Exercice} 8:</label></dt>
			<dd>
				<select id="exo8">
					<option></option>
					{foreach $Exercices as $Row}
					<option value="{$Row.id}">{$Row.nom}</option>
					{/foreach}
				</select>
			</dd>
		</dl>
		
		<dl>
			<dt><label for="exo9">{$lang.Exercice} 9:</label></dt>
			<dd>
				<select id="exo9">
					<option></option>
					{foreach $Exercices as $Row}
					<option value="{$Row.id}">{$Row.nom}</option>
					{/foreach}
				</select>
			</dd>
		</dl>
		
		<dl>
			<dt><label for="exo10">{$lang.Exercice} 10:</label></dt>
			<dd>
				<select id="exo10">
					<option></option>
					{foreach $Exercices as $Row}
					<option value="{$Row.id}">{$Row.nom}</option>
					{/foreach}
				</select>
			</dd>
		</dl>
		<div class="center">
			<a href="javascript:generateTest()" class="submit">{$lang.Generer_le_test}</a>
		</div>
	</form>	
	{/strip}

</div>