#include <stdio.h>

#define spam foo_spam
#define eggs foo_eggs
#  include "foo.h"
#undef spam
#undef eggs

#define spam bar_spam
#define eggs bar_eggs
#  include "bar.h"
#undef spam
#undef eggs

int main()
{
    const int    new_bar_spam = 3;
    const double new_bar_eggs = 5.0f;

    printf("foo: spam = %d, eggs = %f\n", foo_spam(), foo_eggs() );
    printf("bar: old spam = %d, new spam = %d ; old eggs = %f, new eggs = %f\n", 
           bar_spam(new_bar_spam), new_bar_spam, 
           bar_eggs(new_bar_eggs), new_bar_eggs );

    return 0;
}
