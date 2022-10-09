
window.onload=show;
	function show(id) {
		var d = document.getElementById(id);
			for (var i = 1; i<=10; i++) {
				if (document.getElementById('ssmenu'+i)) {document.getElementById('ssmenu'+i).style.display='none';}
			}
		if (d) {d.style.display='block';}
		}
