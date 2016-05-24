#define TABLE_SIZE 26
#define UNSET -1

int SYMBOL_TABLE[TABLE_SIZE];

int lookup(int symbol_num);
void set(int symbol_num, int value);
void reset_table();

typedef struct {
  int value;
  int symbol_num;
  int op;
  Expr *left;
  Expr *right;
} Expr;

Expr *Expr_new(int value, int symbol_num, int op, Expr *left, Expr *right) {
  struct Expr *e = malloc(sizeof(struct Expr));

}
