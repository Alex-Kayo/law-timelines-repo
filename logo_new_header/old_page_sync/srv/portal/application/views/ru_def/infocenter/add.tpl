<div id="content-all">
  <div class="panel">
    <div class="panel1">
      <div class="panel2">
        <div class="panel-head clr">
          <h3>{$i18n.module}</h3>
        </div>
        <div class="white3-panel">
          <div class="white3-panel1 clr">
            <form method="post" action="{$lang_prefix}/infocenter/add" id="sendForm">
              {$error}
              <table width="610" border="0" cellspacing="2" cellpadding="2" id="feedback">
                <tr>
                  <td>{$i18n.title}*: </td>
                  <td><input type="text" name="name" id="name" value="{$value.name}" />
                    <br />
                    <span class="warn">{$errors.name}</span> </td>
                </tr>
                <tr>
                  <td>{$i18n.name}*: </td>
                  <td><input type="text" name="username" id="username" value="{$value.username}" />
                    <br />
                    <span class="warn">{$errors.username}</span> </td>
                </tr>
                <tr>
                  <td>{$i18n.email}*: </td>
                  <td><input type="text" name="email" id="email" value="{$value.email}" />
                    <br />
                    <span  class="warn">{$errors.email}</span> </td>
                </tr>
                <tr>
                  <td>{$i18n.text}: </td>
                  <td><textarea rows="" cols="" name="question" id="question">{$value.question}</textarea>
                    <br />
                    <span  class="warn">{$errors.question}</span> </td>
                </tr>
			    <tr valign="top">
			      <td>{$i18n.captcha}*</td>
			      <td><p>
			          <input type="text" name="captcha" value="" id="captcha" />
			        </p>
			        <p> {$captcha} <br />
			          <small>{$i18n.captcha}</small><br />
			          <span class="warn">{$errors.captcha}</span></p></td>
			    </tr>                
                
                
                <tr>
                  <td>&nbsp;</td>
                  <td>
                        <input type="hidden" name="add" value="OZ" />
                        <a href="#" class="bbutton2" onclick="$('#sendForm').submit(); return false;"><span>{$i18n.submit}</span></a>
                  </td>
                </tr>
              </table>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
