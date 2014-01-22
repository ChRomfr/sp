{*
    FORMULAIRE D AJOUT UTILISATEUR
*}

<script type="text/javascript">
<!--
jQuery(document).ready(function(){
	// binds form submission and fields to the validation engine
	jQuery("#formAdd").validationEngine();
});

function idAlrdyUse(){
	var result = '';
    var xhr = getXMLHttpRequest();
	xhr.open("GET", '{getLink("utilisateur/check_identifiant/'+document.getElementById('identifiant').value+'?nohtml")}', true);
	xhr.onreadystatechange = function () {
        if(xhr.readyState == 4){
            result = xhr.responseText;
            if(result == 'alreadyUse'){
                 document.getElementById('identifiantVerif').innerHTML = '<span style="color:#FF0000;"><img src="{$config.url}{$config.url_dir}web/images/noSmall.png" /> <strong>{$lang.Identifiant_deja_utilise}</strong></span>';
				 document.getElementById('resultIdentifiant').value = 'alreadyUse';			
            }else{
                 document.getElementById('identifiantVerif').innerHTML = '<img src="{$config.url}{$config.url_dir}web/images/okSmall.png" />';
				 document.getElementById('resultIdentifiant').value = '';
            }
        }
	}
	xhr.send(null);
}

function emailAlrUse(){
	var result = '';
    var xhr = getXMLHttpRequest();
	xhr.open("GET", '{getLink("utilisateur/check_email/'+document.getElementById('email').value+'?nohtml")}', true);
	xhr.onreadystatechange = function () {
        if(xhr.readyState == 4){
            result = xhr.responseText;
            if(result == 'alreadyUse'){
                 document.getElementById('emailVerif').innerHTML = '<span style="color:#FF0000;"><img src="{$config.url}{$config.url_dir}web/images/noSmall.png" /> <strong>{$lang.Email_deja_utilise}</strong></span>';
				 document.getElementById('resultEmail').value = 'alreadyUse';			
            }else{
                 document.getElementById('emailVerif').innerHTML = '<img src="{$config.url}{$config.url_dir}web/images/okSmall.png" />';
				 document.getElementById('resultEmail').value = '';
            }
        }
	}
	xhr.send(null);
}

function changeType(){
	type = $("#type").val();
	
	if(type == 'joueur'){
		$.get(
        	'{getLink("administration/getJoueurListe")}',{literal}
        	{nohtml:'nohtml'},
       		function(data){ $('#joueur_liste').html(data); }
    	)
    	{/literal}
	}else{
		$('#joueur_liste').html("");
	}
	
}

//-->
</script>{strip}

<div id="bread">
	<a href="{getLink("index/index")}" title="">{$lang.Accueil}</a>&nbsp;>>&nbsp;
	<a href="{getLink("administration/index")}" title="">{$lang.Administration}</a>&nbsp;>>&nbsp;
	<a href="{getLink("administration/userIndex")}" title="">{$lang.Utilisateurs}</a>&nbsp;>>&nbsp;
	{$lang.Nouveau}
</div>

<form method="post" action="" class="form" id="formAdd">
    <h1>{$lang.New_user}</h1>
    <dl>
        <dt><label for="identifiant">{$lang.Identifiant} :</label></dt>
        <dd><input type="text"  name="user[identifiant]" id="identifiant" class="validate[required]" required onchange="idAlrdyUse();" /><span id="identifiantVerif"></span></dd>
    </dl>
    <dl>
        <dt><label for="password">{$lang.Password} :</label></dt>
        <dd><input type="password" name="user[password]" id="password" class="validate[required]" required /></dd>
    </dl>
    <dl>
        <dt><label for="password_repeat">{$lang.Password_repeat} :</label></dt>
        <dd><input type="password" name="password_repeat" id="password_repeat" class="validate[required,equals[password]]" required /></dd>
    </dl>
    <dl>
        <dt><label for="type">{$lang.Account_type} :</label></dt>
        <dd>
            <select name="user[type]" class="validate[required]" id="type" required onchange="changeType()">
                <option></option>
				{foreach $TUAC as $Row}
				<option value="{$Row.value}">{$Row.libelle}</option>
				{/foreach}
            </select>
        </dd>    
    </dl>
    <div id="joueur_liste"></div>
    <dl>
        <dt><label for="email">{$lang.Email} :</label></dt>
        <dd><input type="email" name="user[email]" id="email" class="validate[custom[email]]" /></dd>
    </dl>    
    <div class="center">
    	<input type="hidden" id="resultIdentifiant" value="" />
		<input type="hidden" id="resultEmail" value="" />
		<input type="submit" value="{$lang.Enregistrer}" />
    </div>
</form>{/strip}