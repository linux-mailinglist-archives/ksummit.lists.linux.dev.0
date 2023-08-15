Return-Path: <ksummit+bounces-963-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 581AD77C637
	for <lists@lfdr.de>; Tue, 15 Aug 2023 05:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB14E2815AB
	for <lists@lfdr.de>; Tue, 15 Aug 2023 03:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BFD41C26;
	Tue, 15 Aug 2023 03:05:36 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp-fw-80008.amazon.com (smtp-fw-80008.amazon.com [99.78.197.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E699A622
	for <ksummit@lists.linux.dev>; Tue, 15 Aug 2023 03:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1692068734; x=1723604734;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=85QOwehyHxtzpCvUigLgNe1bmL6sDfBvc2hN70fAITQ=;
  b=Sv2BSz6NdAztAWqezDnR5CFbkdIsWN53eqoiMHBr1S1iXRKap/X2tMZ0
   nGY70lHay/snAA7e+7bc9TFWDO57cYN1bO22mm3v1lDnpZanDUEhTYGB2
   Cr8qzoF+KlNnuNJqUBuEz43ogUHv8uc3w/gsK0g69KBOsr8b1/7jcAIEt
   k=;
X-IronPort-AV: E=Sophos;i="6.01,173,1684800000"; 
   d="scan'208";a="22537754"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-pdx-2c-m6i4x-dc7c3f8b.us-west-2.amazon.com) ([10.25.36.214])
  by smtp-border-fw-80008.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 03:05:32 +0000
Received: from EX19MTAUWB002.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
	by email-inbound-relay-pdx-2c-m6i4x-dc7c3f8b.us-west-2.amazon.com (Postfix) with ESMTPS id 1F81F10D6AD;
	Tue, 15 Aug 2023 03:05:31 +0000 (UTC)
Received: from EX19D021UWA002.ant.amazon.com (10.13.139.48) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 15 Aug 2023 03:05:30 +0000
Received: from EX19D021UWA002.ant.amazon.com (10.13.139.48) by
 EX19D021UWA002.ant.amazon.com (10.13.139.48) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 15 Aug 2023 03:05:30 +0000
Received: from EX19D021UWA002.ant.amazon.com ([fe80::1695:13a9:9f52:f30a]) by
 EX19D021UWA002.ant.amazon.com ([fe80::1695:13a9:9f52:f30a%5]) with mapi id
 15.02.1118.030; Tue, 15 Aug 2023 03:05:30 +0000
From: "Herrenschmidt, Benjamin" <benh@amazon.com>
To: "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
	"greg@kroah.com" <greg@kroah.com>
CC: "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [TECH TOPIC] Improving resource ownership and life-time in linux
 device drivers
Thread-Topic: [TECH TOPIC] Improving resource ownership and life-time in linux
 device drivers
Thread-Index: AQHZzyVZpJy1Wy9aZkOkfZ0ea2m8iA==
Date: Tue, 15 Aug 2023 03:05:29 +0000
Message-ID: <0ac319f6dfdc1f00f2b1e6007d6ef06f07884128.camel@amazon.com>
References: <CACMJSev18ZdTVDK7j3gCpzw4rAiaNMZRT4KSvLzd99H61XwMOA@mail.gmail.com>
	 <2023081048-skittle-excusable-2c9f@gregkh>
In-Reply-To: <2023081048-skittle-excusable-2c9f@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.43.143.134]
Content-Type: text/plain; charset="utf-8"
Content-ID: <87B526D20706414396896496AD47C981@amazon.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

T24gVGh1LCAyMDIzLTA4LTEwIGF0IDE3OjQ3ICswMjAwLCBHcmVnIEtIIHdyb3RlOg0KPiA+IA0K
Li4uLy4uLg0KDQo+ID4gSSBoYXZlIHNpbmNlIGV4cGVyaW1lbnRlZCB3aXRoIHNldmVyYWwgYXBw
cm9hY2hlcyBhbmQgd291bGQgbGlrZSB0bw0KPiA+IHByZXNlbnQgc29tZSB1cGRhdGVzIG9uIHRo
aXMgc3ViamVjdC4gRHVyaW5nIHRoaXMgdGFsayBJIHBsYW4gdG8ganVtcA0KPiA+IHN0cmFpZ2h0
IGludG8gcHJlc2VudGluZyBjb25jcmV0ZSBpZGVhcyBhbmQgdGltZWxpbmVzIGZvciBpbXByb3Zp
bmcNCj4gPiB0aGUgZHJpdmVyIG1vZGVsIGFuZCBpbnRyb2R1Y2luZyBzb21lIHVuaWZpY2F0aW9u
IGluIHRoZSB3YXkNCj4gPiBzdWJzeXN0ZW1zIGhhbmRsZSBkcml2ZXIgZGF0YS4gV2hpbGUgdGhp
cyBpcyBhIHNpZ25pZmljYW50IGVmZm9ydA0KPiA+IHNwYW5uaW5nIG11bHRpcGxlIGRldmljZSBz
dWJzeXN0ZW1zIHRoYXQgd2lsbCBuZWVkIHRvIGJlIGNhcnJpZWQgb3V0DQo+ID4gaW4gbWFueSBw
aGFzZXMgb3ZlciB3aGF0IHdpbGwgbW9zdCBsaWtlbHkgYmUgeWVhcnMsIHdpdGhvdXQgYWRkcmVz
c2luZw0KPiA+IHRoZSBwcm9ibGVtcywgd2UnbGwgYmUgbGVmdCB3aXRoIG1hbnkgcGFydHMgb2Yg
dGhlIGtlcm5lbCBub3QgYmVpbmcNCj4gPiBhYmxlIHRvIGNvcnJlY3RseSBoYW5kbGUgc2ltcGxl
IGRyaXZlciB1bmJpbmRzLg0KPiANCj4gSSdtIGFsbCBmb3IgdGhpcywgd2UgbmVlZCBzb21lIG1h
am9yIHdvcmsgaW4gdGhpcyBhcmVhLg0KDQpJJ3ZlIGxvc3QgdHJhY2sgYSBiaXQgb2Ygd2hpY2gg
c3VtbWl0IGlzIHdoaWNoIGFzIEknbSBvcGVyYXRpbmcgZnVydGhlcg0KYXdheSBmcm9tIHRoZSBr
ZXJuZWwgdGhhbiBJJ2QgbGlrZSB0byB0aGVzZSBkYXlzLCBidXQgdGhpcyBpcw0KZGVmaW5pdGVs
eSBzb21ldGhpbmcgSSB3b3VsZCBsaWtlIHRvIHNlZSBwcmVzZW50ZWQgdG8gYXMgd2lkZSBhbg0K
YXVkaWVuY2UgYXMgcG9zc2libGUgOikNCg0KQ2hlZXJzLA0KQmVuLg0KDQo=

