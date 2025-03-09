CREATE TABLE `OrderProduct` (
	`id`	int	NOT NULL,
	`order_id`	int	NOT NULL,
	`product_size_stock_id`	int	NOT NULL,
	`count`	VARCHAR(255)	NULL,
	`unit_price_at_order`	decimal(15,2)	NULL
);

CREATE TABLE `Payment` (
	`payment_id`	int	NOT NULL,
	`paid_at`	dateline	NULL,
	`order_id`	int	NOT NULL,
	`pay_status_id`	int	NOT NULL,
	`payment_method_id`	int	NOT NULL
);

CREATE TABLE `DetailCategory` (
	`id`	int	NOT NULL,
	`name`	varchar(100)	NULL,
	`sub_id`	int	NOT NULL
);

CREATE TABLE `PaymentMethod` (
	`id`	int	NOT NULL,
	`name`	varchar(100)	NULL
);

CREATE TABLE `PriceFilterValue` (
	`id`	int	NOT NULL,
	`min_value`	decimal(15,2)	NULL,
	`max_value`	decimal(15,2)	NULL,
	`priority`	int	NULL
);

CREATE TABLE `UserGrade` (
	`grade_id`	int	NOT NULL,
	`name`	varchar(100)	NULL
);

CREATE TABLE `Product` (
	`code`	varchar(100)	NOT NULL,
	`name`	varchar(255)	NULL,
	`price`	decimal(15,2)	NULL,
	`registered_at`	datetime	NULL,
	`is_visible`	boolean	NULL,
	`color_code`	varchar(100)	NOT NULL,
	`model_id`	varchar(100)	NOT NULL
);

CREATE TABLE `FilterValue` (
	`id`	int	NOT NULL,
	`filter_type_id`	int	NOT NULL,
	`ref_id`	int	NULL
);

CREATE TABLE `DeliveryInfo` (
	`id`	int	NOT NULL,
	`name`	varchar(100)	NULL,
	`address`	varchar(100)	NULL,
	`phone_number`	varchar(100)	NULL,
	`deliver_start_at`	datetime	NULL,
	`deliver_end_at`	datetime	NULL,
	`deliver_pay`	decimal(15,2)	NULL,
	`delivery_status_id`	int	NOT NULL
);

CREATE TABLE `FilterType` (
	`id`	int	NOT NULL,
	`name`	varchar(100)	NULL
);

CREATE TABLE `Order` (
	`order_id`	int	NOT NULL,
	`total_amount`	decimal(15,2)	NULL,
	`ordered_at`	datetime	NULL,
	`delivery_info_id`	int	NOT NULL
);

CREATE TABLE `CategoryFilterValue` (
	`id`	int	NOT NULL,
	`filter_value_id`	int	NOT NULL,
	`categtory_id`	int	NOT NULL
);

CREATE TABLE `Member` (
	`id`	int	NOT NULL,
	`user_id`	VARCHAR(255)	NULL,
	`password`	VARCHAR(255)	NULL,
	`deposit`	VARCHAR(255)	NULL,
	`point`	VARCHAR(255)	NULL,
	`grade_id`	int	NOT NULL
);

CREATE TABLE `ProductImage` (
	`id`	int	NOT NULL,
	`url`	varchar(2048)	NULL,
	`product_code`	varchar(100)	NOT NULL,
	`priority`	int	NULL
);

CREATE TABLE `OrderList` (
	`id`	int	NOT NULL,
	`order_id`	varchar(100)	NOT NULL,
	`customer_id`	int	NOT NULL
);

CREATE TABLE `SizeFilterValue` (
	`id`	int	NOT NULL,
	`value`	varchar(255)	NULL,
	`priority`	int	NULL
);

CREATE TABLE `ProductSizeStock` (
	`id`	int	NOT NULL,
	`quantity`	int	NULL,
	`sales_count`	int	NULL,
	`product_code`	varchar(100)	NOT NULL,
	`size_filter_value_id`	int	NOT NULL
);

CREATE TABLE `Model` (
	`code`	varchar(100)	NOT NULL,
	`name`	varchar(255)	NULL
);

CREATE TABLE `Customer` (
	`id`	int	NOT NULL,
	`name`	varchar(100)	NULL,
	`Field`	varchar(13)	NULL,
	`Field2`	varchar(255)	NULL,
	`member_id`	int	NOT NULL
);

CREATE TABLE `MainCategory` (
	`id`	int	NOT NULL,
	`name`	varchar(100)	NULL
);

CREATE TABLE `ColorFilterValue` (
	`id`	int	NOT NULL,
	`name`	varchar(100)	NULL,
	`priority`	int	NULL
);

CREATE TABLE `PayStatus` (
	`pay_status_id`	int	NOT NULL,
	`status`	varchar(100)	NULL
);

CREATE TABLE `Color` (
	`code`	varchar(100)	NOT NULL,
	`name`	varchar(255)	NULL,
	`color_filter_value_id`	int	NOT NULL,
	`priority`	int	NULL
);

CREATE TABLE `ProductDetail` (
	`id`	int	NOT NULL,
	`content`	text	NULL,
	`product_code`	varchar(100)	NOT NULL
);

CREATE TABLE `CategoryModel` (
	`id`	int	NOT NULL,
	`category_id`	int	NOT NULL,
	`model_code`	varchar(100)	NOT NULL
);

CREATE TABLE `SubCategory` (
	`id`	int	NOT NULL,
	`name`	varchar(100)	NULL,
	`main_id`	int	NOT NULL
);

CREATE TABLE `deliveryStatus` (
	`delivery_status_id`	int	NOT NULL,
	`status`	varchar(100)	NULL
);

ALTER TABLE `OrderProduct` ADD CONSTRAINT `PK_ORDERPRODUCT` PRIMARY KEY (
	`id`
);

ALTER TABLE `Payment` ADD CONSTRAINT `PK_PAYMENT` PRIMARY KEY (
	`payment_id`
);

ALTER TABLE `DetailCategory` ADD CONSTRAINT `PK_DETAILCATEGORY` PRIMARY KEY (
	`id`
);

ALTER TABLE `PaymentMethod` ADD CONSTRAINT `PK_PAYMENTMETHOD` PRIMARY KEY (
	`id`
);

ALTER TABLE `PriceFilterValue` ADD CONSTRAINT `PK_PRICEFILTERVALUE` PRIMARY KEY (
	`id`
);

ALTER TABLE `UserGrade` ADD CONSTRAINT `PK_USERGRADE` PRIMARY KEY (
	`grade_id`
);

ALTER TABLE `Product` ADD CONSTRAINT `PK_PRODUCT` PRIMARY KEY (
	`code`
);

ALTER TABLE `FilterValue` ADD CONSTRAINT `PK_FILTERVALUE` PRIMARY KEY (
	`id`
);

ALTER TABLE `DeliveryInfo` ADD CONSTRAINT `PK_DELIVERYINFO` PRIMARY KEY (
	`id`
);

ALTER TABLE `FilterType` ADD CONSTRAINT `PK_FILTERTYPE` PRIMARY KEY (
	`id`
);

ALTER TABLE `Order` ADD CONSTRAINT `PK_ORDER` PRIMARY KEY (
	`order_id`
);

ALTER TABLE `CategoryFilterValue` ADD CONSTRAINT `PK_CATEGORYFILTERVALUE` PRIMARY KEY (
	`id`
);

ALTER TABLE `Member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`id`
);

ALTER TABLE `ProductImage` ADD CONSTRAINT `PK_PRODUCTIMAGE` PRIMARY KEY (
	`id`
);

ALTER TABLE `OrderList` ADD CONSTRAINT `PK_ORDERLIST` PRIMARY KEY (
	`id`,
	`order_id`,
	`customer_id`
);

ALTER TABLE `SizeFilterValue` ADD CONSTRAINT `PK_SIZEFILTERVALUE` PRIMARY KEY (
	`id`
);

ALTER TABLE `ProductSizeStock` ADD CONSTRAINT `PK_PRODUCTSIZESTOCK` PRIMARY KEY (
	`id`
);

ALTER TABLE `Model` ADD CONSTRAINT `PK_MODEL` PRIMARY KEY (
	`code`
);

ALTER TABLE `Customer` ADD CONSTRAINT `PK_CUSTOMER` PRIMARY KEY (
	`id`
);

ALTER TABLE `MainCategory` ADD CONSTRAINT `PK_MAINCATEGORY` PRIMARY KEY (
	`id`
);

ALTER TABLE `ColorFilterValue` ADD CONSTRAINT `PK_COLORFILTERVALUE` PRIMARY KEY (
	`id`
);

ALTER TABLE `PayStatus` ADD CONSTRAINT `PK_PAYSTATUS` PRIMARY KEY (
	`pay_status_id`
);

ALTER TABLE `Color` ADD CONSTRAINT `PK_COLOR` PRIMARY KEY (
	`code`
);

ALTER TABLE `ProductDetail` ADD CONSTRAINT `PK_PRODUCTDETAIL` PRIMARY KEY (
	`id`
);

ALTER TABLE `CategoryModel` ADD CONSTRAINT `PK_CATEGORYMODEL` PRIMARY KEY (
	`id`
);

ALTER TABLE `SubCategory` ADD CONSTRAINT `PK_SUBCATEGORY` PRIMARY KEY (
	`id`
);

ALTER TABLE `deliveryStatus` ADD CONSTRAINT `PK_DELIVERYSTATUS` PRIMARY KEY (
	`delivery_status_id`
);

ALTER TABLE `OrderProduct` ADD CONSTRAINT `FK_Order_TO_OrderProduct_1` FOREIGN KEY (
	`order_id`
)
REFERENCES `Order` (
	`order_id`
);

ALTER TABLE `OrderProduct` ADD CONSTRAINT `FK_ProductSizeStock_TO_OrderProduct_1` FOREIGN KEY (
	`product_size_stock_id`
)
REFERENCES `ProductSizeStock` (
	`id`
);

ALTER TABLE `Payment` ADD CONSTRAINT `FK_Order_TO_Payment_1` FOREIGN KEY (
	`order_id`
)
REFERENCES `Order` (
	`order_id`
);

ALTER TABLE `Payment` ADD CONSTRAINT `FK_PayStatus_TO_Payment_1` FOREIGN KEY (
	`pay_status_id`
)
REFERENCES `PayStatus` (
	`pay_status_id`
);

ALTER TABLE `Payment` ADD CONSTRAINT `FK_PaymentMethod_TO_Payment_1` FOREIGN KEY (
	`payment_method_id`
)
REFERENCES `PaymentMethod` (
	`id`
);

ALTER TABLE `DetailCategory` ADD CONSTRAINT `FK_SubCategory_TO_DetailCategory_1` FOREIGN KEY (
	`sub_id`
)
REFERENCES `SubCategory` (
	`id`
);

ALTER TABLE `Product` ADD CONSTRAINT `FK_Color_TO_Product_1` FOREIGN KEY (
	`color_code`
)
REFERENCES `Color` (
	`code`
);

ALTER TABLE `Product` ADD CONSTRAINT `FK_Model_TO_Product_1` FOREIGN KEY (
	`model_id`
)
REFERENCES `Model` (
	`code`
);

ALTER TABLE `FilterValue` ADD CONSTRAINT `FK_FilterType_TO_FilterValue_1` FOREIGN KEY (
	`filter_type_id`
)
REFERENCES `FilterType` (
	`id`
);

ALTER TABLE `DeliveryInfo` ADD CONSTRAINT `FK_deliveryStatus_TO_DeliveryInfo_1` FOREIGN KEY (
	`delivery_status_id`
)
REFERENCES `deliveryStatus` (
	`delivery_status_id`
);

ALTER TABLE `Order` ADD CONSTRAINT `FK_DeliveryInfo_TO_Order_1` FOREIGN KEY (
	`delivery_info_id`
)
REFERENCES `DeliveryInfo` (
	`id`
);

ALTER TABLE `CategoryFilterValue` ADD CONSTRAINT `FK_FilterValue_TO_CategoryFilterValue_1` FOREIGN KEY (
	`filter_value_id`
)
REFERENCES `FilterValue` (
	`id`
);

ALTER TABLE `CategoryFilterValue` ADD CONSTRAINT `FK_DetailCategory_TO_CategoryFilterValue_1` FOREIGN KEY (
	`categtory_id`
)
REFERENCES `DetailCategory` (
	`id`
);

ALTER TABLE `Member` ADD CONSTRAINT `FK_UserGrade_TO_Member_1` FOREIGN KEY (
	`grade_id`
)
REFERENCES `UserGrade` (
	`grade_id`
);

ALTER TABLE `ProductImage` ADD CONSTRAINT `FK_Product_TO_ProductImage_1` FOREIGN KEY (
	`product_code`
)
REFERENCES `Product` (
	`code`
);

ALTER TABLE `OrderList` ADD CONSTRAINT `FK_Order_TO_OrderList_1` FOREIGN KEY (
	`order_id`
)
REFERENCES `Order` (
	`order_id`
);

ALTER TABLE `OrderList` ADD CONSTRAINT `FK_Customer_TO_OrderList_1` FOREIGN KEY (
	`customer_id`
)
REFERENCES `Customer` (
	`id`
);

ALTER TABLE `ProductSizeStock` ADD CONSTRAINT `FK_Product_TO_ProductSizeStock_1` FOREIGN KEY (
	`product_code`
)
REFERENCES `Product` (
	`code`
);

ALTER TABLE `ProductSizeStock` ADD CONSTRAINT `FK_SizeFilterValue_TO_ProductSizeStock_1` FOREIGN KEY (
	`size_filter_value_id`
)
REFERENCES `SizeFilterValue` (
	`id`
);

ALTER TABLE `Customer` ADD CONSTRAINT `FK_Member_TO_Customer_1` FOREIGN KEY (
	`member_id`
)
REFERENCES `Member` (
	`id`
);

ALTER TABLE `Color` ADD CONSTRAINT `FK_ColorFilterValue_TO_Color_1` FOREIGN KEY (
	`color_filter_value_id`
)
REFERENCES `ColorFilterValue` (
	`id`
);

ALTER TABLE `ProductDetail` ADD CONSTRAINT `FK_Product_TO_ProductDetail_1` FOREIGN KEY (
	`product_code`
)
REFERENCES `Product` (
	`code`
);

ALTER TABLE `CategoryModel` ADD CONSTRAINT `FK_DetailCategory_TO_CategoryModel_1` FOREIGN KEY (
	`category_id`
)
REFERENCES `DetailCategory` (
	`id`
);

ALTER TABLE `CategoryModel` ADD CONSTRAINT `FK_Model_TO_CategoryModel_1` FOREIGN KEY (
	`model_code`
)
REFERENCES `Model` (
	`code`
);

ALTER TABLE `SubCategory` ADD CONSTRAINT `FK_MainCategory_TO_SubCategory_1` FOREIGN KEY (
	`main_id`
)
REFERENCES `MainCategory` (
	`id`
);

