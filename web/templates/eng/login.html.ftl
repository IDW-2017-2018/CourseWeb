
<!-- ########## LOGIN FORM ########## -->

<div class="login">
    
    <h1 class="title">LOGIN</h1>
    
    <div class="formcontainer">
        
      <form action="login" method="POST">

        <label class="label" for="email">Email</label>
        <input class="field" type="email" id="email" name="email"/>

        <label class="label" for="password">Password</label>
        <input class="field" type="password" id="password" name="password"/>
        
        <div class="buttoncontainer">               
            <input class="loginbutton" type="submit" name="login" value="SIGN IN"/>
        </div>
        
        <hr class="divider"/>
        
        <h1 class="title">LOGIN AS GUEST</h1>
        
        <div class="buttoncontainer">               
            <input class="loginbutton" type="submit" name="login_guest" value="CONTINUE"/>
        </div>

      </form>

    </div>

</div>