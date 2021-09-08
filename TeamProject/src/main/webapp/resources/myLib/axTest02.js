
$(function(){
	$('#idDup').click(function(){
		var id = $(this).attr('id');
		
		$.ajax({
			type: 'Post',
			url: 'idCheck',
			 dataType : "json",
			data: {
				id: $('#id').val()
			},
			success: function(data){
				if (data.idUse == 'T') {
					alert('~~ JQ : 삭제 성공 ~~');					
				}else{
					alert('~~ JQ : 삭제 실패 ~~');
				}
			},
			error: function(){
				alert('~~ 서버 오류 !! 잠시후 다시 하세요 ~~');
			}
		}); //ajax
	}); ///ddd_click	
}); //ready