function checkDataCode($data) {
	if($data != null){
		if($data.code != null){
			if($data.code != 181){
				if($data.code === "-1000"){
					showError($data.errorMessage);
				}else if($data.code === "-99"){
					showError($data.errorMessage);
				}else if($data.code === "-100"){
					showError($data.errorMessage);
				}else if($data.code === "-101"){
					showError($data.errorMessage);
				}else if($data.code === "-365"){
					showError($data.errorMessage);
				}else if ($data.code === "-366") {
					showError($data.errorMessage);
				}else if ($data.code === "-555") {
					showError($data.errorMessage);
				}else if ($data.code === "-556") {
					showError($data.errorMessage);
				}else if ($data.code === "-888") {
					showError($data.errorMessage);
				}else if ($data.code === "-997") {
					showError($data.errorMessage);
				}else if ($data.code === "-998") {
					showError($data.errorMessage);
				}else if ($data.code === "-999") {
					showError($data.errorMessage);
				}
			}else{
				return true;
			}
		}
	}
	return false;
}


function checkPageInfo($data) {
	if($data != null){
		if($data.pageInfo != null){
			if($data.pageInfo.list != null){
				return true;
			}
		}
	}
	return false;
}