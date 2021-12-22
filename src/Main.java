import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class Main {

	public static void main(String[] args) {
		JSONArray list = new JSONArray();

		JSONObject obj = new JSONObject();
		String msg;

		msg = "1";
		obj.put("msg", msg);
		list.add(obj);
		System.out.println(list);
	}

}
