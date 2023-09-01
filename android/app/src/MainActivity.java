import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;
import com.your_package_name.BluetoothPlugin; // Import your plugin

public class MainActivity extends FlutterActivity {

    @Override
    public void configureFlutterEngine(FlutterEngine flutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        BluetoothPlugin.registerWith(flutterEngine); // Register your plugin here
    }
}
