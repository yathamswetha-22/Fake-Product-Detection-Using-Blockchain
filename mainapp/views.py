from django.shortcuts import render,redirect

# from django.contrib import messages
# from customerapp.models import CustomerRegisterModel
# from sellerapp.models import SellerRegisterModel

# # Create your views here.
def main_home(request):
    return render(request,"main/main-home.html")

def main_about(request):
    return render(request,"main/main-about.html")

def main_contact(request):
    return render(request,"main/main-contact.html")

