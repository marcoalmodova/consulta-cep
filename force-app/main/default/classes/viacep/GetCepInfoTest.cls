@IsTest
private class GetCepInfoTest {
    @IsTest
    static void testGetCepInfo() {
        Test.setMock(HttpCalloutMock.class, new ViaCepConnectorTest.ViaCepCalloutsMock(false));

        Test.startTest();
        GetCepInfo.GetCepInfoRequest request = new GetCepInfo.GetCepInfoRequest();
        request.cep = '01001000';
        List<ViaCepResponse> cepResponses = GetCepInfo.GetCepInfo(new List<GetCepInfo.GetCepInfoRequest>{request});
        Test.stopTest();

        System.assertEquals('3550308', cepResponses[0].ibge, 'IBGE code should be the same.');
    }
}