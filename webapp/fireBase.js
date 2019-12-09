var app_fireBase = {};
(function(){
  // Your web app's Firebase configuration
  var config = {
    // your api config
  };
  // Initialize Firebase
  firebase.initializeApp(config);

  app_fireBase = firebase;

  function fnCreate(path, body, callBack){
    if(!path || !body) return;
    app_fireBase.database().ref(path).set(body, callBack);
  }

  function fnUpdate(path, body, callBack){
    if(!path || !body) return;
    app_fireBase.database().ref(path).update(body, callBack);
  }

  function fnListen(path, callBack){
    if(!path || !callBack) return;

    var listen = app_fireBase.database().ref(path);
    listen.on('value', function(snapshot) {
      callBack(snapshot.val());
    });
  }

  function fnGet(path, successCallback, errorCallBack){
    if(!path || !successCallback || !errorCallBack) return;
    
    app_fireBase.database().ref(path).once('value').then(successCallback, errorCallBack)
  }



  app_fireBase.databaseApi = {
    create: fnCreate,
    update: fnUpdate,
    get: fnGet,
    listen: fnListen
  }

})()