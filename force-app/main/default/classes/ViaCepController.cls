public inherited sharing class ViaCepController {

    @AuraEnabled
    public static ViaCepResponse getCepInfo(String cep){
        return new ViaCepResponse();
    }
}