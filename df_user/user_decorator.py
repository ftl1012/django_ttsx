# coding: utf8

from django.http import HttpResponseRedirect


def login(func):
    # 外部传递函数对象进来
    def login_fun(request, *args, **kwargs):
        if request.session.has_key('user_id'):
            # 如果用户已经登录，则指定执行对应的views
            return func(request, *args, **kwargs)
        else:
            # 用户未登录，则跳转登录界面
            red = HttpResponseRedirect('/user/login')
            # 记录之前的完整URL，用于登录后的跳转
            red.set_cookie('url', request.get_full_path())
            return red

    return login_fun


'''
    请求： http://127.0.0.1:8000/200/?type=10
    request.path:表示当前路径,为/200/
    request,get_full_path():表示完整路径, 为/200/?type=10
'''