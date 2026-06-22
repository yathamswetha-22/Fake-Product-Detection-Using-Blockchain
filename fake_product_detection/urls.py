"""fakereviewsproject URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin

from django.urls import path,include
from adminapp import views as adminapp_views
from mainapp import views as mainapp_views
from sellerapp import views as sellersapp_views
from customerapp import views as customersapp_views
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    path('admin/', admin.site.urls),

    #admin views
    path('admin-home', adminapp_views.admin_home,name="admin-home"),
    path('main-admin-login',adminapp_views.main_admin_login,name="main-admin-login"),
    path('accepted-seller/<int:id>/',adminapp_views.accept_seller,name="accepted-seller"),
    path('declined-seller/<int:id>/',adminapp_views.decline_seller,name="declined-seller"),
    path('admin-sellers-request', adminapp_views.admin_sellers_request,name="admin-sellers-request"),
    path('admin-edit-sellers', adminapp_views.admin_edit_sellers,name="admin-edit-sellers"),
    path('admim-delete-sellers/<int:id>/',adminapp_views.admin_delete_sellers,name="admin-delete-sellers"),
    path('admin-all-sellers', adminapp_views.admin_all_sellers,name="admin-all-sellers"),
    path('admin-view-product', adminapp_views.admin_view_product,name="admin-view-product"),
    path('admin-view-customers', adminapp_views.admin_view_customers,name="admin-view-customers"),
    path('admin-view-order', adminapp_views.admin_view_order,name="admin-view-order"),
    path('admin-view-order-details', adminapp_views.admin_view_order_details,name="admin-view-order-details"),
    path('admin-view-feedback-orderwise', adminapp_views.admin_view_feedback_orderwise,name="admin-view-feedback-orderwise"),
    path('admin-view-feedback-productwise', adminapp_views.admin_view_feedback_productwise,name="admin-view-feedback-productwise"),
    path('admin-fake-reviews-uncertified/<int:id>/<int:review_id>/', adminapp_views.admin_fake_reviews_uncertified,name="admin-fake-reviews-uncertified"),
    path('admin-fake-reviews-analysis-graph/<int:id>/', adminapp_views.admin_fake_reviews_analysis_graph,name="admin-fake-reviews-analysis-graph"),
    path('admin-sentiment-analysis', adminapp_views.admin_sentiment_analysis,name="admin-sentiment-analysis"),
    
    #main views
    path('', mainapp_views.main_home,name="main-home"),
    path('main-about', mainapp_views.main_about,name="main-about"),
    path('main-contact', mainapp_views.main_contact,name="main-contact"),
    

    #sellers views
    path('main-seller-register', sellersapp_views.main_seller_register,name="main-seller-register"),
    path('main-seller-login', sellersapp_views.main_seller_login,name="main-seller-login"),


    path('sellers-home', sellersapp_views.sellers_home,name="sellers-home"),
    path('sellers-add-product', sellersapp_views.sellers_add_product,name="sellers-add-product"),
    path('sellers-product-edit/<int:id>/',sellersapp_views.sellers_product_edit,name="sellers-product-edit"),
    path('sellers-all-product', sellersapp_views.sellers_all_product,name="sellers-all-product"),
    path('sellers-manage-product', sellersapp_views.sellers_manage_product,name="sellers-manage-product"),
    path('sellers-myprofile', sellersapp_views.sellers_myprofile,name="sellers-myprofile"),
    path('sellers-sentiment-analysis', sellersapp_views.sellers_sentiment_analysis,name="sellers-sentiment-analysis"),
    path('sellers-view-customers', sellersapp_views.sellers_view_customers,name="sellers-view-customers"),
    path('sellers-view-feedback-orderwise', sellersapp_views.sellers_view_feedback_orderwise,name="sellers-view-feedback-orderwise"),
    path('sellers-view-feedback-productwises', sellersapp_views.sellers_view_feedback_productwise,name="sellers-view-feedback-productwises"),
    path('sellers-view-order', sellersapp_views.sellers_view_order,name="sellers-view-order"),
    path('accepted-orders/<int:id>/',sellersapp_views.accept_orders,name="accepted-orders"),
    path('declined-orders/<int:id>/',sellersapp_views.decline_orders,name="declined-orders"),
    path('sellers-view-order-details', sellersapp_views.sellers_view_order_details,name="sellers-view-order-details"),
    path('accept_order/<int:id>/', sellersapp_views.accept_order,name="accept_order"),
    path('reject_order/<int:id>/', sellersapp_views.reject_order,name="reject_order"),

    
    

    #customers views
    path('main-customers-login', customersapp_views.main_customers_login,name="main-customers-login"),
    path('main-customers-register',customersapp_views.main_customers_register,name="main-customers-register"),

    path('customers-home', customersapp_views.customers_home,name="customers-home"),
    # path('customerwise-feedback', customersapp_views.customerwise_feedback,name="customerwise-feedback"),
    path('customers-category', customersapp_views.customers_category,name="customers-category"),
    path('customers-checkout', customersapp_views.customers_checkout,name="customers-checkout"),
    path('customers-different-address', customersapp_views.customers_different_address,name="customers-different-address"),
    path('customers-feedback', customersapp_views.customers_feedback,name="customers-feedback"),
    path('customers-mycart', customersapp_views.customers_mycart,name="customers-mycart"),
    path('customers-myorders', customersapp_views.customers_myorders,name="customers-myorders"),
    path('customers-myprofile', customersapp_views.customers_myprofile,name="customers-myprofile"),
    path('customers-mywishlist', customersapp_views.customers_mywishlist,name="customers-mywishlist"),
    path('customers-orderdetails', customersapp_views.customers_orderdetails,name="customers-orderdetails"),
    path('customers-orderlist', customersapp_views.customers_orderlist,name="customers-orderlist"),
    path('customers-productdetails/<int:id>', customersapp_views.customers_productdetails,name="customers-productdetails"),
    path('customer-add-to-cart-action/<int:id>', customersapp_views.customer_add_to_cart_action,name="customer-add-to-cart-action"),
    path('customer-change-wishlist/<int:id>/', customersapp_views.change_watchlist,name="customer-change-wishlist"),
    path('customer-remove-products-from-cart/<int:id>/', customersapp_views.remove_from_cart,name="customer-remove-products-from-cart"),
    # path('customer-add-to-wishlist/<int:id>', customersapp_views.customer_add_to_cart_action,name="customer-add-to-wishlist"),
    path('customer-proceed-to-checkout', customersapp_views.proceed_to_checkout,name="customer-proceed-to-checkout"),
    path('customer-product-review/<int:id>', customersapp_views.product_review,name="customer-product-review"),
    path('customer-orderwise-reviews/<int:id>', customersapp_views.customer_orderwise_reviews,name="customer-orderwise-reviews"),
    # path('customers-product-feedback', customersapp_views.product_feedback,name="customers-product-feedback"),
    path('customer-remove-myorders/<int:id>/', customersapp_views.remove_from_myorders,name="customer-remove-myorders"),
    path('customer-remove-mywishlist/<int:id>/', customersapp_views.remove_from_mywishlist,name="customer-remove-mywishlist"),







]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
