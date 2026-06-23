
from cmd import IDENTCHARS
from django.shortcuts import render,redirect,get_list_or_404,get_object_or_404
from django.contrib import messages
from sellerapp.models import *
from customerapp.models import *
from django.db.models import Q,F
from django.db.models import Sum,Avg
from textblob import TextBlob
from django.core.paginator import Paginator
from customerapp.BlockchainAlgo import HashDataBlock
# from textblob.sentiments import NaiveBayesAnalyzer

from django.core.exceptions import PermissionDenied


# # Create your views here.
def main_customers_register(request):
    if request.method=="POST" and request.FILES["photo"]:
        
        customerid=request.POST.get("customerid")
        fullname=request.POST.get("fullname")
        contact=request.POST.get("contact")
        email=request.POST.get("email")
        password=request.POST.get("password")
        photo=request.FILES["photo"]
        address=request.POST.get("address")
        street=request.POST.get("street")
        city=request.POST.get("city")
        state=request.POST.get("state")
        pincode=request.POST.get("pincode")

        data=CustomerModel.objects.create(
        customer_photo=photo,customer_fullname=fullname,
        customer_email=email,customer_password=password,
        customer_id=customerid,customer_contact=contact,
        customer_address=address,customer_street=street,
        customer_city=city,customer_state=state,
        customer_pincode=pincode)

        if data:
            messages.success(request,"successfully registered")
        else:
            messages.error(request,"Your form is not registered, please try again")
    return render(request,"main/main-customers-register.html")

def main_customers_login(request):
    if request.method == "POST":
        email=request.POST.get("email")
        password=request.POST.get("password")
        print(email,password)

        try:
            data2=CustomerModel.objects.get(customer_email=email,customer_password=password)
            request.session['customer_id']=data2.customer_id
        except:
            return redirect('main-customers-login')

        if data2:
            messages.success(request,"Successfully Login")
            return redirect('customers-home')
        else:
            messages.error(request,"Invalid Login")
    return render(request,"main/main-customers-login.html")


# def customers_register(request):
# # #     if request.method == "POST" and request.FILES["photo"]:
# # #         customerid=request.POST.get("customerid")
# # #         fullname=request.POST.get("fullname")
# # #         contact=request.POST.get("contact")
# # #         dob=request.POST.get("dob")
# # #         email=request.POST.get("email")
# # #         password=request.POST.get("password")
# # #         state=request.POST.get("state")
# # #         city=request.POST.get("city")
# # #         pincode=request.POST.get("pincode")
# # #         flatno=request.POST.get("flatno")
# # #         address1=request.POST.get("address1")
# # #         address2=request.POST.get("address2")
# # #         photo=request.FILES["photo"]
       
#     return render(request,"main/main-customers-register.html")

# def customers_login(request):
# # #     if request.method == "POST":
# # #         email=request.POST.get("email")
# # #         password=request.POST.get("password")
# # #         # print("sssss")

# # #         # try:
# # #         #     # print("cccccc")
# # #         #     check=CustomerRegisterModel.objects.get(customer_email=email,customer_password=password)
# # #         #     request.session['customer_id']=check.customer_id
# # #         #     # print("lllll")
# # #         #     if check.customer_status == 'accepted':
# # #         #         messages.success(request,'Successfully Login')
# # #         #         return redirect('student-home')
# # #         #     elif check.customer_status == 'pending':
# # #         #         messages.warning(request,'Your request is in pending, please wait for until acceptance')
# # #         #     elif check.customer_status == 'rejected':
# # #         #         messages.error(request,'Your request is rejected, so you cannot login')
# # #         # except:
# # #         #         messages.warning(request,'invalid login')
#     return render(request,"main/main-customers-login.html")
    
def customers_home(request):
    user_id=request.session['customer_id']
    customer=CustomerModel.objects.get(customer_id=user_id)
    s1=ProductModel.objects.all().order_by('product_id')
    x=ProductModel.objects.filter(product_category__startswith='MOBILE')
    x1=ProductModel.objects.filter(product_category__startswith='EAR PHONES')
    x2=ProductModel.objects.filter(product_category__startswith='PHONE COVER')
    x4=ProductModel.objects.filter(product_category__startswith='USB CABLE')
    x5=ProductModel.objects.filter(product_category__startswith='ADAPTER')
    x6=ProductModel.objects.filter(product_category__startswith='WATCHES')
    x3=ProductModel.objects.filter(product_category__startswith='CHARGE')
    print(x,x1)

    wishlist=WishlistModel.objects.all().count()

    cartcount=CartModel.objects.filter(cart_owner=user_id).count()
    # fPosts=ProductModel.objects.all()
    # paginator = Paginator(fPosts, 4)
    # page_number = request.GET.get('page')
    # page_obj = paginator.get_page(page_number)




    return render(request,"customers/customers-home.html",{'s1':s1,'x':x,'x1':x1,'x2':x2,'x3':x3,'x4':x4,'x5':x5,'x6':x6,'wishlist':wishlist,'cartcount':cartcount})


def customers_category(request):
    user_id=request.session['customer_id']
    customer=CustomerModel.objects.get(customer_id=user_id)
    wishlist=WishlistModel.objects.all().count()

    cartcount=CartModel.objects.filter(cart_owner=user_id).count()
    s1=ProductModel.objects.all().order_by('-product_id')

    fPosts=ProductModel.objects.order_by("-product_id")
    paginator = Paginator(fPosts, 6)

    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)


    for i in fPosts:
        print(i)

    

    return render(request,"customers/customers-category.html",{'s':s1,'wishlist':wishlist,'cartcount':cartcount,'s':page_obj})

def customers_checkout(request):
    user_id=request.session['customer_id']
    x1 = CustomerModel.objects.get(customer_id=user_id)
    wishlist=WishlistModel.objects.all().count()

    # cartcount=CartModel.objects.filter(cart_owner=user_id).count()
    # x2 = ProductModel.objects.get(product_id=id)
    print(x1)
    if request.method == "POST":
        street=request.POST.get("street")
        city=request.POST.get("city")
        state=request.POST.get("state")
        pincode=request.POST.get("pincode")
        contact=request.POST.get("contact")
        address=request.POST.get("address")
        # photo=request.FILES["photo"]
        print(street,city,state,pincode,contact,address)
    wishlist=WishlistModel.objects.all().count()
    cartcount=CartModel.objects.filter(cart_owner=user_id).count()

    
    # data=CartModel.objects.filter(cart_owner=user_id) 

    

    return render(request,"customers/customers-checkout.html",{'i':x1,'wishlist':wishlist,'cartcount':cartcount})

def customers_different_address(request):
   
    return render(request,"customers/customers-different-address.html")
    
def proceed_to_checkout(request):
    user_id=request.session['customer_id']
    user=CustomerModel.objects.get(customer_id=user_id)
    print(user)
    wishlist=WishlistModel.objects.all().count()
    cartcount=CartModel.objects.filter(cart_owner=user_id).count()
    x=CartModel.objects.filter(cart_owner=user_id)
    print(len(x))
    print(x,'hhhhhhhhkj')
    data2=CustomerModel.objects.get(customer_id=user_id)
   
    for i in x:
       
        order_product=i.cart_product,
        order_address=user.customer_address,
        order_status='order placed'


        # payment_product_name=i.cart_product.product_name
        # print(payment_product_name,'jjjjjjjkkkkkk')
        # payment_product_photo=i.cart_product.product_photo1
        # payment_product_quantity=i.cart_product_quantity
        # payment_product_price=i.cart_product_price
        # e=data2
        # f=data3
        # g=data4


        data=OrderModels.objects.create(order_customer=user,
        order_product=i.cart_product,
        order_product_price=i.cart_product_price,
        order_product_quantity=i.cart_product_quantity,
        order_product_amount=i.cart_product_price,
        # order_product_seller=i.cart_product.product_creator,
        
        order_address=order_address,
        order_status=order_status
        )
        
        key = 'df6s4sd31fsd6f4sd156ef'
        intitalblock = HashDataBlock(key,[str(data.order_product),str(data.order_id)])
        second_block = HashDataBlock(intitalblock.block_hash,[str(data.order_product_price),str(data.order_product_quantity)])
        third_block = HashDataBlock(second_block.block_hash,[str(data.order_product_amount)])

        data.ofeedback_block = intitalblock.block_hash
        print(data.ofeedback_block,'block')
        data.osentiment_block = second_block.block_hash
        print(data.osentiment_block,'block')
        data.ouser_block = third_block.block_hash
        print(data.ouser_block,'block')

        data.save()
                            # payment_product_name=payment_product_name,
                            # payment_product_photo=payment_product_photo,
                            # payment_product_quantity=payment_product_quantity,
                            # payment_product_price=payment_product_price,
                            # prod_id=f,
                            # cust_id=e,
                            # sell_id=g)  

    data3=CartModel.objects.filter(cart_owner=user_id).delete()
    messages.success(request,'Order Placed Successfully')

    return redirect('customers-myorders')

def customers_myorders(request):
    user_id=request.session['customer_id']
    user=CustomerModel.objects.get(customer_id=user_id)
    wishlist=WishlistModel.objects.all().count()
    cartcount=CartModel.objects.filter(cart_owner=user_id).count()
    p=ProductModel.objects.all()
    x=OrderModels.objects.filter(order_customer=user).order_by('-order_id')
    
    # if request.method=="POST" and request.FILES["orderedproductreview"]:
        
    #     customerid=request.POST.get("customerid")
  
    

    print(x)
    
        
    return render(request,"customers/customers-myorders.html",{'s':x,'p':p,'wishlist':wishlist,'cartcount':cartcount})



def customers_myprofile(request):
    user_id=request.session['customer_id']
    x = CustomerModel.objects.get(customer_id=user_id)
    
    wishlist=WishlistModel.objects.all().count()
    cartcount=CartModel.objects.filter(cart_owner=user_id).count()
    if request.method == "POST":
        email=request.POST.get("email")
        password=request.POST.get("password")
        contact=request.POST.get("contact")
        address=request.POST.get("address")
        # photo=request.FILES["photo"]
        print(email,password,contact,address)
        
        
        x.customer_email=email
        x.customer_password=password
        x.customer_contact=contact
        x.customer_address=address
        # x.customer_photo=photo
        x.save()
        return redirect("customers-myprofile")
    return render(request,"customers/customers-myprofile.html",{'i':x,'wishlist':wishlist,'cartcount':cartcount})

# def add_to_wishlist(request,id):
#     prod=ProductModel.objects.get(product_id=id)
#     print(prod)
#     if request.method == "POST":
#         productname=request.POST.get("productname")
    
#     return redirect('customers-add-to-wishlist')

def customers_mywishlist(request):
    customer_id=request.session['customer_id']
    customer=CustomerModel.objects.get(customer_id=customer_id)
    
    wishlist=WishlistModel.objects.all().count()
    cartcount=CartModel.objects.filter(cart_owner=customer).count()
    prod=WishlistModel.objects.all()    
    # wishlist=ProductModel.objects.filter(product_wishlist=customer_id).count()
    
    
    
    # product_object = ProductModel.objects.get(product_id=id)
    
        # messages.success(request,'Product Added to watchlist')
    
        # return redirect(redirect_method, category='all')
    # ProductModel.objects.filter(product_wishlist_action=).delete()
        
    return render(request,"customers/customers-mywishlist.html", {'prod':prod,'wishlist':wishlist,'cartcount':cartcount})

def change_watchlist(request,id):
    print('funct calllllll')
    customer_id=request.session['customer_id']
    customer=CustomerModel.objects.get(customer_id=customer_id)
    product_object = ProductModel.objects.get(product_id=id)
    
    wishlist=WishlistModel.objects.all().count()
    cartcount=CartModel.objects.filter(cart_owner=customer).count()

    prod = get_object_or_404(ProductModel,product_id=id)
    if customer in product_object.product_wishlist_action.all():
        product_object.product_wishlist_action.remove(customer)
        # messages.info(request,'Product removed from watchlist')
    else:
        product_object.product_wishlist_action.add(customer)
        # messages.success(request,'Product Added to watchlist')
    
    return redirect('customers-category')

def customers_orderdetails(request):
    return render(request,"customers/customers-orderdetails.html")

def customers_orderlist(request):
    return render(request,"customers/customers-orderlist.html")

def customers_productdetails(request,id):
    customer_id=request.session['customer_id']
    customer=CustomerModel.objects.get(customer_id=customer_id)
    print('hhhh')
    
    wishlist=WishlistModel.objects.all().count()
    cartcount=CartModel.objects.filter(cart_owner=customer).count()
    # user_id=request.session['seller_id']
    prod = ProductModel.objects.get( product_id=id)
    

    print(prod.product_name)
    print(prod.product_photo1)

    b=FeedbackModel.objects.filter(prodwise_comments=prod)
    c=OrderModels.objects.all()
    o=OrderReviewModels.objects.all()
    # order=OrderModels.objects.get(order_id=id1)
    print(prod)
    # data1=FeedbackModel.objects.filter(custwise_comments=customer_id).filter(prodwise_comments=id).filter(productwise_feedback=b)
    # data2=FeedbackModel.objects.filter(custwise_comments=customer_id).filter(prodwise_comments=id).filter(productwise_feedback=b).exists()
    # for k in data1:
    #     print(k.productwise_feedback)
    
    # if data2 and k.productwise_feedback == 1 :
    #     messages.info(request,'You can give a reviews for this product multiple times.')
    # else:
        # messages.success(request,'Please suggest a review for this product.')







    # customer_id=request.session['customer_id']
    # data = CartModel.objects.filter(cart_owner=customer_id).aggregate((Sum('cart_product_price')))
    # total=data['cart_product_price__sum']
    # print(total)

    # s1 = ProductModel.objects.filter(product_creator=)
    return render(request,"customers/customers-productdetails.html",{'s':prod,'b':b,'c':c,'o':o,'wishlist':wishlist,'cartcount':cartcount})

def customers_feedback(request):
    user_id=request.session['customer_id']
    x = CustomerModel.objects.get(customer_id=user_id)
    wishlist=WishlistModel.objects.all().count()
    cartcount=CartModel.objects.filter(cart_owner=x).count()
    print(x.customer_photo,'hhhhh',x)
    if request.method == "POST":
        fullname=request.POST.get("fullname")
        email=request.POST.get("email")
        address=request.POST.get("address")
        photo=request.FILES["photo"]
        
        print(fullname,email,address,photo)
    # x=CustomerModel.objects.all()


    return render(request,"customers/customers-feedback.html",{'s':x,'wishlist':wishlist,'cartcount':cartcount})

def productwise_feedback(request):
    return render(request,"customer/customers-productdetails.html")



def product_review(request,id):
    customer_id=request.session['customer_id']
    cust=CustomerModel.objects.get(customer_id=customer_id)
    wishlist=WishlistModel.objects.all().count()
    cartcount=CartModel.objects.filter(cart_owner=cust).count()
    prod=ProductModel.objects.get(product_id=id)
    print('func callllll')
    x=FeedbackModel.objects.all()
    print(x,'shdbahsbdhbsdhsdbhabsdbahsdbhbsdb')
    # o_review=OrderReviewModels.objects.get(product_comments=prod,order_customer=cust)

    if request.method == "POST":
        productreview=request.POST.get("productreview")
        try:
            orderid2=OrderModels.objects.get(order_product=prod,order_customer=cust)
            print(orderid2,'hkkkkkkkkkhhhhhhhhhhkkkkk')
            pass
        except:
            orderid2=None
        # try:
        #     o_review=OrderReviewModels.objects.get(product_comments=prod,order_customer=cust)
        #     print(o_review,'gfhgfhgfhgff')


        #     pr = FeedbackModel.objects.create(
        #     productwise_feedback=productreview,feedback_order_id=orderid2,prodwise_rating=productrating,
        #     psentiment=psentiment,prodwise_comments=prod,after_order_placed_revire=o_review.order_review_id,
        #     custwise_comments=cust,sellwise_comments=prod.product_creator)
        #     pr.save()
        #     print(pr,'jjjjjjjjj')
            
        # except:
        #     o_review=None
        #     print('xxxxxxxxxxxxxx')
        # text analysis
        analysis = TextBlob(productreview)
        # analysis = TextBlob(productreview,analyzer=NaiveBayesAnalyzer())
        print(analysis)
        
        psentiment = ''
        if analysis.polarity >= 0.5:
            psentiment = 'Very Positive'
        elif analysis.polarity > 0 and analysis.polarity < 0.5:
            psentiment = 'Positive'
        elif analysis.polarity < 0 and analysis.polarity > -0.5:
            psentiment = 'Negative'
        elif analysis.polarity <= -0.5:
            psentiment = 'Very Negative'
        else:
            psentiment = 'Neutral'

        print(psentiment)







        pr = FeedbackModel.objects.create(
        productwise_feedback=productreview,feedback_order_id=orderid2,
        psentiment=psentiment,prodwise_comments=prod,
        custwise_comments=cust,sellwise_comments=prod.product_creator)

        key = 's6f1sdfs6df1sd1f6sdf16sfd4'
        intitalblock = HashDataBlock(key,[pr.productwise_feedback])
        second_block = HashDataBlock(intitalblock.block_hash,[pr.psentiment])
        third_block = HashDataBlock(second_block.block_hash,[str(pr.custwise_comments)])

        pr.feedback_block = intitalblock.block_hash
        print(pr.feedback_block,'block')
        pr.sentiment_block = second_block.block_hash
        print(pr.sentiment_block,'block')
        pr.user_block = third_block.block_hash
        print(pr.user_block,'block')

        pr.save()
        # print(o_review)
        

        # data1=FeedbackModel.objects.filter(custwise_comments=customer_id).filter(prodwise_comments=id).filter(productwise_feedback=prod)
        # data2=FeedbackModel.objects.filter(custwise_comments=customer_id).filter(prodwise_comments=id).filter(productwise_feedback=prod).exists()
        # for k in data1:
        #     print(k.productwise_feedback)
    
        # if data2 and k.productwise_feedback == 1 :
        #     messages.info(request,'You can give a reviews for this product multiple times.')
        # else:
        #     messages.success(request,'Please suggest a review for this product.')
        
        # if pr.productwise_feedback <= 2 :
        #     messages.error(request,"You can not review a product multiple times")
        # else:
        #     messages.success(request,"please review your product")
            

            
        return redirect('customers-productdetails', id=id)

    # x=FeedbackModel.objects.get(feedback_order_id=orderid)
    return render(request,"customers/customers-productdetails.html",{'x':x,'cust':cust,'prod':prod,'wishlist':wishlist,'cartcount':cartcount})


def ordered_product_feedback(request):
    # customer_id=request.session['customer_id']
    # cust=CustomerModel.objects.get(customer_id=customer_id)
    # prod=ProductModel.objects.get(product_id=id)
    # # sell=SellerModel.objects.get(seller_id=id1)

    # print('func callllll')

    # data=CustomerModel.objects.get(customer_id=customer_id)
    # if request.method == "POST":
    #     # productrating=request.POST.get("prodwiserating")
    #     orderproductreview=request.POST.get("orderproductreview")

        
        
    #     # text analysis
    #     analysis = TextBlob(orderproductreview)
    #     # analysis = TextBlob(productreview,analyzer=NaiveBayesAnalyzer())
    #     print(analysis)
        
    #     osentiment = ''
    #     if analysis.polarity >= 0.5:
    #         osentiment = 'Very Positive'
    #     elif analysis.polarity > 0 and analysis.polarity < 0.5:
    #         osentiment = 'Positive'
    #     elif analysis.polarity < 0 and analysis.polarity > -0.5:
    #         osentiment = 'Negitive'
    #     elif analysis.polarity <= -0.5:
    #         osentiment = 'Very Negitive'
    #     else:
    #         osentiment = 'Neutral'
    #     print(osentiment)


    #     pr = OrderReviewModels.objects.create(
    #     orderproduct_review=orderproductreview,
    #     osentiment=osentiment,product_comments=prod,
    #     customer_comments=cust,seller_comments=prod.product_creator)
    #     pr.save()
    #     return redirect('customers-myorders')
    return render(request,"customer/customers-myorders.html")

def customer_add_to_cart_action(request,id):
    user_id=request.session['customer_id']
    customer=CustomerModel.objects.get(customer_id=user_id)
    wishlist=WishlistModel.objects.all().count()

    cartcount=CartModel.objects.filter(cart_owner=customer).count()
    product=ProductModel.objects.get(product_id=id)
    user=CustomerModel.objects.get(pk=user_id)
    
    products = CartModel.objects.filter(cart_owner=user)
    
    print("functtttttt")
    if request.method == "POST":
        # cartid=request.POST.get("cartid")
        # productprice=request.POST.get("productprice")
        productquantity=request.POST.get("productquantity")
        print(type(productquantity),'gggggggggggg')
        print((product.product_discount_price),'amounnnnn')
        print(products.count(),'testingggggggg')
        # totalprice = CartModel.objects.filter(cart_owner=user).aggregate(Sum('cart_product_price'))
        # print(totalprice,'harsha')
        pr = product.product_discount_price
        print(pr,'priceeee')
        totalprice = int(productquantity)*pr
    
       

        CartModel.objects.create(cart_owner=user,cart_product=product,cart_product_quantity=productquantity,cart_product_price=totalprice)
        
        # return redirect('customers-mycart') 
        return redirect('customer-change-wishlist', id=id)   

    return render(request,'customers/customers-mycart.html',{'products':products,'wishlist':wishlist,'cartcount':cartcount})
    
def customers_mycart(request):
    
    user_id=request.session['customer_id']
    customer=CustomerModel.objects.get(customer_id=user_id)
    wishlist=WishlistModel.objects.all().count()
    cartcount=CartModel.objects.filter(cart_owner=customer).count()
    
    # product=ProductModel.objects.get(product_id=id)
    user=CustomerModel.objects.get(pk=user_id)
    products = CartModel.objects.filter(cart_owner=user)
    total=CartModel.objects.filter(cart_owner=user_id).aggregate(total=Sum('cart_product_price'))
    # product=ProductModel.objects.get(product_id=id1)
    # x=CartModel.objects.filter(cart_id=id).filter(product_id=id1.cart_product).count()
    print("functtttttt")
    if request.method == "POST":
        # cartid=request.POST.get("cartid")
        # productprice=request.POST.get("productprice")
        productquantity=request.POST.get("productquantity")
        print(type(productquantity),'gggggggggggg')
        print((products.product_discount_price),'amounnnnn')
        totalprice = int(productquantity) * products.product_discount_price
      
    
       

        # CartModel.objects.create(cart_owner=user,cart_product=product,cart_product_quantity=productquantity,cart_product_price=totalprice)
        
        return redirect('customers-mycart')  
    return render(request,"customers/customers-mycart.html",{'products':products,'total':total,'wishlist':wishlist,'cartcount':cartcount})

def remove_from_cart(request,id):
    customer_id=request.session['customer_id']
    customer=CustomerModel.objects.get(customer_id=customer_id)
    wishlist=WishlistModel.objects.all().count()
    cartcount=CartModel.objects.filter(cart_owner=customer).count()
    CartModel.objects.filter(cart_owner=customer_id).filter(cart_id=id).delete()
    # user_id = request.session['customer_id']
    # card = CartModel.objects.get(cart_owner=id) 
    # card.delete()
    # if card.exists():
    #     cartitem = CartModel.objects.filter(card_id=card.first().id)
    #     if cartitem.exists():
    #         cartitem.delete()
    #     return redirect(reverse("customers-mycart"))
    return redirect("customers-mycart")
    
def remove_from_myorders(request,id):
    customer_id=request.session['customer_id']
    customer=CustomerModel.objects.get(customer_id=customer_id)
    wishlist=WishlistModel.objects.all().count()
    cartcount=CartModel.objects.filter(cart_owner=customer).count()
    OrderModels.objects.filter(order_customer=customer_id).filter(order_id=id).delete()
    return redirect("customers-myorders")

def remove_from_mywishlist(request,id):
    customer_id=request.session['customer_id']
    customer=CustomerModel.objects.get(customer_id=customer_id)
    wishlist=WishlistModel.objects.all().count()
    cartcount=CartModel.objects.filter(cart_owner=customer).count()
    ProductModel.objects.filter(product_id=id).delete()

    CartModel.objects.filter(cart_owner=customer_id).filter(cart_id=id).delete()

    return redirect("customers-mywishlist")
    
def customer_orderwise_reviews(request,id):
    customer_id=request.session['customer_id']
    cust=CustomerModel.objects.get(customer_id=customer_id)
    # customer=CustomerModel.objects.get(customer_id=user_id)
    wishlist=WishlistModel.objects.all().count()
    cartcount=CartModel.objects.filter(cart_owner=cust).count()
    prod=ProductModel.objects.get(product_id=id)
    # sell=SellerModel.objects.get(seller_id=id1)

    print('func callllll')

    data=CustomerModel.objects.get(customer_id=customer_id)
    if request.method == "POST":
        # productrating=request.POST.get("prodwiserating")
        orderproductreview=request.POST.get("orderproductreview")

        try:
            order=OrderModels.objects.get(order_product=prod,order_customer=cust)
        except:
            order=None
        
        # text analysis
        analysis = TextBlob(orderproductreview)
        # analysis = TextBlob(productreview,analyzer=NaiveBayesAnalyzer())
        print(analysis)
        
        osentiment = ''
        if analysis.polarity >= 0.5:
            osentiment = 'Very Positive'
        elif analysis.polarity > 0 and analysis.polarity < 0.5:
            osentiment = 'Positive'
        elif analysis.polarity < 0 and analysis.polarity > -0.5:
            osentiment = 'Negative'
        elif analysis.polarity <= -0.5:
            osentiment = 'Very Negative'
        else:
            osentiment = 'Neutral'
        print(osentiment)


        pr = OrderReviewModels.objects.create(
        orderproduct_review=orderproductreview,order_produt_comments=order,
        osentiment=osentiment,product_comments=prod,
        customer_comments=cust,seller_comments=prod.product_creator)
        pr.save()
        return redirect('customers-myorders')
    
    return render(request,'customers/customers-orderwise-reviews.html',{'cust1':cust,'prod1':prod,'wishlist':wishlist,'cartcount':cartcount})
    
# def product_feedback(request):
#     id=request.session['user_id']

#     data=CustomerModel.objects.get(user_id=id)
#     if request.method == "POST":
#         prodwise_rating=request.POST.get("prodwise_rating")
#         text=request.POST.get("text")
        
#         # text analysis
#         analysis = TextBlob(text,analyzer=NaiveBayesAnalyzer())
#         print(analysis.sentiment)
        
#         sentiment = ''
#         if analysis.polarity >= 0.5:
#             sentiment = 'Very Positive'
#         elif analysis.polarity > 0 and analysis.polarity < 0.5:
#             sentiment = 'Positive'
#         elif analysis.polarity < 0 and analysis.polarity > -0.5:
#             sentiment = 'Negitive'
#         elif analysis.polarity <= -0.5:
#             sentiment = 'Very Negitive'
#         else:
#             sentiment = 'Neutral'


#         student_feedback = CustomerModel.objects.create(prodwise_rating=prodwise_rating,text=text,student_id=data,sentiment=sentiment)
#         student_feedback.save()
#         messages.success(request,"Successfully Sent")    
        
#     return render(request,"student/STD-feedback.html")