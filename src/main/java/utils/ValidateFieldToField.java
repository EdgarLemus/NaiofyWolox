package utils;

public class ValidateFieldToField {

    public static void validateJsonFieldToField(String jsonString) throws Exception {
        String messageEmail = "";
        String messageFirstName = "";
        String messageLastName = "";
        String json = jsonString.replace("}","").replace("{","");
        if(json.split(",")[0].split(":")[1].split("@")[1].replace("\"","").contains("wolox.com.ar")){

        }else
        {
            messageEmail = "ERROR el campo email no cumple con las condiciones indicadas. No cumple con el cuerpo <String>@wolox.com.ar";
            System.out.println(json.split(",")[0].split(":")[1].split("@")[1]);
        }
        for (int i = 1; i < json.split(",")[2].split(":")[1].length()-1; i++){
            if(json.split(",")[2].split(":")[1].contains(String.valueOf(i))){
                messageFirstName = "ERROR el campo firstName contiene Integer";
                System.out.println(json.split(",")[2].split(":")[1]);
            }
        }
        for (int i = 1; i < json.split(",")[3].split(":")[1].length()-1; i++){
            if(json.split(",")[2].split(":")[1].contains(String.valueOf(i))){
                messageLastName = "ERROR el campo lastName contiene Integer";
            }
        }
        if (messageEmail.length() > 2){
            throw new Exception(messageEmail + "\n" + messageFirstName + "\n" + messageLastName);
        }
        if (messageFirstName.length() > 2){
            throw new Exception(messageEmail + "\n" + messageFirstName + "\n" + messageLastName);
        }
        if (messageLastName.length() > 2){
            throw new Exception(messageEmail + "\n" + messageFirstName + "\n" + messageLastName);
        }

    }

    public static void main(String[] args) throws Exception {
        validateJsonFieldToField("{\n" +
                "\"email\": \"jpterwetz@wolox.com.ar\",\n" +
                "\"password\": \"candidatoWolox2020\",\n" +
                "\"firstName\": \"Juan\",\n" +
                "\"lastName\": \"Perez\"\n" +
                "}");
    }
}
