
extern int Nbars_of_day=2;
extern string note1="H1-H9 Setting";
extern color color1=Green;
extern int width1=2;
extern int style1=0;
extern string note2="H10-H18 Setting";
extern color color2=LightGreen;
extern int width2=2;
extern int style2=0;
extern string note3="L1-L9 Setting";
extern color color3=Pink;
extern int width3=2;
extern int style3=0;
extern string note4="L10-L18 Setting";
extern color color4=Red;
extern int width4=2;
extern int style4=0;
extern string note5="Rectangel Color";
extern color Rec_color1=Orange;
extern color Rec_color2=Blue;
extern string note6="Comment Setting";
extern int corner=0;
extern string note7="Column 1";
extern int xdis1=10;
extern int ydis1=10;
extern int font_size1=10;
extern string font_type1="Arial";
extern color font_color1=Maroon;
extern string note8="Column 2";
extern int xdis2=70;
extern int ydis2=10;
extern int font_size2=10;
extern string font_type2="Arial";
extern color font_color2=Blue;
extern string note9="Price Label Setting";
extern bool show_price_Label=true;
extern int size=1;
extern string x_dis_LL="05:00";
extern string x_dis_HL="23:55";


double  HL1,HL2,HL3,HL4,HL5,HL6,HL7,HL8,HL9,HL[30];
double LL[30],LL10,LL11,LL12,LL13,LL14,LL15,LL16,LL17,LL18;
double rang1,rang2,rang3,rang4,rang5,rang6,rang7,rang8,rang9;
double high,low;
int Signal = -1;
//+------------------------------------------------------------------+
//| Amro function                                                   |
//+------------------------------------------------------------------+
int Amro()
  {
static int day=0;

if(TimeDay(Time[0])!=day)
{
  Print("NewDay");day=TimeDay(Time[0]);
  deletobject();
  Signal=-1;
}else{
  return 0;
}
int   i, counted_bars=300;
//----
int Nbars=Nbars_of_day*1440/Period()-1;
double gn1=1.618033989;
double gn2=0.618033989;
double dig=1;
int limit;
//----
//if (counted_bars<0) return(-1);
//if (counted_bars>0) counted_bars--;
limit=Nbars-1;
if(counted_bars>=1) limit=Nbars-counted_bars-1;
if (limit<0) limit=0;

for (i=limit;i>=0;i--)   
 {
//--------
    int barD1=iBarShift(Symbol(),PERIOD_D1,Time[i],false);
    high=NormalizeDouble(iHigh(NULL,PERIOD_D1,barD1+1),Digits)/Point;
    low=NormalizeDouble(iLow(NULL,PERIOD_D1,barD1+1),Digits)/Point;
    if(Digits==2||Digits==4){ high=high*10; low=low*10; dig=10;}
     //double range=NormalizeDouble(high-low,Digits);
     double range=high-low;
     double golden_range=(MathSqrt(range+(range*gn2)))*10;
     rang1=golden_range*gn1;
     rang2=golden_range*(gn1+1);
     rang3=golden_range*(gn1+2);
     rang4=golden_range*(gn1+3);
     rang5=golden_range*(gn1+4);
     rang6=golden_range*(gn1+5);
     rang7=golden_range*(gn1+6);
     rang8=golden_range*(gn1+7);
     rang9=golden_range*(gn1+8);
     //--HL---
     HL1 = high + rang1;
     HL2 = high + rang2;
     HL3 = high + rang3;
     HL4 = high + rang4;
     HL5 = high + rang5;
     HL6 = high + rang6;
     HL7 = high + rang7;
     HL8 = high + rang8;
     HL9 = high + rang9;
     HL[10] = high - rang1;      
     HL[11] = high - rang2;
     HL[12] = high - rang3;
     HL[13] = high - rang4;
     HL[14] = high - rang5;
     HL[15] = high - rang6;
     HL[16] = high - rang7;
     HL[17] = high - rang8;
     HL[18] = high - rang9;
     //--LL---
     LL[1] = low + rang1;
     LL[2] = low + rang2;
     LL[3] = low + rang3;
     LL[4] = low + rang4;
     LL[5] = low + rang5;
     LL[6] = low + rang6;
     LL[7] = low + rang7;
     LL[8] = low + rang8;
     LL[9] = low + rang9;
     LL10 = low - rang1;
     LL11 = low - rang2;
     LL12 = low - rang3;
     LL13 = low - rang4;
     LL14 = low - rang5;
     LL15 = low - rang6;
     LL16 = low - rang7;
     LL17 = low - rang8;
     LL18 = low - rang9;


    Tline("HL10"+" "+TimeToStr(Time[i],TIME_DATE),i,NormalizeDouble(HL[10]*Point/dig,Digits),width2,color2,style2,"= "+DoubleToStr(NormalizeDouble(HL[10]*Point/dig,Digits),Digits)+"\n Megnatic Area = "+DoubleToStr(LL[1]/dig-HL[10]/dig,0)+" Pips");
    Tline("HL11"+" "+TimeToStr(Time[i],TIME_DATE),i,NormalizeDouble(HL[11]*Point/dig,Digits),width2,color2,style2,"= "+DoubleToStr(NormalizeDouble(HL[11]*Point/dig,Digits),Digits));
        Tline("HL12"+" "+TimeToStr(Time[i],TIME_DATE),i,NormalizeDouble(HL[12]*Point/dig,Digits),width2,color2,style2,"= "+DoubleToStr(NormalizeDouble(HL[12]*Point/dig,Digits),Digits));
        Tline("HL13"+" "+TimeToStr(Time[i],TIME_DATE),i,NormalizeDouble(HL[13]*Point/dig,Digits),width2,color2,style2,"= "+DoubleToStr(NormalizeDouble(HL[13]*Point/dig,Digits),Digits));
       Tline("LL1"+" "+TimeToStr(Time[i],TIME_DATE),i,NormalizeDouble(LL[1]*Point/dig,Digits),width3,color3,style3,"= "+DoubleToStr(NormalizeDouble(LL[1]*Point/dig,Digits),Digits)+"\n Megnatic Area = "+DoubleToStr(LL[1]/dig-HL[10]/dig,0)+" Pips");
        Tline("LL2"+" "+TimeToStr(Time[i],TIME_DATE),i,NormalizeDouble(LL[2]*Point/dig,Digits),width3,color3,style3,"= "+DoubleToStr(NormalizeDouble(LL[2]*Point/dig,Digits),Digits));
        Tline("LL3"+" "+TimeToStr(Time[i],TIME_DATE),i,NormalizeDouble(LL[3]*Point/dig,Digits),width3,color3,style3,"= "+DoubleToStr(NormalizeDouble(LL[3]*Point/dig,Digits),Digits));
        Tline("LL4"+" "+TimeToStr(Time[i],TIME_DATE),i,NormalizeDouble(LL[4]*Point/dig,Digits),width3,color3,style3,"= "+DoubleToStr(NormalizeDouble(LL[4]*Point/dig,Digits),Digits));
        Tline("LL5"+" "+TimeToStr(Time[i],TIME_DATE),i,NormalizeDouble(LL[5]*Point/dig,Digits),width3,color3,style3,"= "+DoubleToStr(NormalizeDouble(LL[5]*Point/dig,Digits),Digits));
       if(HL[10]<LL[1])
        {
        Rec("Megnatic Area"+" "+TimeToStr(Time[i],TIME_DATE),i,HL[10]*Point/dig,LL[1]*Point/dig,1,Rec_color1,0);
        }else
        {
         Rec("Megnatic Area"+" "+TimeToStr(Time[i],TIME_DATE),i,HL[10]*Point/dig,LL[1]*Point/dig,1,Rec_color2,0);
        }

     for (int ii = 10;ii<19;ii++){
      HL[ii] = NormalizeDouble(HL[ii]*Point/dig,Digits);
     }
    for (int ii = 1;ii<10;ii++){
    LL[ii] = NormalizeDouble(LL[ii]*Point/dig,Digits);
     }
     LL[0] = HL[10];
     HL[9] = LL[1];
    Print("Status : H10  ", HL[10] , " LL[1] ", LL[1]      ); 
    //Comment( "Status : H10  ", HL[10] , " LL[1] ", LL[1]    );
    if(Bid > LL[1]){
      Signal = OP_BUY;
    }else if (Bid < HL[10]){
      Signal = OP_SELL;
    }
  }

   return 0;
 }



//-------------------------ObjectDelete----------------------------------------------------
int deletobject()
{
//----
  int i;  

for (i=2;i>=0;i--)   
 {
   ObjectDelete("HL1"+" "+TimeToStr(Time[i],TIME_DATE));
   ObjectDelete("HL2"+" "+TimeToStr(Time[i],TIME_DATE));
   ObjectDelete("HL3"+" "+TimeToStr(Time[i],TIME_DATE));
   ObjectDelete("HL4"+" "+TimeToStr(Time[i],TIME_DATE));
   ObjectDelete("HL5"+" "+TimeToStr(Time[i],TIME_DATE));
   ObjectDelete("HL6"+" "+TimeToStr(Time[i],TIME_DATE));
   ObjectDelete("HL7"+" "+TimeToStr(Time[i],TIME_DATE));
   ObjectDelete("HL8"+" "+TimeToStr(Time[i],TIME_DATE));
   ObjectDelete("HL9"+" "+TimeToStr(Time[i],TIME_DATE));
   ObjectDelete("HL10"+" "+TimeToStr(Time[i],TIME_DATE));
   ObjectDelete("HL11"+" "+TimeToStr(Time[i],TIME_DATE));
   ObjectDelete("HL12"+" "+TimeToStr(Time[i],TIME_DATE));
   ObjectDelete("HL13"+" "+TimeToStr(Time[i],TIME_DATE));
   ObjectDelete("HL14"+" "+TimeToStr(Time[i],TIME_DATE));
   ObjectDelete("HL15"+" "+TimeToStr(Time[i],TIME_DATE));
   ObjectDelete("HL16"+" "+TimeToStr(Time[i],TIME_DATE));
   ObjectDelete("HL17"+" "+TimeToStr(Time[i],TIME_DATE));
   ObjectDelete("HL18"+" "+TimeToStr(Time[i],TIME_DATE));
   
   ObjectDelete("LL1"+" "+TimeToStr(Time[i],TIME_DATE));
   ObjectDelete("LL2"+" "+TimeToStr(Time[i],TIME_DATE));
   ObjectDelete("LL3"+" "+TimeToStr(Time[i],TIME_DATE));
   ObjectDelete("LL4"+" "+TimeToStr(Time[i],TIME_DATE));
   ObjectDelete("LL5"+" "+TimeToStr(Time[i],TIME_DATE));
   ObjectDelete("LL6"+" "+TimeToStr(Time[i],TIME_DATE));
   ObjectDelete("LL7"+" "+TimeToStr(Time[i],TIME_DATE));
   ObjectDelete("LL8"+" "+TimeToStr(Time[i],TIME_DATE));
   ObjectDelete("LL9"+" "+TimeToStr(Time[i],TIME_DATE));
   ObjectDelete("LL10"+" "+TimeToStr(Time[i],TIME_DATE));
   ObjectDelete("LL11"+" "+TimeToStr(Time[i],TIME_DATE));
   ObjectDelete("LL12"+" "+TimeToStr(Time[i],TIME_DATE));
   ObjectDelete("LL13"+" "+TimeToStr(Time[i],TIME_DATE));
   ObjectDelete("LL14"+" "+TimeToStr(Time[i],TIME_DATE));
   ObjectDelete("LL15"+" "+TimeToStr(Time[i],TIME_DATE));
   ObjectDelete("LL16"+" "+TimeToStr(Time[i],TIME_DATE));
   ObjectDelete("LL17"+" "+TimeToStr(Time[i],TIME_DATE));
   ObjectDelete("LL18"+" "+TimeToStr(Time[i],TIME_DATE));
   
ObjectDelete("Megnatic Area"+" "+TimeToStr(Time[i],TIME_DATE));

 }
 ObjectDelete("Range1");
 ObjectDelete("Range12");
 ObjectDelete("Range2");
 ObjectDelete("Range22");
 ObjectDelete("Range3");
 ObjectDelete("Range32");
 ObjectDelete("Range4");
 ObjectDelete("Range42");
 ObjectDelete("Range5");
 ObjectDelete("Range52");
 ObjectDelete("Range6");
 ObjectDelete("Range62");
 ObjectDelete("Range7");
 ObjectDelete("Range72");
 ObjectDelete("Range8");
 ObjectDelete("Range82");
 ObjectDelete("===");
 ObjectDelete("Pw_High");
 ObjectDelete("Pw_Low");
 ObjectDelete("Pw_Open");
 ObjectDelete("Pw_Highh");
 ObjectDelete("Pw_Loww");
 ObjectDelete("Pw_Openn");
 
 if(show_price_Label==true)
 {
 ObjectDelete("price_LL1");
 ObjectDelete("price_LL2");
 ObjectDelete("price_LL3");
 ObjectDelete("price_LL4");
 ObjectDelete("price_LL5");
 ObjectDelete("price_LL6");
 ObjectDelete("price_LL7");
 ObjectDelete("price_LL8");
 ObjectDelete("price_LL9");
 ObjectDelete("price_LL10");
 ObjectDelete("price_LL11");
 ObjectDelete("price_LL12");
 ObjectDelete("price_LL13");
 ObjectDelete("price_LL14");
 ObjectDelete("price_LL15");
 ObjectDelete("price_LL16");
 ObjectDelete("price_LL17");
 ObjectDelete("price_LL18");
 
 ObjectDelete("price_HL1");
 ObjectDelete("price_HL2");
 ObjectDelete("price_HL3");
 ObjectDelete("price_HL4");
 ObjectDelete("price_HL5");
 ObjectDelete("price_HL6");
 ObjectDelete("price_HL7");
 ObjectDelete("price_HL8");
 ObjectDelete("price_HL9");
 ObjectDelete("price_HL10");
 ObjectDelete("price_HL11");
 ObjectDelete("price_HL12");
 ObjectDelete("price_HL13");
 ObjectDelete("price_HL14");
 ObjectDelete("price_HL15");
 ObjectDelete("price_HL16");
 ObjectDelete("price_HL17");
 ObjectDelete("price_HL18");
}
 
return(0);
}

//+------------------------Trend Drawing------------------------------------------+
void Tline(string name,int i,double p1,int width11,color color11,int style11,string des)
{

   ObjectCreate(name,OBJ_TREND,0,0,0,0,0);
   ObjectSet(name,OBJPROP_PRICE1,p1);
   ObjectSet(name,OBJPROP_TIME1,StrToTime(TimeToStr(Time[i],TIME_DATE)+" "+"00:00"));
   ObjectSet(name,OBJPROP_PRICE2,p1);
   ObjectSet(name,OBJPROP_TIME2,StrToTime(TimeToStr(Time[i],TIME_DATE)+" "+"23:00"));
   if(i>0)ObjectSet(name,OBJPROP_RAY,false);
   else
 ObjectSet(name,OBJPROP_RAY,true);
   ObjectSet(name,OBJPROP_COLOR,color11);
   ObjectSet(name,OBJPROP_WIDTH,width11);
   ObjectSet(name,OBJPROP_STYLE,style11);
   ObjectSet(name,OBJPROP_BACK,true);
   string sObjDesc = StringConcatenate("",des);  
   ObjectSetText(name, sObjDesc,10,"Times New Roman",Black);

}
//-----------------------------------------------------------------------------------------
//--------------------------Draw Lable-----------------------------------------------------
void drawL(string name,int disx,int disy,string txt,int size_font,string type_font,color color11,int corner1)
{
 ObjectCreate(name,OBJ_LABEL,0,0,0,0);
 ObjectSet(name,OBJPROP_XDISTANCE,disx);
 ObjectSet(name,OBJPROP_YDISTANCE,disy);
 ObjectSetText(name,txt,size_font,type_font,color11);
ObjectSet(name,OBJPROP_CORNER,corner1);
}

//-----------------------------------------------------------------------------------------
//---------------------------Draw Rec-----------------------------------------
void Rec(string name,int i,double p1,double p2,int width11,color color11,int style11)
{
   ObjectCreate(name,OBJ_RECTANGLE,0,0,0,0,0);
   ObjectSet(name,OBJPROP_PRICE1,p1);
   ObjectSet(name,OBJPROP_TIME1,StrToTime(TimeToStr(Time[i],TIME_DATE)+" "+"00:00"));
   ObjectSet(name,OBJPROP_PRICE2,p2);
   ObjectSet(name,OBJPROP_TIME2,StrToTime(TimeToStr(Time[i],TIME_DATE)+" "+"23:00"));

   ObjectSet(name,OBJPROP_COLOR,color11);
   ObjectSet(name,OBJPROP_WIDTH,width11);
   ObjectSet(name,OBJPROP_STYLE,style11);
   ObjectSet("aa",OBJPROP_SCALE,0);

}
