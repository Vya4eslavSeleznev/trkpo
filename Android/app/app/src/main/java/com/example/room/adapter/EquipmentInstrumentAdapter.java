package com.example.room.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.LinearLayout;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.example.room.R;

import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;

public class EquipmentInstrumentAdapter extends RecyclerView.Adapter<EquipmentInstrumentAdapter.ViewHolder>{

    private Context context;
    private ArrayList instrumentName, instrumentDescription;
    private Animation translateAnim;

    public EquipmentInstrumentAdapter(Context context, ArrayList instrumentName, ArrayList instrumentDescription) {
        this.context = context;
        this.instrumentName = instrumentName;
        this.instrumentDescription = instrumentDescription;
    }

    @NonNull
    @NotNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull @NotNull ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(context);
        View view = inflater.inflate(R.layout.instrument_row, parent, false);

        return new EquipmentInstrumentAdapter.ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull @NotNull ViewHolder holder, int position) {
        holder.instrumentNameTxt.setText(String.valueOf(instrumentName.get(position)));
        holder.instrumentDescriptionTxt.setText(String.valueOf(instrumentDescription.get(position)));
    }

    @Override
    public int getItemCount() {
        return instrumentName.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder {

        private TextView instrumentNameTxt, instrumentDescriptionTxt;
        private LinearLayout mainLayout;

        public ViewHolder(@NonNull @NotNull View itemView) {
            super(itemView);

            instrumentNameTxt = itemView.findViewById(R.id.equipment_instrument_name_textView);
            instrumentDescriptionTxt = itemView.findViewById(R.id.equipment_instrument_description_textView);
            mainLayout = itemView.findViewById(R.id.instrument_equipment_layout);
            translateAnim = AnimationUtils.loadAnimation(context, R.anim.translate_anim);
            mainLayout.setAnimation(translateAnim);
        }
    }
}
