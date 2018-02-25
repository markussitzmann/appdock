from django.contrib import admin
from django.urls import path

import rest_framework.urls

urlpatterns = [
    path(r'admin/', admin.site.urls),
    #path(r'api-auth/', rest_framework.urls, namespace='rest_framework')
]
