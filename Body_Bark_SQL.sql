-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/t73FZf
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Product_List" (
    "sku" varchar   NOT NULL,
    "descripton" varchar   NOT NULL,
    "product_num" int   NOT NULL,
    "product_color" varchar   NOT NULL,
    "product_size" varchar   NOT NULL,
    CONSTRAINT "pk_Product_List" PRIMARY KEY (
        "sku"
     )
);

CREATE TABLE "Boutiques" (
    "boutique_id" int   NOT NULL,
    "boutique_name" varchar   NOT NULL,
    "street_address" varchar   NOT NULL,
    "city" varchar   NOT NULL,
    "state" varchar   NOT NULL,
    "zip" varchar   NOT NULL,
    CONSTRAINT "pk_Boutiques" PRIMARY KEY (
        "boutique_id"
     )
);

CREATE TABLE "Top_Boutiques" (
    "boutique_id" int   NOT NULL,
    "boutique_name" varchar   NOT NULL,
    "ranking" int   NOT NULL,
    CONSTRAINT "pk_Top_Boutiques" PRIMARY KEY (
        "boutique_id"
     )
);

CREATE TABLE "Internet_Customers" (
    "customer_id" int   NOT NULL,
    "city" varchar   NOT NULL,
    "state" varchar   NOT NULL,
    "zip" varchar   NOT NULL,
    CONSTRAINT "pk_Internet_Customers" PRIMARY KEY (
        "customer_id"
     )
);

CREATE TABLE "Internet_Order" (
    "order_id" int   NOT NULL,
    "customer_id" int   NOT NULL,
    "order_date" date   NOT NULL,
    "month" int   NOT NULL,
    "order_status" varchar   NOT NULL,
    "sub_total" money   NOT NULL,
    "order_total" money   NOT NULL,
    "total_quantity" int   NOT NULL,
    "coupon" boolean   NOT NULL,
    CONSTRAINT "pk_Internet_Order" PRIMARY KEY (
        "order_id"
     )
);

CREATE TABLE "Ordered_Items" (
    "order_id" int   NOT NULL,
    "total_each_sku" int   NOT NULL,
    "sku" varchar   NOT NULL,
    "product_unit_price" money   NOT NULL,
    CONSTRAINT "pk_Ordered_Items" PRIMARY KEY (
        "order_id","sku"
     )
);

ALTER TABLE "Boutiques" ADD CONSTRAINT "fk_Boutiques_boutique_id" FOREIGN KEY("boutique_id")
REFERENCES "Top_Boutiques" ("boutique_id");

ALTER TABLE "Internet_Order" ADD CONSTRAINT "fk_Internet_Order_customer_id" FOREIGN KEY("customer_id")
REFERENCES "Internet_Customers" ("customer_id");

ALTER TABLE "Ordered_Items" ADD CONSTRAINT "fk_Ordered_Items_order_id" FOREIGN KEY("order_id")
REFERENCES "Internet_Order" ("order_id");

ALTER TABLE "Ordered_Items" ADD CONSTRAINT "fk_Ordered_Items_sku" FOREIGN KEY("sku")
REFERENCES "Product_List" ("sku");
