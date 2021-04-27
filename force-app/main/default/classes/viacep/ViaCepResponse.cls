public inherited sharing class ViaCepResponse {

    @AuraEnabled @InvocableVariable
    public String cep;
    @AuraEnabled @InvocableVariable
    public String logradouro;
    @AuraEnabled @InvocableVariable
    public String complemento;
    @AuraEnabled @InvocableVariable
    public String bairro;
    @AuraEnabled @InvocableVariable
    public String localidade;
    @AuraEnabled @InvocableVariable
    public String uf;
    @AuraEnabled @InvocableVariable
    public String ibge;
    @AuraEnabled @InvocableVariable
    public String gia;
    @AuraEnabled @InvocableVariable
    public String ddd;
    @AuraEnabled @InvocableVariable
    public String siafi;
    @AuraEnabled @InvocableVariable
    public Boolean erro;

    public static ViaCepResponse parse(String json) {
        return (ViaCepResponse) System.JSON.deserialize(json, ViaCepResponse.class);
    }
}