def mov(a,b,c,n):
    if(n>0):
        mov(a,c,b,n-1)
        print('move plate from' , a, 'to', c)
        mov(b,a,c,n-1)

mov('No. 1','No. 2','No. 3',3)
