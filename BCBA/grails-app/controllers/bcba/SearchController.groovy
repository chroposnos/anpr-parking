package bcba

import grails.converters.*
//import bcba.anpr.*;


class SearchController {

    def index = { }
    def manualSearch = { 
	}
    def advancedSearch = { 
		
    }

    def automaticSearch = { }

    def consultPlate = {

        def result = ''

//		def recognizer = new PlateRecognizer("http://192.168.1.114")
//		def result = recognizer.processImage()


//		result.put('discount', 'true')

        result = [
            'plate' : 'LXK1099',
            'url'   : 'http://localhost/fotos/C360_2011-04-21%2015-39-05.jpg',
            'status': 'ok', // ok, warning, error
            'time'  : 1234,
            'discount' : false
        ]

        def pr          = new ParkingRecord(
            plateNumber  : result['plate'],
            entranceDate : new Date(),
            exitDate     : new Date(),
            discount     : result['discount']
        )
        
        pr.save()
        
        def converter = result as JSON

	render params.callback + "('" + converter.toString() + "')"
    }
}