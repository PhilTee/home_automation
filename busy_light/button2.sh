
curl "http://192.168.0.100/win" | grep "<ac>0</ac>" \
  && curl "http://192.168.0.100/win&R=255&G=0&B=0&FX=0&FP=2&T=1" \
  || curl "http://192.168.0.100/win&T=0"
