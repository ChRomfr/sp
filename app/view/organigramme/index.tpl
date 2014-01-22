{strip}
<ul class="breadcrumb">
    <li><a href="{getLink("index")}" title="">{$lang.Accueil}</a><span class="divider">/</span></li>
    <li>{$lang.Organigramme}</li>
</ul>

<div class="well">
    <h4>{$lang.Organigramme}</h4>
	
	{* DIRECTEUR ADMINISTRATIF *}
    <div style="margin:auto; width:75%;">    
        {foreach $Personnes as $Row}
            {if $Row.fonction == '014'}
            <div class="organigramme_directeur_administratif">
                <div><strong>{$Row.nom} {$Row.prenom}</strong></div>
                <div>{$Row.fonction_libelle}</div>
                {if empty($smarty.session.utilisateur.id_liaison)}
                    {if !empty($Row.email)}<div><a href="mailto:{$Row.email}">{$Row.email}</a></div>{/if}
                    {if !empty($Row.telephone)}<div>{$Row.telephone}</div>{/if}
                {/if}
				{if $config.multi_site == 1 && !empty($Row.site_id) && !empty($Row.site)}
				{$Row.site}
				{/if}
            </div>
            {/if}  
        {/foreach}   
        <div class="clear"></div> 
    </div>
    
    <div class="organigramme_seperator"></div> 
	
    {* DIRECTEUR *}
    <div style="margin:auto; width:75%;">    
        {foreach $Personnes as $Row}
            {if $Row.fonction == '001'}
            <div class="organigramme_directeur">
                <div><strong>{$Row.nom} {$Row.prenom}</strong></div>
                <div>{$Row.fonction_libelle}</div>
                {if empty($smarty.session.utilisateur.id_liaison)}
                    {if !empty($Row.email)}<div><a href="mailto:{$Row.email}">{$Row.email}</a></div>{/if}
                    {if !empty($Row.telephone)}<div>{$Row.telephone}</div>{/if}
                {/if}
				{if $config.multi_site == 1 && !empty($Row.site_id) && !empty($Row.site)}
				{$Row.site}
				{/if}
            </div>
            {/if}  
        {/foreach}   
        <div class="clear"></div> 
    </div>
    
    <div class="organigramme_seperator"></div>   
    
    {* COORDINATEUR *}
    <div style="margin:auto; width:75%;">    
        {foreach $Personnes as $Row}
            {if $Row.fonction == '002'}
            <div class="organigramme_coordinateur">
                <div><strong>{$Row.nom} {$Row.prenom}</strong></div>
                <div>{$Row.fonction_libelle}</div>
                {if empty($smarty.session.utilisateur.id_liaison)}
                    {if !empty($Row.email)}<div><a href="mailto:{$Row.email}">{$Row.email}</a></div>{/if}
                    {if !empty($Row.telephone)}<div>{$Row.telephone}</div>{/if}
                {/if}
				{if $config.multi_site == 1 && !empty($Row.site_id) && !empty($Row.site)}
				{$Row.site}
				{/if}
            </div>
            {/if}  
        {/foreach}   
        <div class="clear"></div> 
    </div>
    
    <div class="organigramme_seperator"></div>
    
    {* ENTRAINEUR *}
    <div style="margin:auto; width:75%;">    
        {foreach $Personnes as $Row}
            {if $Row.fonction == 003}
            <div class="organigramme_entraineur">
                <div><strong>{$Row.nom} {$Row.prenom}</strong></div>
                <div>{$Row.fonction_libelle}</div>
                {if empty($smarty.session.utilisateur.id_liaison)}
                    {if !empty($Row.email)}<div><a href="mailto:{$Row.email}">{$Row.email}</a></div>{/if}
                    {if !empty($Row.telephone)}<div>{$Row.telephone}</div>{/if}
                {/if}
				{if $config.multi_site == 1 && !empty($Row.site_id) && !empty($Row.site)}
				{$Row.site}
				{/if}
            </div>
            {/if}  
        {/foreach}   
        <div class="clear"></div> 
    </div>
    
    <div class="organigramme_seperator"></div>
    
    {* PREPARATEUR PHYSIQUE *}
    <div style="margin:auto; width:75%;">    
        {foreach $Personnes as $Row}
            {if $Row.fonction == 004}
            <div class="organigramme_prepateur_physique">
                <div><strong>{$Row.nom} {$Row.prenom}</strong></div>
                <div>{$Row.fonction_libelle}</div>
                {if empty($smarty.session.utilisateur.id_liaison)}
                    {if !empty($Row.email)}<div><a href="mailto:{$Row.email}">{$Row.email}</a></div>{/if}
                    {if !empty($Row.telephone)}<div>{$Row.telephone}</div>{/if}
                {/if}
				{if $config.multi_site == 1 && !empty($Row.site_id) && !empty($Row.site)}
				{$Row.site}
				{/if}
            </div>
            {/if}  
        {/foreach}   
        <div class="clear"></div> 
    </div>
    
    <div class="organigramme_seperator"></div>
    
    {* REPONSABLE MUSCULATION *}
    <div style="margin:auto; width:75%;">    
        {foreach $Personnes as $Row}
            {if $Row.fonction == 005}
            <div class="organigramme_responsable_musculation">
                <div><strong>{$Row.nom} {$Row.prenom}</strong></div>
                <div>{$Row.fonction_libelle}</div>
                {if empty($smarty.session.utilisateur.id_liaison)}
                    {if !empty($Row.email)}<div><a href="mailto:{$Row.email}">{$Row.email}</a></div>{/if}
                    {if !empty($Row.telephone)}<div>{$Row.telephone}</div>{/if}
                {/if}
				{if $config.multi_site == 1 && !empty($Row.site_id) && !empty($Row.site)}
				{$Row.site}
				{/if}
            </div>
            {/if}  
        {/foreach}   
        <div class="clear"></div> 
    </div>
    
    <div class="organigramme_seperator"></div>
    
    {* COORDINATEUR MEDICALE *}
    <div style="margin:auto; width:75%;">    
        {foreach $Personnes as $Row}
            {if $Row.fonction == 006}
            <div class="organigramme_coordinateur_medicale">
                <div><strong>{$Row.nom} {$Row.prenom}</strong></div>
                <div>{$Row.fonction_libelle}</div>
                {if empty($smarty.session.utilisateur.id_liaison)}
                    {if !empty($Row.email)}<div><a href="mailto:{$Row.email}">{$Row.email}</a></div>{/if}
                    {if !empty($Row.telephone)}<div>{$Row.telephone}</div>{/if}
                {/if}
				{if $config.multi_site == 1 && !empty($Row.site_id) && !empty($Row.site)}
				{$Row.site}
				{/if}
            </div>
            {/if}  
        {/foreach}   
        <div class="clear"></div> 
    </div>
    
    <div class="organigramme_seperator"></div>
    
    {* KINE *}
    <div style="margin:auto; width:75%;">    
        {foreach $Personnes as $Row}
            {if $Row.fonction == 007}
            <div class="organigramme_kine">
                <div><strong>{$Row.nom} {$Row.prenom}</strong></div>
                <div>{$Row.fonction_libelle}</div>
                {if empty($smarty.session.utilisateur.id_liaison)}
                    {if !empty($Row.email)}<div><a href="mailto:{$Row.email}">{$Row.email}</a></div>{/if}
                    {if !empty($Row.telephone)}<div>{$Row.telephone}</div>{/if}
                {/if}
				{if $config.multi_site == 1 && !empty($Row.site_id) && !empty($Row.site)}
				{$Row.site}
				{/if}
            </div>
            {/if}  
        {/foreach}   
        <div class="clear"></div> 
    </div>
    
    <div class="organigramme_seperator"></div>
    
    {* MEDECIN *}
    <div style="margin:auto; width:75%;">    
        {foreach $Personnes as $Row}
            {if $Row.fonction == '008'}
            <div class="organigramme_medecin">
                <div><strong>{$Row.nom} {$Row.prenom}</strong></div>
                <div>{$Row.fonction_libelle}</div>
                {if empty($smarty.session.utilisateur.id_liaison)}
                    {if !empty($Row.email)}<div><a href="mailto:{$Row.email}">{$Row.email}</a></div>{/if}
                    {if !empty($Row.telephone)}<div>{$Row.telephone}</div>{/if}
                {/if}
				{if $config.multi_site == 1 && !empty($Row.site_id) && !empty($Row.site)}
				{$Row.site}
				{/if}
            </div>
            {/if}  
        {/foreach}   
        <div class="clear"></div> 
    </div>
    
    <div class="organigramme_seperator"></div>
    
    {* DIETE *}
    <div style="margin:auto; width:75%;">    
        {foreach $Personnes as $Row}
            {if $Row.fonction == '009'}
            <div class="organigramme_diete">
                <div><strong>{$Row.nom} {$Row.prenom}</strong></div>
                <div>{$Row.fonction_libelle}</div>
                {if empty($smarty.session.utilisateur.id_liaison)}
                    {if !empty($Row.email)}<div><a href="mailto:{$Row.email}">{$Row.email}</a></div>{/if}
                    {if !empty($Row.telephone)}<div>{$Row.telephone}</div>{/if}
                {/if}
				{if $config.multi_site == 1 && !empty($Row.site_id) && !empty($Row.site)}
				{$Row.site}
				{/if}
            </div>
            {/if}  
        {/foreach}   
        <div class="clear"></div> 
    </div>
    
     <div class="organigramme_seperator"></div>
        
    {* PSYCHOLOGUE *}
    <div style="margin:auto; width:75%;">    
        {foreach $Personnes as $Row}
            {if $Row.fonction == '010'}
            <div class="organigramme_psycho">
                <div><strong>{$Row.nom} {$Row.prenom}</strong></div>
                <div>{$Row.fonction_libelle}</div>
                {if empty($smarty.session.utilisateur.id_liaison)}
                    {if !empty($Row.email)}<div><a href="mailto:{$Row.email}">{$Row.email}</a></div>{/if}
                    {if !empty($Row.telephone)}<div>{$Row.telephone}</div>{/if}
                {/if}
				{if $config.multi_site == 1 && !empty($Row.site_id) && !empty($Row.site)}
				{$Row.site}
				{/if}
            </div>
            {/if}  
        {/foreach}   
        <div class="clear"></div> 
    </div>
    
     <div class="organigramme_seperator"></div>
    
    {* PODOLOGUE *}
    <div style="margin:auto; width:75%;">    
        {foreach $Personnes as $Row}
            {if $Row.fonction == '011'}
            <div class="organigramme_podologue">
                <div><strong>{$Row.nom} {$Row.prenom}</strong></div>
                <div>{$Row.fonction_libelle}</div>
                {if empty($smarty.session.utilisateur.id_liaison)}
                    {if !empty($Row.email)}<div><a href="mailto:{$Row.email}">{$Row.email}</a></div>{/if}
                    {if !empty($Row.telephone)}<div>{$Row.telephone}</div>{/if}
                {/if}
				{if $config.multi_site == 1 && !empty($Row.site_id) && !empty($Row.site)}
				{$Row.site}
				{/if}
            </div>
            {/if}  
        {/foreach}   
        <div class="clear"></div> 
    </div>
    
    <div class="organigramme_seperator"></div>
        
    {* DENTISTE *}
    <div style="margin:auto; width:75%;">    
        {foreach $Personnes as $Row}
            {if $Row.fonction == '012'}
            <div class="organigramme_dentiste">
                <div><strong>{$Row.nom} {$Row.prenom}</strong></div>
                <div>{$Row.fonction_libelle}</div>
                {if empty($smarty.session.utilisateur.id_liaison)}
                    {if !empty($Row.email)}<div><a href="mailto:{$Row.email}">{$Row.email}</a></div>{/if}
                    {if !empty($Row.telephone)}<div>{$Row.telephone}</div>{/if}
                {/if}
				{if $config.multi_site == 1 && !empty($Row.site_id) && !empty($Row.site)}
				{$Row.site}
				{/if}
            </div>
            {/if}  
        {/foreach}   
        <div class="clear"></div> 
    </div>
    
    <div class="organigramme_seperator"></div>
        
    {* SUIVI SCOLAIRE *}
    <div style="margin:auto; width:75%;">    
        {foreach $Personnes as $Row}
            {if $Row.fonction == '013'}
            <div class="organigramme_suivi_scolaire">
                <div><strong>{$Row.nom} {$Row.prenom}</strong></div>
                <div>{$Row.fonction_libelle}</div>
                {if empty($smarty.session.utilisateur.id_liaison)}
                    {if !empty($Row.email)}<div><a href="mailto:{$Row.email}">{$Row.email}</a></div>{/if}
                    {if !empty($Row.telephone)}<div>{$Row.telephone}</div>{/if}
                {/if}
				{if $config.multi_site == 1 && !empty($Row.site_id) && !empty($Row.site)}
				{$Row.site}
				{/if}
            </div>
            {/if}  
        {/foreach}   
        <div class="clear"></div> 
    </div>
	
    <div class="organigramme_seperator"></div> 
	
	{* ACCOMPAGNATEUR *}
	<div style="margin:auto; width:75%;">    
        {foreach $Personnes as $Row}
            {if $Row.fonction == '015'}
            <div class="organigramme_acc">
                <div><strong>{$Row.nom} {$Row.prenom}</strong></div>
                <div>{$Row.fonction_libelle}</div>
                {if empty($smarty.session.utilisateur.id_liaison)}
                    {if !empty($Row.email)}<div><a href="mailto:{$Row.email}">{$Row.email}</a></div>{/if}
                    {if !empty($Row.telephone)}<div>{$Row.telephone}</div>{/if}
                {/if}
				{if $config.multi_site == 1 && !empty($Row.site_id) && !empty($Row.site)}
				{$Row.site}
				{/if}
            </div>
            {/if}  
        {/foreach}   
        <div class="clear"></div> 
    </div> 
</div>{/strip}