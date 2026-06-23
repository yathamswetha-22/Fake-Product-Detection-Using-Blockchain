from django.shortcuts import render,redirect,get_object_or_404
from django.contrib import messages
from customerapp.models import *
from customerapp.BlockchainAlgo import HashDataBlock

from sellerapp.models import *
# from adminapp.models import *

# Create your views here.
def main_admin_login(request):
    if request.method == "POST":
        username=request.POST.get("username")
        password=request.POST.get("password")

        if username == "admin" and password == "admin":
            messages.success(request,'Successfully Login')
            return redirect('admin-home')
        else:
            messages.warning(request,'invalid login')
            return redirect('main-admin-login')

    return render(request,"main/main-admin-login.html")
    
def admin_home(request):
    order1=OrderModels.objects.count()
    seller=SellerModel.objects.filter(seller_status="pending").count()
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


    return render(request,"admin/admin-home.html",
    {'customer1':customer1,'seller1':seller1,'order1':order1,'products':products,
    'seller2':seller2,'mobile':mobile,'phonecover':phonecover,'fakereviews':fakereviews,'genuinereviews':genuinereviews,
    'oppo':oppo,'oneplus':oneplus,'apple':apple,'redmi':redmi,'vivo':vivo,'seller':seller,
    'lg':lg,'samsung':samsung,'sony':sony,'micromax':micromax,'lava':lava,
    'usbcable':usbcable,'adapter':adapter,'watches':watches,'earphones':earphones})

def admin_sellers_request(request):
    s1=SellerModel.objects.order_by("-seller_id")
    
    return render(request,"admin/admin-sellers-request.html",{'s':s1})

def accept_seller(request,id):
    accept = get_object_or_404(SellerModel,seller_id=id)
    accept.seller_status = "accepted"
    accept.save(update_fields=["seller_status"])
    accept.save()

    return redirect('admin-sellers-request')

def decline_seller(request,id):
    decline = get_object_or_404(SellerModel,seller_id=id)
    decline.seller_status = "declined"
    decline.save(update_fields=["seller_status"])
    decline.save()

    return redirect('admin-sellers-request')

def admin_all_sellers(request):
    s1=SellerModel.objects.filter(seller_status="accepted").order_by('-seller_id')
    
    return render(request,"admin/admin-all-sellers.html",{'s':s1})

def admin_edit_sellers(request):
    return render(request,"admin/admin-edit-sellers.html")

def admin_delete_sellers(request):
    return render(request,"admin/admin-delete-sellers.html")

def admin_view_product(request):

    s1 = ProductModel.objects.all().order_by('-product_id')
    
    return render(request,"admin/admin-view-product.html",{'s':s1})


def admin_view_customers(request):
    c1 = CustomerModel.objects.all()
    
    return render(request,"admin/admin-view-customers.html",{'c':c1})

    
def admin_view_order(request):
    a=OrderModels.objects.all()
    return render(request,"admin/admin-view-order.html",{'a':a})

def admin_view_order_details(request):
    return render(request,"admin/admin-view-order-details.html")

def admin_view_feedback_orderwise(request):
    b1=OrderReviewModels.objects.all()

    return render(request,"admin/admin-view-feedback-orderwise.html",{'b1':b1})

def admin_view_feedback_productwise(request):
    b=FeedbackModel.objects.all()
    
    return render(request,"admin/admin-view-feedback-productwise.html",{'b':b})

def admin_fake_reviews_uncertified(request,id,review_id):
    block = FeedbackModel.objects.get(productwise_feedback_id=review_id)
    
    key = 's6f1sdfs6df1sd1f6sdf16sfd4'
    intitalblock = HashDataBlock(key,[block.productwise_feedback])
    second_block = HashDataBlock(intitalblock.block_hash,[block.psentiment])
    third_block = HashDataBlock(second_block.block_hash,[str(block.custwise_comments)])

    feedback_block = intitalblock.block_hash
    print(feedback_block,'block')
    print(block.feedback_block,'match')
    sentiment_block = second_block.block_hash
    print(sentiment_block,'block')
    user_block = third_block.block_hash
    print(user_block,'block')
    if block.feedback_block == feedback_block and block.sentiment_block == sentiment_block and block.user_block==user_block:
        y=FeedbackModel.objects.filter(prodwise_comments=id)
        x=FeedbackModel.objects.all()
        verypositive= FeedbackModel.objects.filter(prodwise_comments=id).filter(psentiment="Very Positive").count()
        verynegative= FeedbackModel.objects.filter(prodwise_comments=id).filter(psentiment="Very Negative").count()
        positive= FeedbackModel.objects.filter(prodwise_comments=id).filter(psentiment="Positive").count()
        negative= FeedbackModel.objects.filter(prodwise_comments=id).filter(psentiment="Negative").count()
        neutral=FeedbackModel.objects.filter(prodwise_comments=id).filter(psentiment="Neutral").count()
    else:
        messages.warning(request,'Data has been Tampered')
        return redirect('admin-view-feedback-productwise')


    



    
    
    return render(request,"admin/admin-fake-reviews-uncertified.html",{'y':y,'x':x,'Positive':positive,'Negative':negative,'Neutral':neutral,'VeryPositive':verypositive,'VeryNegative':verynegative
    ,'feedback_block':feedback_block,'sentiment_block':sentiment_block,'user_block':user_block})

def admin_fake_reviews_analysis_graph(request,id):
    x=OrderReviewModels.objects.all()
    y=OrderReviewModels.objects.filter(product_comments=id)
    verypositive= OrderReviewModels.objects.filter(product_comments=id).filter(osentiment="Very Positive").count()
    verynegative= OrderReviewModels.objects.filter(product_comments=id).filter(osentiment="Very Negative").count()
    positive= OrderReviewModels.objects.filter(product_comments=id).filter(osentiment="Positive").count()
    negative= OrderReviewModels.objects.filter(product_comments=id).filter(osentiment="Negative").count()
    neutral=OrderReviewModels.objects.filter(product_comments=id).filter(osentiment="Neutral").count()
    print(verynegative,'hhhh')
    print(negative,'aaaa')
    print(positive,'kkkk')
    print(verynegative,'hhhiiiii')
    print(neutral,'kkkkkkkkkklllllll')
    return render(request,"admin/admin-fake-reviews-analysis-graph.html",{'y':y,'x':x,'verynegative':verynegative,'verypositive':verypositive,'positive':positive,'negative':negative,'neutral':neutral})

def admin_sentiment_analysis(request):
    # customer_id=request.session['customer_id']
    # customer=OrderReviewModels.objects.get(customer_id='customer_id')
    # x=customer.cwise_comments.all()
    b2=OrderReviewModels.objects.all()

    return render(request,"admin/admin-sentiment-analysis.html",{'b2':b2})
