public inherited sharing class GetCepInfo {

    @InvocableMethod(Label='Get Address' Description='Get the address information based on the CEP provided.')
    public static List<ViaCepResponse> getCepInfo(List<GetCepInfoRequest> requests) {
        List<ViaCepResponse> results = new List<ViaCepResponse>();

        try{
            for (GetCepInfoRequest request : requests) {
                results.add(ViaCepConnector.getCEPData(request.cep));
            }
        }catch (Exception e){
            throw e;
        }

        return results;
    }

    public inherited sharing class GetCepInfoRequest{
        @InvocableVariable(Required=true)
        public String cep;
    }
}