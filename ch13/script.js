function writeSave(myform){
	
	if(!myform.writer.value){
	  alert('작성자를 입력하십시요.');
	  myform.writer.focus();
	  return false;
	}
	
	if(!myform.subject.value){
	  alert('제목을 입력하십시요.');
	  myform.subject.focus();
	  return false;
	}
	
	if(!myform.content.value){
	  alert('내용을 입력하십시요.');
	  myform.content.focus();
	  return false;
	}
        
	if(!myform.passwd.value){
	  alert('비밀번호를 입력하십시요.');
	  myform.passwd.focus();
	  return false;
	}
 };