
<div class="filter">
    
    <h1 class="title">MODIFICA CORSO</h1>
    
    <div class="formcontainer">
        
      <form action="searchcourses?lang=${lang}" method="POST">

        <div class="fieldcontainercentral">

            <label class="label" for="corso_codice">Codice</label>
            <input class="field" type="text" id="corso_codice" name="corso_codice" placeholder="${corso_ita.codice}" />

            <label class="label" for="corso_anno">Anno</label>
            <input class="field" type="text" id="corso_anno" name="corso_anno" placeholder="${corso_ita.anno}" />

            <label class="label" for="corso_nome">Nome</label>
            <input class="field" type="text" id="corso_nome" name="corso_nome" placeholder="${corso_ita.nome}" />
    
            <label class="label" for="corso_ssd">SSD</label>
            <input class="field" type="text" id="corso_ssd" name="corso_ssd" placeholder="${corso_ita.SSD}" />

            <label class="label" for="corso_semestre">Semestre</label>
            <select class="field" name="corso_semestre" placeholder="${corso_ita.semestre}" >
                <option value="---">---</option>
                <option value="1">1</option>
                <option value="2">2</option>
            </select>

            <label class="label" for="corso_lingua">Lingua</label>
            <select class="field" name="corso_lingua" placeholder="${corso_ita.lingua}" >
                <option value="" disabled selected>---</option>
                <option value="1">Italiano</option>
                <option value="2">Inglese</option>
            </select>

            <label class="label" for="corso_link_homepage">Link Homepage</label>
            <input class="field" type="text" id="corso_link_homepage" name="corso_link_homepage" placeholder="${corso_ita.linkHomepageCorso}" />

            <label class="label" for="corso_link_risorse">Link Risorse</label>
            <input class="field" type="text" id="corso_link_risorse" name="corso_link_risorse" placeholder="${corso_ita.linkRisorseEsterne}" />

            <label class="label" for="corso_link_forum">Link Forum</label>
            <input class="field" type="text" id="corso_link_forum" name="corso_link_forum" placeholder="${corso_ita.linkForum}" />
        
        </div>

            <div class="fieldcontainerleft">

                <h1 class="title">INFO CORSO ITALIANO</h1>
                
                <label class="label" for="corso_prerequisiti">Prerequisiti</label>
                <textarea class="field" type"text" id="corso_prerequisiti" name="corso_prerequisiti" placeholder="${corso_ita.prerequisiti}" "></textarea>

                <label class="label" for="corso_obiettivi">Obiettivi</label>
                <textarea class="field" type"text" id="corso_obiettivi" name="corso_obiettivi" placeholder="${corso_ita.obiettivi}" "></textarea>
                
                <label class="label" for="corso_mod_esame">Modalit&agrave; Esame</label>
                <textarea class="field" type"text" id="corso_mod_esame" name="corso_mod_esame" placeholder="${corso_ita.modEsame}" "></textarea>

                <label class="label" for="corso_mod_insegnamento">Modalit&agrave; Insegnamento</label>
                <textarea class="field" type"text" id="corso_mod_insegnamento" name="corso_mod_insegnamento" placeholder="${corso_ita.modInsegnamento}" "></textarea>
                
                <label class="label" for="corso_descrittori_dublino">Descrittori Dublino</label>
                <textarea class="field" type"text" id="corso_descrittori_dublino" name="corso_descrittori_dublino" placeholder="${corso_ita.descittoriDublino}" "></textarea>

                <label class="label" for="corso_sillabo">Sillabo</label>
                <textarea class="field" type"text" id="corso_sillabo" name="corso_sillabo" placeholder="${corso_ita.sillabo}" "></textarea>

                <label class="label" for="corso_note">Note</label>
                <textarea class="field" type"text" id="corso_note" name="corso_note" placeholder="${corso_ita.note}" "></textarea>
                
            </div>


            <div class="fieldcontainerright">
                
                <h1 class="title">INFO CORSO INGLESE</h1>

                <label class="label" for="corso_prerequisiti">Prerequisiti</label>
                <textarea class="field" type"text" id="corso_prerequisiti" name="corso_prerequisiti" placeholder="${corso_eng.prerequisiti}" "></textarea>

                <label class="label" for="corso_obiettivi">Obiettivi</label>
                <textarea class="field" type"text" id="corso_obiettivi" name="corso_obiettivi" placeholder="${corso_eng.obiettivi}" "></textarea>
                
                <label class="label" for="corso_mod_esame">Modalit&agrave; Esame</label>
                <textarea class="field" type"text" id="corso_mod_esame" name="corso_mod_esame" placeholder="${corso_eng.modEsame}" "></textarea>

                <label class="label" for="corso_mod_insegnamento">Modalit&agrave; Insegnamento</label>
                <textarea class="field" type"text" id="corso_mod_insegnamento" name="corso_mod_insegnamento" placeholder="${corso_eng.modInsegnamento}" "></textarea>
                
                <label class="label" for="corso_descrittori_dublino">Descrittori Dublino</label>
                <textarea class="field" type"text" id="corso_descrittori_dublino" name="corso_descrittori_dublino" placeholder="${corso_eng.descrittoriDublino}" "></textarea>

                <label class="label" for="corso_sillabo">Sillabo</label>
                <textarea class="field" type"text" id="corso_sillabo" name="corso_sillabo" placeholder="${corso_eng.sillabo}" "></textarea>

                <label class="label" for="corso_note">Note</label>
                <textarea class="field" type"text" id="corso_note" name="corso_note" placeholder="${corso_eng.note}" "></textarea>
                
            </div>


        <div class="buttoncontainer">               
            <input class="filterbutton" type="submit" name="filtra" value="MODIFICA"/>
        </div>

      </form>

    </div>

</div>
