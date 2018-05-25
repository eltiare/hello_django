from django.http import HttpResponse
from django.core.cache import cache
import random

def index(request):
    cached = cache.get_or_set("lucky_seconds", random.randint(0, 10000000000), 10)
    return HttpResponse(f"<p>Hello world!</p> <p>Your lucky number for the ten seconds is: {cached}")