public inherited sharing class ViaCepConnector {
    private static final String VIA_CEP_ENDPOINT_SETTING_NAME = 'ViaCepEndpoint';
    @TestVisible
    private static final String WRONG_NUMBER_OF_DIGITS_ERROR_MSG = Label.CEP_Numero_de_digitos_incorreto;
    @TestVisible
    private static final Integer SUCCESS_STATUS_CODE = 200;
    @TestVisible
    private static final Integer ERROR_STATUS_CODE = 400;

    private static String viaCepEndpoint {
        get {
            if (String.isBlank(viaCepEndpoint)) {
                viaCepEndpoint = SettingService.getSetting(VIA_CEP_ENDPOINT_SETTING_NAME).Value__c;
            }
            return viaCepEndpoint;
        }
        private set;
    }

    public static ViaCepResponse getCEPData(String cep){
        ViaCepResponse cepResponse = new ViaCepResponse();

        try{
            HttpRequest req = new HttpRequest();
            req.setEndpoint(String.format(viaCepEndpoint, new List<String>{cep}));
            req.setMethod('GET');
            req.setHeader('Accept', '*/*');
            HTTPResponse res = new Http().send(req);

            if(res.getStatusCode() == SUCCESS_STATUS_CODE){
                cepResponse = ViaCepResponse.parse(res.getBody());
            }else if(res.getStatusCode() == ERROR_STATUS_CODE) {
                //when the status code is 400 it means that we tried to get a response with the wrong number of cep digits
                throw new ViaCepConnectorException(WRONG_NUMBER_OF_DIGITS_ERROR_MSG);
            }
        }catch(Exception e){
            throw e;
        }

        return cepResponse;
    }

    private class ViaCepConnectorException extends Exception{}
}