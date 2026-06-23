from distutils.command import upload
from enum import auto
from django.db import models


# from django.contrib import messages



#  Create your models here.
class CustomerModel(models.Model):
    customer_id=models.AutoField(primary_key=True)
    customer_fullname=models.CharField(help_text='customer_fullname',max_length=50)
    customer_contact=models.CharField(help_text='customer_contact',max_length=20)
    customer_email=models.EmailField(help_text='customer_email',max_length=50)
    customer_password=models.CharField(help_text='customer_password',max_length=50)
    customer_address=models.CharField(help_text='customer_address',max_length=200,null=True)
    customer_street=models.CharField(help_text='customer_street',max_length=50)
    customer_city=models.CharField(help_text='customer_city',max_length=50)
    customer_state=models.CharField(help_text='customer_state',max_length=50)
    customer_pincode=models.CharField(help_text='customer_pincode',max_length=10,null=True)
    customer_photo=models.ImageField(upload_to='images/',null=True)
    customer_status=models.CharField(default='pending',max_length=50)
   
    
    class Meta:
        db_table='customers_details'


from sellerapp.models import *
class CartModel(models.Model):
    cart_id=models.AutoField(primary_key=True)
    cart_owner=models.ForeignKey(CustomerModel,on_delete=models.CASCADE,related_name='cart_creator',null=True)
    cart_seller=models.ForeignKey(SellerModel,on_delete=models.CASCADE,related_name='cart_seller',null=True)
    cart_product=models.ForeignKey(ProductModel,on_delete=models.CASCADE,related_name='user_cart_items',null=True)
    cart_product_quantity=models.IntegerField(help_text='product_quantity',default=1,null=True)
    cart_product_price=models.IntegerField(help_text='product_price',null=True)

    class Meta:
        db_table='mycart_details'



from sellerapp.models import SellerModel
# from customerapp.models import OrderReviewModels
class OrderModels(models.Model):
    order_id=models.AutoField(primary_key=True)
    # order_unique_id=models.CharField(max_length=300,help_text='order_id',null=True)
    # order_payment_id=models.CharField(max_length=300,help_text='payment_id',null=True)
    order_customer=models.ForeignKey(CustomerModel,on_delete=models.CASCADE,related_name='customer_orders')
    order_product=models.ForeignKey(ProductModel,on_delete=models.CASCADE,null=True,related_name='customer_product_orders')
    order_product_price=models.IntegerField(help_text='order_product_price',null=True)
    order_product_quantity=models.IntegerField(help_text='order_product_quantity',null=True)
    order_product_amount=models.IntegerField(help_text='order_product_amount',null=True)
    order_product_seller=models.ForeignKey(SellerModel,on_delete=models.CASCADE,related_name='sellers_ordered_products',null=True)
    # final_review_=models.ForeignKey(OrderReviewModels,on_delete=models.CASCADE,related_name='sellers_ordered_products',null=True)
    order_date=models.DateTimeField(auto_now=True,help_text='order_date')
    # order_payment_status=models.CharField(max_length=300,help_text='payment_status',default='pending')
    order_status=models.CharField(max_length=300,help_text='order_status',default='pending')
    order_address=models.CharField(max_length=300,null=True)
    order_seller_status=models.CharField(max_length=300,help_text='order_seller_status',default='placed')
    ofeedback_block=models.CharField(max_length=200,null=True)
    osentiment_block=models.CharField(max_length=200,null=True)
    ouser_block=models.CharField(max_length=200,null=True)
    qr_photo=models.ImageField(upload_to='images/',null=True)


    class Meta:
        db_table='order_details'

class OrderReviewModels(models.Model):
    order_review_id=models.AutoField(primary_key=True)
    orderproduct_review=models.CharField(max_length=1000,help_text='orderproduct_review')
    order_rating=models.CharField(max_length=100,help_text='orderwise_rating',null=True)
    order_expression=models.CharField(max_length=100,help_text='orderwise_expression',null=True)
    osentiment=models.CharField(max_length=100,help_text='orderwise_sentiment',null=True)    
    customer_comments=models.ForeignKey(CustomerModel,on_delete=models.CASCADE,related_name='cwise_comments',null=True)
    product_comments=models.ForeignKey(ProductModel,on_delete=models.CASCADE,related_name='pwise_comments',null=True)
    seller_comments=models.ForeignKey(SellerModel,on_delete=models.CASCADE,related_name='swise_comments',null=True)
    order_produt_comments=models.ForeignKey(OrderModels,on_delete=models.CASCADE,related_name='opwise_comments',null=True)   
    
    class Meta:
        db_table='ordered_products_feedbacks'


        
class ProceedToFinalPaymentModel(models.Model):
    payment_id=models.AutoField(primary_key=True)
    payment_product_photo=models.CharField(max_length=300,null=True)
    payment_product_name=models.CharField(max_length=300,null=True)
    payment_product_quantity=models.CharField(max_length=300,null=True)
    payment_product_price=models.CharField(max_length=300,null=True)
    cust_id=models.ForeignKey(CustomerModel,on_delete=models.CASCADE,null=True)
    prod_id=models.ForeignKey(ProductModel,on_delete=models.CASCADE,null=True)
    sell_id=models.ForeignKey(SellerModel,on_delete=models.CASCADE,null=True)
    
    class Meta:
        db_table='proceed_to_final_order'




class FeedbackModel(models.Model):
    productwise_feedback_id=models.AutoField(primary_key=True)
    feedback_block=models.CharField(max_length=200,null=True)
    sentiment_block=models.CharField(max_length=200,null=True)
    user_block=models.CharField(max_length=200,null=True)


    feedback_order_id=models.ForeignKey(OrderModels,on_delete=models.CASCADE,related_name='product_orderid',null=True)
    # f_r_o=models.ForeignKey(OrderReviewModels,on_delete=models.CASCADE,related_name='product_orderid',null=True)
    after_order_placed_revire=models.ForeignKey(OrderReviewModels,on_delete=models.CASCADE,related_name='product_orderreview',null=True)
    productwise_feedback=models.CharField(max_length=1000,help_text='productwise_feedback',null=True)
    # ordwise_comments=models.CharField(max_length=100,help_text='orderwisecomments')
    # prodwise_rating=models.CharField(max_length=100,help_text='productwise_rating',null=True)
    # ordwise_rating=models.CharField(max_length=100,help_text='orderwiserating')
    prodwise_expression=models.CharField(max_length=100,help_text='productwise_expression')
    # ordwise_expression=models.CharField(max_length=100,help_text='orderwiseexpression')
    psentiment=models.CharField(max_length=100,help_text='productwise_sentiment',null=True)
    # ordwise_sentiment=models.CharField(max_length=100,help_text='orderwisesentiment')    

    custwise_comments=models.ForeignKey(CustomerModel,on_delete=models.CASCADE,related_name='customerwise_comments',null=True)
    prodwise_comments=models.ForeignKey(ProductModel,on_delete=models.CASCADE,related_name='productwise_comments',null=True)
    sellwise_comments=models.ForeignKey(SellerModel,on_delete=models.CASCADE,related_name='sellerwise_comments',null=True)
    # ord_prodwise_comments=models.ForeignKey(OrderModels,on_delete=models.CASCADE,related_name='orderproductwisecomments',null=True)   
    # prodwise_comments_date=models.DateField(max_length=100,help_text='productwisecommentsdate')
    # ord_prod_comments_date=models.DateField(max_length=100,help_text='orderproductcommentsdate')
    productreview_date=models.DateTimeField(auto_now=True,help_text='productreview_date')

   
    class Meta:
        db_table='products_feedbacks'

from sellerapp.models import ProductModel
class WishlistModel(models.Model):
    wishlist_id=models.AutoField(primary_key=True)
    product_wishlist=models.ForeignKey(ProductModel,on_delete=models.CASCADE,related_name='wishlist',null=True)

    class Meta:
        db_table='wishlist_details'

    
 