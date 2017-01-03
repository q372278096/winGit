package com.example.adminis.listshowapplication;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {

    private Button list_Btn,recycler_Btn;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        list_Btn = (Button) findViewById(R.id.list_Btn);
        list_Btn.setOnClickListener(this);
        recycler_Btn = (Button) findViewById(R.id.recycler_Btn);
        recycler_Btn.setOnClickListener(this);

    }


    @Override
    public void onClick(View v) {
        Intent intent ;
        switch (v.getId()){
            case R.id.list_Btn:
                intent = new Intent(MainActivity.this,ListViewShow.class);
                startActivity(intent);
                break;
            case R.id.recycler_Btn:
                intent = new Intent(MainActivity.this,RecyclerViewShow.class);
                startActivity(intent);
                break;
            default:
                break;
        }
    }
}
