from turtle import xcor
from django.shortcuts import render,redirect,get_object_or_404
from django.contrib import messages
from sellerapp.models import *
from customerapp.models import *
from textblob import TextBlob
# from textblob.sentiments import NaiveBayesAnalyzer
from customerapp.BlockchainAlgo import HashDataBlock
from PIL import Image, ImageDraw
from io import BytesIO
from django.core.files import File
import qrcode
import math, random

# Create your views here.
def main_seller_register(request):
    if request.method=="POST" and request.FILES["photo"]:
        sellerid=request.POST.get("sellerid")
        fullname=request.POST.get("fullname")
        contact=request.POST.get("contact")
        email=request.POST.get("email")
        password=request.POST.get("password")
        aadharphoto=request.FILES["aadharphoto"]
        gstphoto=request.FILES["gstphoto"]
        photo=request.FILES["photo"]
        
        s2 = SellerModel.objects.create(seller_fullname=fullname,seller_email=email,seller_password=password,seller_gst_photo=gstphoto,seller_aadhar_photo=aadharphoto,seller_photo=photo,seller_id=sellerid,seller_contact=contact)
        if s2:
                messages.success(request,"successfully registered")
        else:
            messages.error(request,"Your form is not registered, please try again")
    return render(request,"main/main-seller-register.html")

def main_seller_login(request):
    if request.method == "POST":
        email=request.POST.get("email")
        password=request.POST.get("password")

        try:
            data2=SellerModel.objects.get(seller_email=email,seller_password=password)
            if data2.seller_status=="accepted":
                request.session['seller_id']=data2.seller_id
                messages.success(request,"Successfully Login")
                return redirect('sellers-home')
            else:
                messages.warning(request,"Account Activation pending")
                return redirect('main-seller-login')
        except:
            return redirect('main-seller-login')
        
    return render(request,"main/main-sellers-login.html")



# def seller_register(request):
#     if request.method == "POST" and request.FILES["photo"]:
#         sellerid=request.POST.get("sellerid")
#         fullname=request.POST.get("fullname")
#         email=request.POST.get("email")
#         password=request.POST.get("password")
#         contact=request.POST.get("contact")
#         state=request.POST.get("state")
#         city=request.POST.get("city")
#         pincode=request.POST.get("pincode")
#         flatno=request.POST.get("flatno")
#         address1=request.POST.get("address1")
#         address2=request.POST.get("address2")
#         dob=request.POST.get("dob")
#         registrationdate=request.POST.get("registrationdate")
#         photo=request.FILES["photo"]
#         aadharphoto=request.FILES["aadharphoto"]
#         gstphoto=request.FILES["gstphoto"]

#         s1 = SellerModel.objects.create(seller_flatno=flatno,seller_address1=address1,seller_address2=address2,seller_pincode=pincode,seller_id=sellerid,seller_fullname=fullname,seller_email=email,seller_password=password,seller_contact=contact,seller_state=state,seller_city=city,seller_dob=dob,seller_registration_date=registrationdate,seller_photo=photo,seller_aadharphoto=aadharphoto,seller_gst_photo=gstphoto)
#         s1.save()
#         if s1:
#             messages.success(request,"successfully registered")
#         else:
#             messages.error(request,"Your form is not registered, please try again")
#     return render(request,"main/main-seller-register.html")

# def seller_login(request):
#     if request.method == "POST":
#         email=request.POST.get("emaill")
#         password=request.POST.get("passwordd")
#         # print("sssss")

#         try:
#             # print("cccccc")
#             check=SellerRegisterModel.objects.get(seller_email=email,seller_password=password)
#             request.session['seller_id']=check.seller_id
#             # print("lllll")
#             if check.seller_status == 'accepted':
#                 messages.success(request,'Successfully Login')
#                 return redirect('customer-home')
#             elif check.seller_status == 'pending':
#                 messages.warning(request,'Your request is in pending, please wait for until acceptance')
#             elif check.seller_status == 'rejected':
#                 messages.error(request,'Your request is rejected, so you cannot login')
#         except:
#                 messages.warning(request,'invalid login')
    # return render(request,"main/main-sellers-login.html")

def sellers_home(request):
    user_id=request.session['seller_id']
    profile=SellerModel.objects.get(seller_id=user_id)    
    order1=OrderModels.objects.count()
    seller1=SellerModel.objects.filter(seller_status="accepted").count()
    seller2=SellerModel.objects.filter(seller_status="declined").count()
    mobile=ProductModel.objects.filter(product_category="MOBILE").count()
    phonecover=ProductModel.objects.filter(product_category="PHONE COVER").count()
    usbcable=ProductModel.objects.filter(product_category="USB CABLE").count()
    adapter=ProductModel.objects.filter(product_category="ADAPTER").count()
    watches=ProductModel.objects.filter(product_category="WATCHES").count()
    earphones=ProductModel.objects.filter(product_category="EAR PHONES").count()
    customer1=CustomerModel.objects.count()
    
    products=ProductModel.objects.count()

    oppo=ProductModel.objects.filter(product_brand='OPPO').count()
    oneplus=ProductModel.objects.filter(product_brand='ONEPLUS').count()
    redmi=ProductModel.objects.filter(product_brand='REDMi').count()
    apple=ProductModel.objects.filter(product_brand='APPLE').count()
    vivo=ProductModel.objects.filter(product_brand='VIVO').count()
    lg=ProductModel.objects.filter(product_brand='LG').count()
    samsung=ProductModel.objects.filter(product_brand='SAMSUNG').count()
    sony=ProductModel.objects.filter(product_brand='SONY').count()
    micromax=ProductModel.objects.filter(product_brand='MICROMAX').count()
    lava=ProductModel.objects.filter(product_brand='LAVA').count()

    fakereviews=FeedbackModel.objects.count()
    genuinereviews=OrderReviewModels.objects.count()



    return render(request,"sellers/sellers-home.html",{'profile':profile,
    'customer1':customer1,'seller1':seller1,'order1':order1,'products':products,
    'seller2':seller2,'mobile':mobile,'phonecover':phonecover,'fakereviews':fakereviews,'genuinereviews':genuinereviews,
    'oppo':oppo,'oneplus':oneplus,'apple':apple,'redmi':redmi,'vivo':vivo,
    'lg':lg,'samsung':samsung,'sony':sony,'micromax':micromax,'lava':lava,
    'usbcable':usbcable,'adapter':adapter,'watches':watches,'earphones':earphones})

    

def sellers_add_product(request):
    user_id=request.session['seller_id']
    profile=SellerModel.objects.get(seller_id=user_id)
    print(profile,'jhg')
    print(profile.seller_id)
    if request.method == "POST" and request.FILES["productphoto1"] and request.FILES["productphoto2"] and request.FILES["productphoto3"] and request.FILES["productphoto4"] and request.FILES["productphoto5"]:

        productid=request.POST.get("productid")
        productcreator=request.POST.get("productcreator")
        productname=request.POST.get("productname")
        productmodel=request.POST.get("productmodel")
        productbrand=request.POST.get("productbrand")
        productcategory=request.POST.get("productcategory")
        productoriginalprice=request.POST.get("productoriginalprice")
        productdiscountprice=request.POST.get("productdiscountprice")
        # productdescription=request.POST.get("productdescription")
        productabout=request.POST.get("productabout")
        productphoto1=request.FILES["productphoto1"]
        productphoto2=request.FILES["productphoto2"]
        productphoto3=request.FILES["productphoto3"]
        productphoto4=request.FILES["productphoto4"]
        productphoto5=request.FILES["productphoto5"]
        
        a=(int(productdiscountprice)/int(productoriginalprice))*100
        b=(round(a)-100)
        p1=ProductModel.objects.create(
        product_id=productid,product_name=productname,product_about=productabout,
        product_model=productmodel,product_brand=productbrand,
        product_category=productcategory, product_original_price=productoriginalprice,
        product_discount_price=productdiscountprice,product_discount_percentage=b,
        product_photo1=productphoto1,product_photo2=productphoto2,
        product_photo3=productphoto3,product_photo4=productphoto4,
        product_photo5=productphoto5,
        # product_description=productdescription,
        product_creator=profile)

        
        if p1:
                messages.success(request,"successfully Product Upload ")
        else:
            messages.error(request,"Product Not Uploaded, Please try again")

       
    return render(request,"sellers/sellers-add-product.html",{'profile':profile})

def sellers_product_edit(request,id):
    user_id=request.session['seller_id']
    profile=SellerModel.objects.get(seller_id=user_id)
    print(profile.seller_photo,'jhg')
    print(profile.seller_id)
    # s1=ProductDetailsModel.objects.get(product_creator=user_id,product_id=id)
    s1 = ProductModel.objects.filter(product_id=id)
    s2=get_object_or_404(ProductModel,product_id=id)
    if request.method == "POST":

        productid=request.POST.get("productid")
        productcreator=request.POST.get("productcreator")
        productname=request.POST.get("productname")
        productmodel=request.POST.get("productmodel")
        productbrand=request.POST.get("productbrand")
        productcategory=request.POST.get("productcategory")
        productoriginalprice=request.POST.get("productoriginalprice")
        productdiscountprice=request.POST.get("productdiscountprice")
        productdescription=request.POST.get("productdescription")
        productabout=request.POST.get("productabout")
        
        a=(int(productdiscountprice)/int(productoriginalprice))*100
        discount=str((round(a)-100))
        # s2=ProductDetailsModel.objects.update(
        # product_about=productabout,
        # product_original_price=productoriginalprice,
        # product_discount_price=productdiscountprice,product_discount_percentage=b,
        # product_photo1=productphoto1,product_photo2=productphoto2,
        # product_photo3=productphoto3,product_photo4=productphoto4,
        # product_photo5=productphoto5,product_description=productdescription,
        
        # )
        print(productdescription)
        if len(request.FILES) != 0:
            productphoto1=request.FILES["productphoto1"]
            productphoto2=request.FILES["productphoto2"]
            productphoto3=request.FILES["productphoto3"]
            productphoto4=request.FILES["productphoto4"]
            productphoto5=request.FILES["productphoto5"]
            s2.product_about = productabout
            s2.product_original_price=productoriginalprice
            s2.product_discount_price=productdiscountprice
            s2.product_discount_percentage=discount
            s2.product_photo1=productphoto1
            s2.product_photo2=productphoto2
            s2.product_photo3=productphoto3
            s2.product_photo4=productphoto4
            s2.product_photo5=productphoto5
            s2.save(update_fields=['product_about','product_original_price','product_discount_price','product_discount_percentage','product_photo1','product_photo2','product_photo3','product_photo4','product_photo5'])
            s2.save()
        else:
            s2.product_about = productabout
            s2.product_original_price=productoriginalprice
            s2.product_discount_price=productdiscountprice
            s2.product_discount_percentage=discount
            s2.save(update_fields=['product_about','product_original_price','product_discount_price','product_discount_percentage'])
            s2.save()
    return render(request,"sellers/sellers-product-edit.html",{'profile':profile,'s':s1})

def sellers_all_product(request):
    seller_id=request.session['seller_id']
    profile=SellerModel.objects.get(seller_id=seller_id)
    s1=ProductModel.objects.filter(product_creator=seller_id).all()
    print(s1)
    # shows complete data from product details models with user 

    return render(request,"sellers/sellers-all-product.html",{'s1':s1,'profile':profile})

def sellers_manage_product(request):
    user_id=request.session['seller_id']
    profile=SellerModel.objects.get(seller_id=user_id)
    print(profile.seller_photo,'jhg')
    print(profile.seller_id)
    # seller logout photo code

    return render(request,"sellers/sellers-manage-product.html",{'profile':profile})

def sellers_myprofile(request):
    user_id=request.session['seller_id']
    profile=SellerModel.objects.get(seller_id=user_id)
    print(profile.seller_photo,'jhg')
    print(profile.seller_id)
    # profile1=SellerModel.objects.filter(seller_id=user_id)    
    if request.method=="POST":
        fullname=request.POST.get("fullname")
        contact=request.POST.get("contact")
        email=request.POST.get("email")
        
        print(fullname,contact,email)
    
        profile.seller_fullname=fullname
        profile.seller_email=email
        profile.seller_contact=contact
        
        
        profile.save(update_fields=['seller_fullname','seller_email','seller_contact'])
        profile.save()

        if profile:
                messages.success(request,"Successfully Updated ")
        else:
            messages.error(request,"Seller Details Not edited, Please try again")


        return redirect('sellers-myprofile')


    return render(request,"sellers/sellers-myprofile.html",{'profile':profile,'i':profile})

def sellers_sentiment_analysis(request):
    user_id=request.session['seller_id']
    profile=SellerModel.objects.get(seller_id=user_id)
    print(profile.seller_photo,'jhg')
    print(profile.seller_id)

    return render(request,"sellers/sellers-sentiment-analysis.html",{'profile':profile})

def sellers_view_customers(request):
    user_id=request.session['seller_id']
    profile=SellerModel.objects.get(seller_id=user_id)
    print(profile.seller_photo,'jhg')
    print(profile.seller_id)

    x=CustomerModel.objects.all()

    # c1=ProceedToFinalPaymentModel.objects.filter('profile':profile)
    # print(c1)
    # customer details will be appeared

    return render(request,"sellers/sellers-view-customers.html",{'profile':profile,'x':x})

def sellers_view_feedback_orderwise(request):
    user_id=request.session['seller_id']
    profile=SellerModel.objects.get(seller_id=user_id)
    print(profile.seller_photo,'jhg')
    print(profile.seller_id)

    y=OrderReviewModels.objects.filter(seller_comments=profile)
    print(y,'fffffhhhhhhh')


    return render(request,"sellers/sellers-view-feedback-orderwise.html",{'profile':profile,'y':y})


def sellers_view_feedback_productwise(request):
    seller_id=request.session['seller_id']
    profile=SellerModel.objects.get(seller_id=seller_id)
    print(profile.seller_photo,'jhg')
    print(profile.seller_id)


    

    # p=ProductModel.objects.all()
    # c=CustomerModel.objects.all()
    # x=profile.sellers_ordered_products.all()
    # y=profile.sellerwisecomments.all()
    # a = FeedbackModel.objects.filter(sellwise_comments =profile)
    y=FeedbackModel.objects.filter(sellwise_comments=profile)
    print(y,'fffffhhhhhhh')

    # y=FeedbackModel.objects.filter(productwise_feedback=id1).filter(custwise_comments=id2)
    
    return render(request,"sellers/sellers-view-feedback-productwise.html",{'y':y,'profile':profile})

def sellers_view_order(request):

    # seller_id=request.session['seller_id']
    # order=SellerModel.objects.get(seller_id=seller_id)
    # p=ProductModel.objects.all()
    # x=order.sellers_ordered_products.all()
    seller_id=request.session['seller_id']
    profile=SellerModel.objects.get(seller_id=seller_id)

    print(seller_id,'jhg')
    print(profile.seller_id)


    # p=ProductModel.objects.all()
    # c=CustomerModel.objects.all()
    # x=profile.sellers_ordered_products.filter(order_seller_status="placed")
    x = OrderModels.objects.filter(order_product__product_creator=seller_id).filter(order_seller_status="placed").order_by('-order_id')
    # x=OrderModels.objects.all().order_by('-order_id')
    # y=OrderReviewModels.objects.filter(product_comments__product_creator=profile)

    return render(request,"sellers/sellers-view-order.html",{'x':x,'profile':profile}   )

def accept_order(req,id):
    verify = get_object_or_404(OrderModels,order_id=id)
    verify.order_seller_status = "order accepted"
    verify.save(update_fields=["order_seller_status"])
    verify.save()
    key = 'df6s4sd31fsd6f4sd156ef'
    intitalblock = HashDataBlock(key,[str(verify.order_product),str(verify.order_id)])
    second_block = HashDataBlock(intitalblock.block_hash,[str(verify.order_product_price),str(verify.order_product_quantity)])
    third_block = HashDataBlock(second_block.block_hash,[str(verify.order_product_amount)])

    ofeedback_block = intitalblock.block_hash
    print(verify.ofeedback_block,'match')
    print(ofeedback_block,'block')

    osentiment_block = second_block.block_hash
    print(verify.osentiment_block,'match')
    print(osentiment_block,'block')

    ouser_block = third_block.block_hash
    print(verify.ouser_block,'match')
    print(ouser_block,'block')

    if verify.ofeedback_block == ofeedback_block and verify.osentiment_block == osentiment_block and verify.ouser_block == ouser_block:
        print('test')
        qrcode_img=qrcode.make("Product has been Verified By Blockchain")
        # randnumber = random.randint(0,9999)
        canvas=Image.new("RGB", (350,350),"white")
        draw=ImageDraw.Draw(canvas)
        canvas.paste(qrcode_img)
        buffer=BytesIO()
        canvas.save(buffer,"PNG")
        verify.qr_photo = f'image{verify.order_id}.png'
        # print(type(verify.qr_photo,'qrcode'))
        verify.qr_photo.save(f'image{verify.order_id}.png',File(buffer),save=False)
        verify.save()
        canvas.close()
    else:
        qrcode_img=qrcode.make("Data has been Tampered")
        randnumber = random.randint(0,9999)
        canvas=Image.new("RGB", (350,350),"white")
        draw=ImageDraw.Draw(canvas)
        canvas.paste(qrcode_img)
        buffer=BytesIO()
        canvas.save(buffer,"PNG")
        verify.qr_photo = f'image{randnumber}.png'
        verify.qr_photo.save(f'image{randnumber}.png',File(buffer),save=False)
        verify.save()
        canvas.close()
        

    return redirect('sellers-view-order')


def reject_order(req,id):
    verify = get_object_or_404(OrderModels,order_id=id)
    verify.order_seller_status = "order rejected"
    verify.save(update_fields=["order_seller_status"])
    verify.save()
    return redirect('sellers-view-order')


def accept_orders(request,id):
    accept = get_object_or_404(OrderModels,order_id=id)
    accept.order_status = "accepted"
    accept.save(update_fields=["order_status"])
    accept.save()

    return redirect('adm-manage-std')

def decline_orders(request,id):
    decline = get_object_or_404(OrderModels,order_id=id)
    decline.order_status = "declined"
    decline.save(update_fields=["order_status"])
    decline.save()

    return redirect('adm-manage-std')


def sellers_view_order_details(request):
    user_id=request.session['seller_id']
    profile=SellerModel.objects.get(seller_id=user_id)
    print(profile.seller_photo,'jhg')
    print(profile.seller_id)

    return render(request,"sellers/sellers-view-order-details.html",{'profile':profile})


