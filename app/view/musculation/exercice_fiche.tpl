{if !isset($smarty.get.pdf)}
	<script>
	$(function() {
	    $('#gallery a').lightBox({
	    	imageLoading: '{$config.url}{$config.url_dir}web/images/lightbox-ico-loading.gif',
			imageBtnClose: '{$config.url}{$config.url_dir}web/images/lightbox-btn-close.gif',
			imageBtnPrev: '{$config.url}{$config.url_dir}web/images/lightbox-btn-prev.gif',
			imageBtnNext: '{$config.url}{$config.url_dir}web/images/lightbox-btn-next.gif',
	    });
	});
	
	{if count($Videos) > 0}
	function deleteVideo(exercice_id, video){
		if( confirm('{$lang.Confirm_suppression_video} ?') ){
			$.get(
		        '{getLink("muscu/exerciceVideoDelete")}',{literal}
		        {exercice_id:exercice_id,video:video, nohtml:'nohtml'},
		        function(data){ 
		        	 {/literal}window.location.href = '{getLink("muscu/exerciceFiche/'+ exercice_id +'")}'
		        }
		    )
		   
		}
	}
	{/if}
	
	function deletePhoto(exercice_id, photo){
		if( confirm('{$lang.Confirm_suppression_photo} ?') ){
			$.get(
		        '{getLink("muscu/exercicePhotoDelete")}',{literal}
		        {exercice_id:exercice_id,photo:photo, nohtml:'nohtml'},
		        function(data){ 
		        	 {/literal}window.location.href = '{getLink("muscu/exerciceFiche/'+ exercice_id +'")}'
		        }
		    )
		   
		}
	}
	
	{if $smarty.session.acl.gest_muscu ==1}
	function deleteExercice(eid){
		if( confirm('{$lang.Confirm_suppression_exercice} ?') ){
			window.location.href = '{getLink("musculation/deleteExercice/'+ eid +'")}';
		}
	}
	{/if}
	</script>


    {if $smarty.const.BREAD == 1}
    <ul class="breadcrumb">
        <li><a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a><span class="divider">/</span></li>
        <li><a href="{getLink("musculation/index")}" title="{$lang.Musculation}">{$lang.Musculation}</a><span class="divider">/</span></li>
        <li>{$Exercice.nom}</li>
    </ul>
    {/if}
	<div class="well">
{/if}

{strip}

{if $smarty.session.acl.gest_muscu == 1 && !isset($smarty.get.pdf)}
<div class="fright">
	<a href="{getLink("musculation/editExercice/{$Exercice.id}")}" title="{$lang.Edition}" class="infos"><i class="icon-pencil"></i></a>				
	<a href="javascript:deleteExercice({$Exercice.id})" title=""><i class="icon-trash"></i></a>
</div>
{/if}

<h1>{$Exercice.nom}</h1>

{if $smarty.session.acl.gest_muscu == 1 && !isset($smarty.get.pdf)}
<div class="clear"></div>
{/if}

<table class="table">
    <tbody>
        <tr>
            <td style="width:25%;"><strong>{$lang.Muscle_travaille} :</strong></td>
            <td>{$Exercice.muscles}</td>
        </tr>
		<tr>
			<td style="width:25%;"><strong>{$lang.Zones} :</strong></td>
            <td>{$Exercice.zones}</td>
		</tr>
        <tr>
            <td><strong>{$lang.Description} :</strong></td>
            <td>{$Exercice.description|nl2br}</td>
        </tr>
        {if !empty($Photos) && count($Photos) > 0}
        <tr>
        	<td><strong>{$lang.Illustrations} :</strong></td>
        	<td>
        		<div id="gallery">
        			<table style="width:100%;">
					<tr>
						{foreach $Photos as $image}
						<td class="center" style="border:none;">
							<a href="{$config.url}{$config.url_dir}web/upload/muscu/{$image.exercice_id}/images/{$image.photo}" title="">
								<img src="{$config.url}{$config.url_dir}web/upload/muscu/{$image.exercice_id}/images/{$image.photo}" style="width:150px;" alt="">
							</a>
							{if $smarty.session.acl.gest_muscu == 1 && !isset($smarty.get.pdf)}
								<div><img src="{$config.url}{$config.url_dir}web/images/delete.png" alt="" onclick="javascript:deletePhoto({$Exercice.id}, '{$image.photo}')"/></div>	
							{/if}
						</td>
						{if $image@iteration % 4 == 0}
					</tr><tr>
						{/if}
						{/foreach}
					</tr>
				</table>
        		</div>
        	</td>
        </tr>
        {/if}
{/strip}   
        {* VIDEOS *}
        {if !isset($smarty.get.pdf) && count($Videos) > 0}
        <tr>
        	<td><strong>{$lang.Video} :</strong></td>
        	<td>
        		<table style="width:100%;">
					<tr>
					{foreach $Videos as $k => $v name=video}
					{if !empty($k)}
						<td style="border:none;">
							<div id="container_{$k}">Loading the player ...</div> 	 	
							<script type="text/javascript"> 
							    jwplayer("container_{$k}").setup({ 
							        flashplayer: "{$config.url}{$config.url_dir}web/flash/player.swf", 
							        file: "{$config.url}{$config.url_dir}web/upload/muscu/{$Exercice.id}/video/{$k}", 
							        height: 180, 
							        width: 300 
							    }); 
							</script>	
							{if $smarty.session.acl.gest_muscu == 1}
								<div><a href="javascript:deleteVideo({$Exercice.id}, '{$k}')"><img src="{$config.url}{$config.url_dir}web/images/delete.png" alt="" /></a></div>	
							{/if}
						</td>
					{/if}
					{if $smarty.foreach.video.iteration % 2 == 0}
					</tr><tr>
					{/if}
					{/foreach}
					</tr>
				</table>
        	</td>
        </tr>
        {/if}
        
    </tbody>
</table>
{if !isset($smarty.get.pdf)}
	<div class="fright">
		<br/>
		<a href="{getLink("musculation/ficheExercice/{$Exercice.id}?pdf")}" title="{$lang.Imprimer}" target="_blank"><img src="{$config.url}{$config.url_dir}web/images/pdf2.png" style="width:30px;" alt="PDF" /></a>
	</div>
	<div class="clear"></div>
{/if}

{if !isset($smarty.get.pdf)}
</div>
{/if}