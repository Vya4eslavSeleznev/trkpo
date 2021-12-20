package com.example.room.ui.home;

import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.ViewModel;

public class HomeViewModel extends ViewModel {

    private MutableLiveData<String> mText;

    public HomeViewModel() {
        mText = new MutableLiveData<>();
        mText.setValue("Welcome to the music studio! Our company has been operating since 1994. " +
                "Such stars as Alla Pugacheva, Philip Kirkorov and many others worked with us. " +
                "Order your music room as soon as possible!");
    }

    public LiveData<String> getText() {
        return mText;
    }
}