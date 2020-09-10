package utils;

import org.json.JSONArray;
import org.json.JSONException;

import java.util.Random;

public class NumberRandom {

    public static int getNumberObjectJson(String jsonString) throws JSONException {
        JSONArray json = new JSONArray(jsonString);
        Random random = new Random(json.length());
        return random.nextInt();
    }
}
