# 개요
 - azure 의 설정에서 internet 접속을 제한하는 방법
 - AWS 의 경우는 VPC 가 기본 인터넷 접속 차단인데, azure 는 virtual network 가 기본 인터넷 허용
 - https://knowledge-base.havit.eu/2017/11/10/azure-disable-outbound-traffic-from-vnet-to-internet-except-the-azure-services/

## 방법
 - azure 에서 이미 설정된 내용은 변경이나 삭제가 되지 않음
 - 우선순위를 높은 것을 설정하여 오버라이드 되도로 해야 함 (숫자가 낮은 것이 높은 순위)
 - azure 의 경우 destnation 의 "Service Tag" 로 internet 이 지정되어 있음

![Screen Shot 2021-09-24 at 18 41 16](https://user-images.githubusercontent.com/979297/134654032-920d4a79-f90e-4cee-acea-7b7d5560e0ef.png)
