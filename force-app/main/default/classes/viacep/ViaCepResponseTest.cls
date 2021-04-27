@IsTest
private class ViaCepResponseTest {
    @IsTest
    static void testParse() {
        String json = '{'+
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

        ViaCepResponse obj = ViaCepResponse.parse(json);
        System.assert(obj != null, 'Returned object is not null.');
        System.assertEquals('01001-000', obj.cep, 'The CEP should be the same.');
    }
}