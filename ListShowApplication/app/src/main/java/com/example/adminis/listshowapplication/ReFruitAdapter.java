package com.example.adminis.listshowapplication;

import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.List;

/**
 * Created by Adminis on 2017/1/2.
 */

public class ReFruitAdapter extends RecyclerView.Adapter<ReFruitAdapter.ViewHolder> {

    private List<Fruit> mFruitList;

    //内部类
    static class ViewHolder extends  RecyclerView.ViewHolder{
        View fruitView;
        ImageView fruitImage;
        TextView fruitName;
        //构造函数等到子项的最外层布局 item
        public ViewHolder(View itemView) {
            super(itemView);
            fruitView = itemView;
            fruitImage = (ImageView) itemView.findViewById(R.id.fruit_image);
            fruitName = (TextView) itemView.findViewById(R.id.fruit_name);
        }
    }
    //传入数据
    public ReFruitAdapter(List<Fruit> fruitList){
        mFruitList = fruitList;
    }

    /**
     * 创建ViewHolder实例
     * @param parent
     * @param viewType
     * @return
     */
    @Override
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        //加载进来的布局传入到ViewHolder的构造函数中
        View view = LayoutInflater.from(parent.getContext()).inflate(
                R.layout.fruit_item,parent,false);
         final ViewHolder viewHolder = new ViewHolder(view);
        //点击事件,需要由具体的view去注册
         viewHolder.fruitView.setOnClickListener(new View.OnClickListener() {
             @Override
             public void onClick(View v) {
                 int position = viewHolder.getAdapterPosition();
                 Fruit fruit = mFruitList.get(position);
                 Toast.makeText(v.getContext(),"you clicked view"+fruit.getNanme(),Toast.LENGTH_SHORT).show();
             }
         });
        viewHolder.fruitImage.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                int position = viewHolder.getAdapterPosition();
                Fruit fruit = mFruitList.get(position);
                Toast.makeText(v.getContext(),"you clicked image"+fruit.getNanme(),Toast.LENGTH_SHORT).show();
            }
        });
        return viewHolder;
    }

    /**
     * 对RecyclerView子项的数据进行赋值(会在每个子项被滚到屏幕内的时候执行)
     * @param holder
     * @param position
     */
    @Override
    public void onBindViewHolder(ViewHolder holder, int position) {
        //通过pssition得到当前项,然后赋值
        Fruit fruit = mFruitList.get(position);
        holder.fruitImage.setImageResource(fruit.getImageId());
        holder.fruitName.setText(fruit.getNanme());
    }

    /**
     * RecyclerView一共有多少个子项
     * @return
     */
    @Override
    public int getItemCount() {
        return mFruitList.size();
    }
}
