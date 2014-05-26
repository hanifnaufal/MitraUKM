var Site = {

	init: function(){
		$('html').removeClass('no-js');

		if($('#zoom').length)	
			Site.zoom();

		if($('#map').length)
		Site.mapContact();
	},

	mapContact:function(){
		var mapss = new GMaps({
		  div: '#map',
		  lat: -6.364518,
		  lng: 106.828659,
		});

		mapss.addMarker({
		  lat: -6.364518,
		  lng: 106.828659,
		  title: 'TOKO MITRA UKM',
		  click: function(e) {
		    alert('Ini adalah alamat toko Mitra UKM');
		  }
		});
	},

	zoom: function(){
		$('#zoom').elevateZoom({
			zoomWindowWidth:300,
			zoomWindowHeight: 300,
			easing:true
		});
	}

};

$(function (){
	Site.init();
});