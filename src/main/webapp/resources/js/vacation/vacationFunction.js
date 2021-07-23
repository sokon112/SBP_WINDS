var vacationService=(function(){
	//private
	function add(rejectReasonData,callback){
		$.ajax({
			type:'put',
			url:'/vacation/'+rejectReasonData.vacationAppNum+'/no',
			contentType:'application/json',
			data:JSON.stringify({
				vacationAppNum:rejectReasonData.vacationAppNum,
				refusalreason:rejectReasonData.rejectReason
			}),
			success:function(result){
				if(callback){
					callback(result);
				}
			}			
		})			
	}// add 종료
	
	return {
		add:add
	}
})();