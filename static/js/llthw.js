var jqconsole;
$(function () {
  jqconsole = $('#console').jqconsole('', '');
  jqconsole.RegisterMatching('(', ')', 'parents');
  if (localStorage.getItem("jqhist"))
     jqconsole.SetHistory(JSON.parse(localStorage.getItem("jqhist")));

  lisp.write = function(str){
     jqconsole.Write(xstring(str), 'jqconsole-output', false);
     return str;
  }

  var startPrompt = function () {
    // Start the prompt with history enabled.
    jqconsole.Write(lisp.evalString('(CL:PACKAGE-NAME CL:*PACKAGE*)') + '> ', 'jqconsole-prompt');
    jqconsole.Prompt(true, function (input) {
      // Output input with the class jqconsole-return.
      if (input[0] != ','){
          try {
              var vs = lisp.evalInput(input);
              // for (var i=0; i<vs.length; i++){
                 jqconsole.Write(lisp.print(vs) + '\n', 'jqconsole-return');
                 localStorage.setItem("jqhist", JSON.stringify(jqconsole.GetHistory()));
              // }
          } catch(error) {
              var msg = error.message || error || 'Unknown error';
              if (typeof(msg) != 'string') msg = xstring(msg);
              jqconsole.Write('ERROR: ' + msg + '\n', 'jqconsole-error');
          }
      } else
          jqconsole.Write(lisp.compileString(input.slice(1)) + '\n', 'jqconsole-return');

      // Restart the prompt.
      startPrompt();
    }, function(input){
      try {
          lisp.read(input[0]==','? input.slice(1): input);
      } catch(error) {
          return 0;
      }
      return false;
    });
  };
  startPrompt();
});
