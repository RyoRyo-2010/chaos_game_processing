int[] x_list;
int[] y_list;
int now_length;
final int point_length = 10000; //変えると楽しい
final float hi = 0.6; // 0 < hi < 1、変えると楽しい

final int[] first_x = {300,0  ,600}; //最初の形の頂点
final int[] first_y = {0  ,519,519}; //同じ

void setup() {
  size(800,800);
  x_list = new int[point_length];
  y_list = new int[point_length];
  now_length = 0;
  fill(#1879ED);
  noStroke();
  translate(100,100); //注意
  
  fill(#ff0000);
  for(int i = 0;i < first_x.length;i++) {
    x_list[i] = first_x[i];
    y_list[i] = first_y[i];
    big_point(x_list[i],y_list[i]);
  }
  
  x_list[first_x.length] = int(random(0,x_list[first_x.length-1]));
  y_list[first_x.length] = int(random(0,y_list[first_x.length-1]));
  
  fill(#1879ED);
  now_length = first_x.length+1;
  
}

void draw() {
  translate(100,100); //注意
  for(int i =0;i<100;i++) {
    int rand = int(random(3));
    int rand2 = now_length-1;
    //ランダムに選んだ2点a,bができた
    int new_x = int((10*hi*x_list[rand] + 10*x_list[rand2])/(10*hi + 10));
    int new_y = int((10*hi*y_list[rand] + 10*y_list[rand2])/(10*hi + 10));
    x_list[now_length] = new_x;
    y_list[now_length] = new_y;
    big_point(new_x,new_y);
    now_length++;
    if(point_length <= now_length) {
      noLoop();
      textSize(45);
      text("Done!",0,45);
      break;
    }
  }
}

void big_point(int x,int y) {
  int point_size = 4;
  ellipse(x,y,point_size,point_size);
}
