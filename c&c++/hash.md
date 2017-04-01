#task one
使用哈希表存星星信息

    //.c 是c语言的源程序
    //.cpp是c++语言的源程序
    //c++兼容c语言的绝大部分语法特性。
    //c语言没有bool数据类型，但是c++有
    #define bool int   
    #define false 0
    #define true 1
    #define prime 999983  // 10n内最大的素数（本题n=10W）
    struct 
    {
        int length[6];  //星星的长度
    }star[100001];
    typedef struct hashtable
    {
        int length[6];   //记录星星的长度信息
        struct hashtable * next;  //用于冲突时开放寻址
    }hashtable;
    hashtable* hashstar[prime+1];
    /*计算第k个星星的关键字hashcode*/
    int calculate_hashcode(int k)
    {
    //取余法计算出哈希码
    }
    /*从顺时针方向判断两片星星是否相同*/
    bool is_same_clockwise(hashtable* p,int k)
    {
        for(int j=0;j<6;j++)  //顺时针转动j格
        {
            bool flag=true;
            for(int i=0;i<6;i++)
                if(star[k].length[i] != p->length[(i+j)%6])
                {
                    flag=false;
                    break;
                }
                if(flag)
                return true;
        }
        return false;
    }
    /*从逆时针方向判断两片星星是否相同*/
    bool is_same_counter_clockwise(hashtable* p,int k)
    {
    //根据顺时针来编写逆时针代码
    }
    /*把第k个星星信息插入hashtable*/
    bool insert(int k)
    {
        int hashcode=calculate_hashcode(k);
        if(!hashstar[hashcode])
        {
            hashtable* temp= (hashtable*)malloc(sizeof(hashtable)) ;
            //c++ 申请空间的方式：Hashtable* temp=new Hashtable
        
            for( int i=0;i<6;i++)
                temp->length[i]=star[k].length[i];
            hashstar[hashcode]=temp;  //保存hashcode对应的地址
        }
        else  //地址冲突,开放寻址,顺便比较
        {
            hashtable* temp=hashstar[hashcode];
            if(is_same_clockwise(temp,k) || is_same_counter_clockwise(temp,k))  //检查星星是否相同
                return true;
            while(temp->next)    //寻址
            {
                temp=temp->next;
                if(is_same_clockwise(temp,k) || is_same_counter_clockwise(temp,k))  //检查星星是否相同
                    return true;
            }
            temp->next=(hashtable*)malloc(sizeof(hashtable));    //申请空间，保存新星星信息
            //c++ 申请空间的方式：temp->next=new Hashtable;  
            for( i=0;i<6;i++)
                temp->next->length[i]=star[k].length[i];
        }
        return false;
    }
    void main()
    {
        int inputnumber;  //输入星星的数量
        while(scanf("%d",&inputnumber))
        {
            /*Input*/
            bool flag=false;  //记录输入过程中是否出现了相同的星星
            for(int i=1;i<=inputnumber;i++)
            {
                for(int j=0;j<6;j++)
                    scanf("%d",&star[i].length[j]);
                
                /*hashstar*/
                if(!flag)    //当前还没有出现相同的星星
                    flag=insert(i);
                             //若出现相同的星星，则还需后续输入，但不再处理
            }
            /*Output*/
            if(flag)
                
            else
                printf();
                //cout<<”“<<endl;
        }
    }
