from django.urls import path
from df_user import views
urlpatterns = [
    path('register/', views.register),
    path('register_handle/', views.register_handle),
    path('login/', views.login),
    path('login_handle/', views.login_handle),
    path('register_exist/', views.register_exist),
    path('logout/', views.logout),
    path('info/', views.info),
    path('site/', views.site),
    path('order/', views.order),
]
