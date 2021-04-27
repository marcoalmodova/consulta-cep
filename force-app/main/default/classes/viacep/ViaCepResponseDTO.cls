public inherited sharing class ViaCepResponseDTO {

    public String cep;
    public String logradouro;
    public String complemento;
    public String bairro;
    public String localidade;
    public String uf;
    public String ibge;
    public String gia;
    public String ddd;
    public String siafi;
    public Boolean erro;

    public static ViaCepResponseDTO parse(String json) {
        return (ViaCepResponseDTO) System.JSON.deserialize(json, ViaCepResponseDTO.class);
    }
}