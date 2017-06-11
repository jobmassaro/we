<div ng-controller="loginCtrl" style="padding-top:40px;">
  <div class="container">
        <div class="card card-container">
            <img id="profile-img" class="profile-img-card" src="dist/images/logo.png" />
            <p id="profile-name" class="profile-name-card"></p>
            <form class="form-signin">
                <span id="reauth-email" class="reauth-email"></span>
                <input  ng-model="item.username" type="text" id="username" class="form-control" placeholder="Username" required autofocus>
                <input   ng-model="item.password" type="password" id="password" class="form-control" placeholder="Password" required>
                <button class="btn btn-lg btn-success btn-block btn-signin btn-lg" type="submit" ng-click="login(item)">LOGIN</button>
            </form><!-- /form -->
        </div><!-- /card-container -->
    </div><!-- /container -->
</div>