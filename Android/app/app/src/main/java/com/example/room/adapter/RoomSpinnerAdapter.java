package com.example.room.adapter;

import android.content.Context;
import android.graphics.Color;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import androidx.annotation.NonNull;

import com.example.room.object.Room;

public class RoomSpinnerAdapter extends ArrayAdapter<Room> {

    private Context context;
    private Room[] values;

    public RoomSpinnerAdapter(@NonNull Context context, int textViewResourceId, Room[] values) {
        super(context, textViewResourceId, values);
    }

    @Override
    public int getCount(){
        return values.length;
    }

    @Override
    public Room getItem(int position){
        return values[position];
    }

    @Override
    public long getItemId(int position){
        return position;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        TextView label = (TextView) super.getView(position, convertView, parent);
        label.setTextColor(Color.BLACK);
        //label.setText(values[position].getName());

        return label;
    }

    @Override
    public View getDropDownView(int position, View convertView, ViewGroup parent) {
        TextView label = (TextView) super.getDropDownView(position, convertView, parent);
        label.setTextColor(Color.BLACK);
        //label.setText(values[position].getName());

        return label;
    }
}
