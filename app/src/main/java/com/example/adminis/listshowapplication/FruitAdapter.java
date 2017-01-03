package com.example.adminis.listshowapplication;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.List;

/**
 * Created by Adminis on 2016/12/31.
 */

public class FruitAdapter extends ArrayAdapter<Fruit> {

    private int resourceId;
    public FruitAdapter(Context context,  int textViewResourceId, List<Fruit> objects) {
        super(context, textViewResourceId, objects);
        resourceId = textViewResourceId;
    }

    /**
     * 做了两个优化,一个是加载布局的优化,一个是缓存控件的优化
     * @param position
     * @param convertView
     * @param parent
     * @return
     */
    @NonNull
    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        Fruit fruit = getItem(position);    //得到当前项的Fruit
        View view;
        ViewHolder viewHolder;
        //convertView用于将之前加载好的布局做缓存,这样就可以不用每次都去重新加载布局
        if(convertView == null){
            view = LayoutInflater.from(getContext()).inflate(resourceId,parent,false);
            viewHolder = new ViewHolder();
            viewHolder.fruitImage = (ImageView) view.findViewById(R.id.fruit_image);
            viewHolder.fruitName = (TextView) view.findViewById(R.id.fruit_name);
            view.setTag(viewHolder);    //将viewHolder存储在View中
        }else {
            view = convertView;
            viewHolder = (ViewHolder) view.getTag();//重新获取
        }
      /*  ImageView fruitImage = (ImageView) view.findViewById(R.id.fruit_image);
        TextView fruitName = (TextView) view.findViewById(R.id.fruit_name);
        fruitImage.setImageResource(fruit.getImageId());
        fruitName.setText(fruit.getNanme());*/
        viewHolder.fruitImage.setImageResource(fruit.getImageId());
        viewHolder.fruitName.setText(fruit.getNanme());
        return view;
    }
    //新建一个内部类,用于对控件进行缓存
    class ViewHolder  {
        ImageView fruitImage;
        TextView fruitName;
    }
}
