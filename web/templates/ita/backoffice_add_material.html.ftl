
<div class="filter">

    <h1 class="title">AGGIUNTA RELAZIONE CON MATERIALE</h1>

    <div class="formcontainer">

      <form action="backofficeeditcourse?lang=${lang}&id=${corso.id}&action=edit_material" method="POST">

            <div class="fieldcontainerleft">

                <label class="label" for="corso_nome">Corso</label>
                <input class="field" type="text" id="corso_nome" name="corso_nome" placeholder="${corso.nome}" disabled="disabled" />

            </div>


            <div class="fieldcontainerright">

                <label class="label" for="materiale_nome">Materiale</label>
                <select class="field" name="materiale_nome">
                  <#list items>
                      <#items as item>
                      <option value="${item.id}">${item.nome}</option>
                      </#items>
                  <#else>
                  </#list>
                </select>

            </div>


        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="aggiungi_materiale" value="AGGIUNGI"/>
        </div>

        <h1 class="title">AGGIUNGI NUOVO MATERIALE</h1>

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="nuovo_materiale" value="NUOVO"/>
        </div>

      </form>

    </div>

</div>
