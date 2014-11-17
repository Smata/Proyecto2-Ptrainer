package com.example.silvia.ptrainer;

import android.util.Log;
import android.view.View.OnClickListener;
import android.view.View;
import android.widget.AdapterView.OnItemClickListener;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;

import android.view.Menu;
import android.view.MenuItem;
import android.view.inputmethod.InputMethodManager;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;

import com.google.api.client.googleapis.GoogleHeaders;
import com.google.api.client.googleapis.json.JsonCParser;
import com.google.api.client.http.GenericUrl;
import com.google.api.client.http.HttpRequest;
import com.google.api.client.http.HttpRequestFactory;
import com.google.api.client.http.HttpRequestInitializer;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson.JacksonFactory;
import com.google.api.client.util.Key;


import java.io.IOException;
import java.util.List;


public class YouTubeActivity extends Activity {

   private TextView videoIdTextView=null;
   private Button viewVideoButton;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_you_tube);

        Button btnSearch =(Button)findViewById(R.id.btnSearch);

        btnSearch.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                EditText etQueryText = (EditText)findViewById(R.id.etQueryText);

                String queryText = etQueryText.getText().toString();
                InputMethodManager imm = (InputMethodManager)getSystemService(Context.INPUT_METHOD_SERVICE);
                imm.hideSoftInputFromWindow(etQueryText.getWindowToken(), 0);

                HttpTransport transport = new NetHttpTransport();
                GenericUrl url = new GenericUrl("https://gdata.youtube.com/feeds/api/videos?alt=jsonc&max-results=2&q=" + queryText);

                final JsonFactory jsonFactory = new JacksonFactory();
                HttpRequestFactory factory = transport.createRequestFactory(new HttpRequestInitializer() {
                    @Override
                    public void initialize(HttpRequest request) {
                        JsonCParser parser = new JsonCParser();
                        parser.jsonFactory = jsonFactory;
                        request.addParser(parser);

                        GoogleHeaders headers = new GoogleHeaders();
                        headers.setApplicationName("PTrainer/1.0");
                        headers.gdataVersion = "2";
                        request.headers = headers;
                    }
                });

                try {
                    HttpRequest request = factory.buildGetRequest(url);
                    final VideoFeed feed = request.execute().parseAs(VideoFeed.class);
                    ListView videoList = (ListView)findViewById(R.id.lstVideo);
                    ArrayAdapter<Video> adpList = new ArrayAdapter<Video>(getApplicationContext(),android.R.layout.simple_list_item_1,feed.items);
                    videoList.setAdapter(adpList);

                    videoList.setOnItemClickListener(new OnItemClickListener() {
                        @Override
                        public void onItemClick(AdapterView<?> arg0,
                                                View arg1, int position, long arg3) {
                            Video item = feed.items.get(position);
                            startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(item.player.mobile)));
                        }
                    });
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        });
    }

    public static class VideoFeed {
        @Key List<Video> items;
    }

    public static class Video {
        @Key String title;
        @Key Player player;

        public String toString(){
            return this.title;
        }
    }

    public static class Player {
        @Key String mobile;
    }




    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.you_tube, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();
        if (id == R.id.action_settings) {
            return true;
        }
        return super.onOptionsItemSelected(item);
    }
}
