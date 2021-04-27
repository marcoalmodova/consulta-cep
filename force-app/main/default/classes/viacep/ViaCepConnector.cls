public inherited sharing class ViaCepConnector {
    private static final String VIA_CEP_ENDPOINT_SETTING_NAME = 'ViaCepEndpoint';

    private static String viaCepEndpoint {
        get {
            if (String.isBlank(viaCepEndpoint)) {
                viaCepEndpoint = getEndpoint();
            }
            return viaCepEndpoint;
        }
        private set;
    }

    private static String getEndpoint(){
        return SettingService.getSetting(VIA_CEP_ENDPOINT_SETTING_NAME).Value__c;
    }

    public static ViaCepResponseDTO getCEPData(String cep){
        ViaCepResponseDTO cepResponse = new ViaCepResponseDTO();

        try{
            HttpRequest req = new HttpRequest();
            req.setEndpoint(String.format(viaCepEndpoint, new List<String>{cep}));
            req.setMethod('GET');
            req.setHeader('Accept', '*/*');
            HTTPResponse res = new Http().send(req);

            if(res.getStatusCode() == 200){
                cepResponse = ViaCepResponseDTO.parse(res.getBody());
            }else if(res.getStatusCode() == 400) {
                //when the status code is 400 it means that we tried to get a response with the wrong number of cep digits
                //todo: throw custom error message
            }
        }catch(Exception e){
            throw e;
        }

        return cepResponse;
    }

    private class ViaCepConnectorException extends Exception{}
}