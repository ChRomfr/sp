<!--
PAREN/TAB FICHE
-->
<script type="text/javascript">
<!--
$(document).ready(function() {
    $("a#fbformaddparent").fancybox();
    $("a.fbformeditparent").fancybox();
});



{* Code JS Suppression parent *}

{if $smarty.session.acl.gest_joueur == 1}
function deleteParent(pid){
    if( confirm('{$lang.Confirm_suppression_parent} ?') ){
        window.location.href = '{getLink("paren/delete/' + pid +'")}';   
    }
}
{/if}

{if $smarty.session.acl.gest_joueur == 1}
function deleteJoueur( joueur_id ){
	if( confirm('{$lang.Confirm_suppression_joueur} ?') ){
		window.location.href = '{getLink("joueur/delete/'+ joueur_id +'")}';
	}
}
{/if}

//-->
</script>
{strip}
<div class="well">

	<!-- IMPRESSION -->
	<div class="fright">
		<a href="{getLink("joueur/printTabSituationFamiliale/{$Joueur.id}?nohtml&print")}" title="Print" target="_blank"><i class="icon-print"></i></a>
	</div>
	<div class="clear"></div>
		
	<!-- Action haut droite -->
	<div style="float:right">				
		{if count($Parents) < 2 && $smarty.session.acl.gest_joueur == 1}
            <a href="{getLink("paren/add?joueur_id={$Joueur.id}&nohtml")}" id="fbformaddparent" title=""><i class="icon-plus"></i></a>
		{/if}
	</div>
	<div style="clear:both"></div>
	<!-- End Action -->
	
    <div style="width:95%; margin:auto;">
		<p>{$lang.Situation} : <strong>{$Joueur.parent_situation}</strong></p>
	</div>
	
	{if isset($Parents.0)}
	
	<table class="table table-bordered table-condensed">
		<caption>{$lang.Parents}</caption>
		<tr>
			<th></th>
			<td>
                {if $Parents.0.type == "p"}{$lang.Pere}{elseif $Parents.0.type == "m"}{$lang.Mere}{/if}
                {if $smarty.session.acl.gest_joueur == true}
                    <a href="{getLink("paren/edit/{$Parents.0.id}?nohtml")}" class="fbformeditparent" title=""><i class="icon-pencil"></i></a>&nbsp;
                    <a href="javascript:deleteParent({$Parents.0.id})"><i class="icon-trash"></i></a>
                {/if}
            </td>
			{if isset($Parents.1)}
            <td>
                {if $Parents.1.type == "p"}{$lang.Pere}{elseif $Parents.1.type == "m"}{$lang.Mere}{/if}
                {if $smarty.session.acl.gest_joueur == true}
                    <a href="{getLink("paren/edit/{$Parents.1.id}?nohtml")}" class="fbformeditparent" title=""><i class="icon-pencil"></i></a>
                    <a href="javascript:deleteParent({$Parents.1.id})"><i class="icon-trash"></i></a>
                {/if}
            </td>
            {/if}
		</tr>
		<tr>
			<th>{$lang.Nom}</th>
			<td>{$Parents.0.nom}</td>
			{if isset($Parents.1)}<td>{$Parents.1.nom}</td>{/if}
		</tr>
		<tr>
			<th>{$lang.Prenom}</th>
			<td>{$Parents.0.prenom}</td>
			{if isset($Parents.1)}<td>{$Parents.1.prenom}</td>{/if}
		</tr>
		<tr>
			<th>{$lang.Adresse}</th>
			<td>{$Parents.0.adresse}<br/>{$Parents.0.code_postal} {$Parents.0.ville}</td>
			{if isset($Parents.1)}<td>{$Parents.1.adresse}<br/>{$Parents.1.code_postal} {$Parents.1.ville}</td>{/if}
		</tr>
		<tr>
			<th>{$lang.Telephone}</th>
			<td>{$Parents.0.telephone}</td>
			{if isset($Parents.1)}<td>{$Parents.1.telephone}</td>{/if}
		</tr>
		<tr>
			<th>{$lang.Portable}</th>
			<td>{$Parents.0.portable}</td>
			{if isset($Parents.1)}<td>{$Parents.1.portable}</td>{/if}
		</tr>
		<tr>
			<th>{$lang.Profession}</th>
			<td>{$Parents.0.emploi}</td>
			{if isset($Parents.1)}<td>{$Parents.1.emploi}</td>{/if}
		</tr>
		<tr>
			<th>{$lang.Telephone} pro</th>
			<td>{$Parents.0.telephone_pro}</td>
			{if isset($Parents.1)}<td>{$Parents.1.telephone_pro}</td>{/if}
		</tr>
	</table>
	{/if}
</div>
</div>
{/strip}