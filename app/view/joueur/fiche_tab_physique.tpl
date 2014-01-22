	
<!-- LIEN IMPRESSION -->
{if !isset($smarty.get.printer)}
<div class="pull-right">
	{if $smarty.session.acl.gest_joueur == true}
	<a href="#modal-form-morpho" role="button" data-toggle="modal" title="{$lang.Ajout_donnees}"><i class="icon icon-plus"></i></a>&nbsp;&nbsp;	
	<a href="javascript:openListeData();"><i class="icon icon-table"></i></a>&nbsp;&nbsp;
	{/if}
	<a href="{getLink("joueur/getPhysiqueInfo/{$joueur_id}?printer&sportifinfo&sportif_id={$joueur_id}")}" title="Print" target="_blank"><i class="icon icon-print"></i></a>&nbsp;&nbsp;
</div>
<div class="clearfix"></div>
{/if}

<div class="well">
	<div id="chartTaille"></div>
	<div id="chartPoids"></div>
	<div id="chartImg"></div>
</div>
	
{if !isset($smarty.get.printer)}
	{if $smarty.session.acl.gest_joueur == true}
	{* DIV POUR LA BOITE DE DIALOGUE POUR LA LISTE *}
	<div id="dialog_data_physique" title=""></div>

	<!-- Modal -->
	<div id="modal-morpho" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-header">
	    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	    <h4 id="myModalLabel">Details</h4>
	  </div>
	  <div class="modal-body" id="modal-morpho-content">	    
	  </div>
	  <div class="modal-footer">
	    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
	  </div>
	</div>
 
	<!-- Modal -->
	<div id="modal-form-morpho" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-header">
	    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	    <h4 id="myModalLabel">{$lang.Ajout_donnees}</h4>
	  </div>
	  <div class="modal-body">
	    <form method="post" action="{$Helper->getLink("joueur/addDataPhysique/{$joueur_id}")}" class="form-horizontal">
            <div class="control-group">
                <label for="" class="control-label">{$lang.Taille}</label>
                <div class="controls">
                    <div class="input-append">
                        <input type="text" name="data[taille]" class="input-small" size="3" />
                        <span class="add-on">cm</span>
                    </div>
                </div>
            </div>
            
            <div class="control-group">
                <label for="" class="control-label">{$lang.Poids}</label>
                <div class="controls">
                    <div class="input-append">
                        <input type="text" name="data[poids]" class="input-small" size="3" />
                        <span class="add-on">kg</span>
                    </div>
                </div>
            </div>
			
            <div class="control-group">
                <label for="" class="control-label">Img</label>
                <div class="controls">
                    <div class="input-append">
                        <input type="text" name="data[img]" class="input-small" size="3" />
                        <span class="add-on">%</span>
                    </div>
                </div>
            </div>

	  </div><!-- /modal-body -->
	  <div class="modal-footer">
	    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
	    <button type="submit" class="btn btn-primary">{$lang.Enregistrer}</button>
	    </form>
	  </div>
	</div>
	{/if}
{/if}

{if $smarty.session.acl.gest_joueur == true}
<script type="text/javascript">
<!--
function openListeData(){
	$.get(
        '{$Helper->getLink("joueur/getTabPhysiqueData/{$joueur_id}")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#modal-morpho-content').html(data); }
    )
    {/literal}

	$( "#modal-morpho" ).modal('show');
}
//-->
</script>
{/if}