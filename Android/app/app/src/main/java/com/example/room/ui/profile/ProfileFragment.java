package com.example.room.ui.profile;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.lifecycle.ViewModelProvider;

import com.example.room.R;
import com.example.room.activity.AuthenticationActivity;
import com.example.room.activity.ReservationActivity;
import com.example.room.databinding.FragmentProfileBinding;
import com.example.room.db.Schema;
import com.example.room.gateways.Gateway;
import com.example.room.model.Customer;

public class ProfileFragment extends Fragment {

    private ProfileViewModel dashboardViewModel;
    private FragmentProfileBinding binding;
    private TextView nameTextView;
    private TextView phoneTextView;
    private Schema schema;
    private Context context;
    private Button refreshButton;

    public View onCreateView(@NonNull LayoutInflater inflater,
                             ViewGroup container, Bundle savedInstanceState) {
        context = getActivity();

        dashboardViewModel =
                new ViewModelProvider(this).get(ProfileViewModel.class);

        binding = FragmentProfileBinding.inflate(inflater, container, false);
        View root = binding.getRoot();

        Button myRoomsButton = root.findViewById(R.id.my_rooms_button);

        myRoomsButton.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                Intent intent = new Intent(getActivity(), ReservationActivity.class);
                startActivity(intent);
            }
        });

        nameTextView = root.findViewById(R.id.editName);
        phoneTextView = root.findViewById(R.id.editPhone);
        refreshButton = root.findViewById(R.id.refresh_button);

        Gateway gateway = new Gateway();
        SharedPreferences preferences = getActivity().getSharedPreferences("myPrefs", Context.MODE_PRIVATE);

        String token = preferences.getString("token", null);
        int userId = preferences.getInt("userId", 0);

        Customer customer = gateway.getCustomer(token, userId);

        nameTextView.setText(customer.getName());
        phoneTextView.setText(customer.getPhone());


        refreshButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                if(!nameTextView.getText().toString().matches("") ||
                   !phoneTextView.getText().toString().matches("") ||
                   (nameTextView.getText().toString().matches("") &&
                   phoneTextView.getText().toString().matches("")))
                {
                    gateway.updateCustomer(token, customer.getId(), nameTextView.getText().toString(),
                            phoneTextView.getText().toString());

                    Toast.makeText(context, "Updated successfully!", Toast.LENGTH_SHORT).show();

                } else {
                    Toast.makeText(context, "Empty field", Toast.LENGTH_SHORT).show();
                }
            }
        });

        return root;
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
        binding = null;
    }
}