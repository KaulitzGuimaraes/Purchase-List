#include<stdio.h>
#include<stdbool.h>
#include<stdlib.h>
#include<math.h>
#define MAX_ITEMS 10 // constant that defines the max items that can be purchased.
#define NUMBER_OF_ITEMS_AV 3 // constant that define the total number o items available to be purchased.

//Global variables

int size; // Indicates the current amount purchase items
int purchase_items[MAX_ITEMS]; // save all items purchase by its respective number. Eg : purchase_items[0] = 1. Means the Coke item was purchased.
char** items;// Array with name of items, each array position has an name stored. 0 - Cookies, 1 - Coke, 2 - Carrots


/*

    This function receives an integer as parameter, that represents an  item in the array of items, then it will access this item to get his name and print it.

    Eg :

    item = 0;

    items[0] = Cookies

    Print output : Cookies,
*/
void print_items(int item){


    printf("%s, ",items[item] );

}
/*
    This function calls the function print items  for each item purchased and stored in the purchased item array.

    Eg.

    i = 0;

    purchased_item[0] = 1;

    print_items(1);
*/
void print_all_items(){
    printf("\n\n Final purchase list :  ");
    for (int i =0; i<size;i++){
         print_items(purchase_items[i]);
    }
}

/*
This function receive the value of item to be purchased. If this value is bigger than 2 means that the user wants to stop to purchase items, so the function returns false. If the user chose a value smaller
than two, this value will be stored in the purchase list. Also an item was stored in the array, its size needs to be updated.
*/
bool save_item(int item){

  if(!(item > 2)){
    purchase_items[size] = item;
      size++;
      return true;
  }
  return false;

}

/*
This function shows to user all items available to be purchased and ask him to choose one or press a number bigger than 2 to stop the purchase.
After the user insert a number, the value is send to save_item function, that returns a boolean that stops or continue the loop,
it means that if the value is smaller than 2 the loop will continue, otherwise the loop will stops.
*/
void ask_for_items(){

  printf("Choose an Item or press an number bigger than 2 for finish purchase\n");

  int item;
  do{

    for(int i =0; i<NUMBER_OF_ITEMS_AV;i++){
     printf("%i - %s. \n",i,items[i] );


  }
  printf("Choose a number : ");
     scanf("%d",&item);
} while(save_item(item));

}
/*
In the main the items' array will be allocated in the memory.
Each position in the array will store the name of the item.
The function ask_for_items will be call and after it finish
the function print_all_items  will be call.
*/
int main(){
    items = malloc(NUMBER_OF_ITEMS_AV * sizeof(char*));

    items[0] = "Cookies";
    items[1] = "Coke";
    items[2] = "Carrots";
    ask_for_items();
    print_all_items();
    return 0;
}
