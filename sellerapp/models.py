from django.db import models
from customerapp.models import CustomerModel
# from sellerapp.models import SellerModel

# Create your models here.
class SellerModel(models.Model):
    seller_id=models.AutoField(primary_key=True)
    seller_fullname=models.CharField(help_text='seller_fullname',max_length=100)
    seller_email=models.EmailField(help_text='seller_email',max_length=100)
    seller_password=models.CharField(help_text='seller_password',max_length=200)
    seller_contact=models.CharField(help_text='seller_contact',max_length=10)
    seller_photo=models.ImageField(upload_to='sellerprofilephoto/',null=True)
    seller_aadhar_photo=models.ImageField(upload_to='aadharphoto/',null=True)
    seller_gst_photo=models.ImageField(upload_to='gstphoto/',null=True)
    seller_status=models.CharField(default='pending',max_length=10)
    
    class Meta:
        db_table='sellers_details'



class ProductModel(models.Model):
    product_id=models.AutoField(primary_key=True)
    product_creator=models.ForeignKey(SellerModel,on_delete=models.CASCADE,related_name='seller_products',null=True)
    product_name=models.CharField(help_text='product_name',max_length=200)
    product_model=models.CharField(help_text='product_model',max_length=200)
    product_brand=models.CharField(help_text='product_brand',max_length=200)
    product_category=models.CharField(help_text='product_category',max_length=200)
    product_original_price=models.IntegerField(help_text='product_original_price',null=True)
    product_discount_price=models.IntegerField(help_text='product_discount_price',null=True)
    product_discount_percentage=models.CharField(help_text='product_discount_percentage',max_length=50,null=True)
    product_photo1=models.ImageField(upload_to='images/',null=True)
    product_photo2=models.ImageField(upload_to='images/',null=True)
    product_photo3=models.ImageField(upload_to='images/',null=True)
    product_photo4=models.ImageField(upload_to='images/',null=True)
    product_photo5=models.ImageField(upload_to='images/',null=True)
    product_review=models.TextField(max_length=800,null=True)
    product_about=models.CharField(help_text='product_about',max_length=5000,null=True)
    product_wishlist_action=models.ManyToManyField(CustomerModel,related_name="my_wishlist")
    
    class Meta:
        db_table='products_details'



