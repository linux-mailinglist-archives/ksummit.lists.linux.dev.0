Return-Path: <ksummit+bounces-570-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 748F240B363
	for <lists@lfdr.de>; Tue, 14 Sep 2021 17:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 6955F1C0F30
	for <lists@lfdr.de>; Tue, 14 Sep 2021 15:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4D03FD4;
	Tue, 14 Sep 2021 15:44:13 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4D33FD0
	for <ksummit@lists.linux.dev>; Tue, 14 Sep 2021 15:44:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="221709464"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; 
   d="scan'208";a="221709464"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2021 08:43:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; 
   d="scan'208";a="452102433"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga002.jf.intel.com with ESMTP; 14 Sep 2021 08:43:33 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 14 Sep 2021 08:43:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 14 Sep 2021 08:43:32 -0700
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.2242.012;
 Tue, 14 Sep 2021 08:43:32 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Arnd Bergmann <arnd@arndb.de>, Dave Airlie <airlied@gmail.com>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>, Linus Walleij
	<linus.walleij@linaro.org>, Greg KH <greg@kroah.com>, Leon Romanovsky
	<leon@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Thomas Gleixner <tglx@linutronix.de>, Josh Triplett <josh@joshtriplett.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>, "dev@tvm.apache.org"
	<dev@tvm.apache.org>
Subject: RE: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Thread-Topic: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Thread-Index: AQHXpoha9rsRhCzJfEWlBUpstbXp8queVUYAgAAO1ACAAALIAIAAsaIAgAATygCAAAY4gIAAp5yAgABrQ4CAADIFgIAAEYyAgABSwwCAAA3XAIAABWQAgABmdoCAAAIvAIAABpCAgAAbtYCAAPKQgIAACXUAgACJKgCAABiwgIAAoNMA///3EJA=
Date: Tue, 14 Sep 2021 15:43:32 +0000
Message-ID: <e2b3df421b2e4104a7581314520ccb9e@intel.com>
References: <87ilz8c7ff.ffs@tglx> <YTyFZufZHu9BSFxk@unreal>
 <YTyWANV/mSkQbYhj@pendragon.ideasonboard.com> <YTybN5QwAnLfSBZC@unreal>
 <YT0n0SaWnM8aVr/S@pendragon.ideasonboard.com> <YT2By1+yuo7rcu2D@unreal>
 <YT2rwbBR6ilHmwSZ@kroah.com> <YT26ebT6xXWsnVMw@unreal>
 <YT3/5kJuhw/QVqrw@kroah.com> <YT4LgkK+ejUWljEh@unreal>
 <YT4QCHwnqZL/rl0z@kroah.com>
 <CAPM=9twpxAP13fEv8BxsSkd4Xcqxu989F3biiPFFDgKRADL0KQ@mail.gmail.com>
 <CAKMK7uHQw8=GKpayxzOJUs4BnwoVDS08Y9bynp6=VH+eW35Pgw@mail.gmail.com>
 <CAPM=9txdCs-pXfw1Q=o_tMcmPafHcwV6_K5Sh=Vnj6d=G-tm_A@mail.gmail.com>
 <CACRpkdZRy8b3B8chCnpEHV3_qfBS6kCqMNmCPy4MV0vf0-AsAw@mail.gmail.com>
 <CAK8P3a2Fo=O3tM2vrFzbifc9rkmz9b3homwitTg5WNJrpDcLxA@mail.gmail.com>
 <CAKMK7uFrOpH9NG3XB1dT889r4HrUHaotte1D4Nh2=5tjD9VEpg@mail.gmail.com>
 <CAK8P3a2pvCwuSic9yevW0xmMy0-F1FEgfQ-_Rc7wWDs7PJEf_w@mail.gmail.com>
 <CAPM=9tw3WTUb6R5VaDR002P0QYbcZ0uPETC4r0MPBBqySLe09Q@mail.gmail.com>
 <CAK8P3a2rATGsoQWGMESMWChQ317YKpryyVTwxkU8J1sUajxf-w@mail.gmail.com>
In-Reply-To: <CAK8P3a2rATGsoQWGMESMWChQ317YKpryyVTwxkU8J1sUajxf-w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

PiBkKSBkZXZpY2UgaGFzIGZ1bGwgcHJlZW1wdCBvbiBhbGwgaHcgYmxvY2tzLCBpcyBmdWxseSBj
b2hlcmVudCwgY2FuDQo+IHRyaWdnZXIgcGFnaW5nIHNhbmVseSwgdXNlcnNwYWNlIGNhbiBzdWJt
aXQgZGlyZWN0bHkgKHBpcGUgZHJlYW0pLg0KDQpOb3QgYSBwaXBlIGRyZWFtLiBDb21pbmcgc29v
biB0byBhIHNlcnZlciBuZWFyIHlvdS4gVGhlIEludGVsICJFTlFDTUQiDQppbnN0cnVjdGlvbiBj
YW4gYmUgdXNlZCBmcm9tIHVzZXJzcGFjZSB0byBzdWJtaXQgYSBkZXNjcmlwdG9yIHRvIGFuDQph
Y2NlbGVyYXRvciBkZXZpY2UuIEVOUUNNRCBwaWNrcyB1cCB0aGUgUEFTSUQgZnJvbSBhbiBNU1Ig
ZHVyaW5nDQpzdWJtaXNzaW9uLCBzbyB0aGUgZGV2aWNlIGNhbiBhc2sgdGhlIGlvbW11IHRvIHRy
YW5zbGF0ZSB2aXJ0dWFsIGFkZHJlc3Nlcw0KYmFzZWQgb24gdGhlIGFkZHJlc3Mgc3BhY2Ugb2Yg
dGhlIHByb2Nlc3MgdGhhdCBzdWJtaXR0ZWQgdGhlIGRlc2NyaXB0b3IuDQoNCi1Ub255DQo=

