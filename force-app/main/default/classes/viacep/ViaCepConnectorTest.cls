@IsTest
public class ViaCepConnectorTest {
    @IsTest
    static void testGetCEPDataSuccess() {
        Test.setMock(HttpCalloutMock.class, new ViaCepCalloutsMock(false));

        Test.startTest();
        ViaCepResponse cepResponse = ViaCepConnector.getCEPData('01001000');
        Test.stopTest();

        System.assertEquals('3550308', cepResponse.ibge, 'IBGE code should be the same.');
    }

    @IsTest
    static void testGetCEPDataError() {
        Test.setMock(HttpCalloutMock.class, new ViaCepCalloutsMock(true));

        Test.startTest();
        try{
            ViaCepConnector.getCEPData('0100100');
            System.assert(false, 'It should not get here.');
        }catch(Exception e){
            System.assert(e.getMessage().contains(ViaCepConnector.WRONG_NUMBER_OF_DIGITS_ERROR_MSG), 'The number of digits provided is not long enough.');
        }

        Test.stopTest();
    }

    public inherited sharing class ViaCepCalloutsMock implements HttpCalloutMock{
        private Boolean returnWithError = false;

        public ViaCepCalloutsMock(Boolean returnWithError){
            this.returnWithError = returnWithError;
        }

        public HTTPResponse respond(HTTPRequest req) {
            // Create a mock response
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');

            if(this.returnWithError){
                res.setStatusCode(ViaCepConnector.ERROR_STATUS_CODE);
            }else{
                res.setStatusCode(ViaCepConnector.SUCCESS_STATUS_CODE);
                res.setBody(GET_SUCCESS_RESPONSE);
            }

            return res;
        }

        /*
         *   Success response
         */
        private final String GET_SUCCESS_RESPONSE =
            '{'+
            '      \"cep\": \"01001-000\",'+
            '      \"logradouro\": \"Praça da Sé\",'+
            '      \"complemento\": \"lado ímpar\",'+
            '      \"bairro\": \"Sé\",'+
            '      \"localidade\": \"São Paulo\",'+
            '      \"uf\": \"SP\",'+
            '      \"ibge\": \"3550308\",'+
            '      \"gia\": \"1004\",'+
            '      \"ddd\": \"11\",'+
            '      \"siafi\": \"7107\"'+
            '    }';
    }
}