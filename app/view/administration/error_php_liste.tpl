<script>
function showFileError(){
    var fichier;
    
    fichier = $("#fichier").val();
    if( fichier == ''){
        $("#errors").html('');
    }else{
        $.get(
        '{getLink("administration/getPhpError/'+fichier+'")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#errors').html(data); }
    )
    {/literal}
    }
}
</script>
<form class="form">
    <h1>Erros PHP</h1>
    <dl>
        <dt><label for="fichier">Files :</label></dt>
        <dd>
            <select id="fichier" onchange="showFileError();">
                <option></option>
                {foreach $Files as $k => $v}
                <option value="{$v}">{$v}</option>
                {/foreach}
            </select>
        </dd>
    </dl>
</form>
<div class="showData">
<div id="errors"></div>
</div>