Return-Path: <ksummit+bounces-800-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 376985EFEA2
	for <lists@lfdr.de>; Thu, 29 Sep 2022 22:26:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DB6F1C209C2
	for <lists@lfdr.de>; Thu, 29 Sep 2022 20:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A2C05A65;
	Thu, 29 Sep 2022 20:26:22 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from premium237-5.web-hosting.com (premium237-5.web-hosting.com [66.29.146.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C4D53B5;
	Thu, 29 Sep 2022 20:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sladewatkins.net; s=default; h=To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+AfdzDbB6qFHwhHUz93W6CYPO+fA//BDSU2BSgua2ic=; b=f6tN5l7rsIrslJiGjUQ686RN10
	E+xInOf2oYk4nJKU571gUNBhesBhcAG9uCYE+N6V0QRBFAVQjsS9r06z+Xfzxm57BjC7jUjVQVcDO
	zQ+v+kWFDvFUaa96L88/t7KUb7TE9gtrCa5II5AmQBZEktvZSN/jIy0Li/szoCWNA0P1ksMrw2BIS
	nnrv3O/TooLFtpzhtU18ruso1XDggw0ZK9IREQVe3h24qQByXQLaEv7aD1+fNWax+Kove7W/JAzk5
	r7EQBhkFOLvJ5/7YxCShyNCliWWHVekfjIbUa/jHpu2w4jy8W/44fXMqrsCXNYMjU2l7Pkjms8Kwv
	JMHb5jrg==;
Received: from pool-108-4-135-94.albyny.fios.verizon.net ([108.4.135.94]:55375 helo=smtpclient.apple)
	by premium237.web-hosting.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <srw@sladewatkins.net>)
	id 1oe06s-004cQC-Bb;
	Thu, 29 Sep 2022 16:26:18 -0400
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
From: Slade Watkins <srw@sladewatkins.net>
In-Reply-To: <591ab7d4-b283-32bf-13d8-419a5b91c365@gmx.com>
Date: Thu, 29 Sep 2022 16:26:15 -0400
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Thorsten Leemhuis <linux@leemhuis.info>,
 workflows@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 ksummit@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <F6A94603-563D-4627-A62F-9B9A48F3A3AD@sladewatkins.net>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
 <93a37d72-9a88-2eec-5125-9db3d67f5b65@gmx.com>
 <20220929130410.hxtmwmoogzkwcey7@meerkat.local>
 <7b427b41-9446-063d-3161-e43eb2e353f9@gmx.com>
 <20220929135325.4riz4ijva2vc7q5p@meerkat.local>
 <95c3384b-53d0-fd6c-6ec5-a7e03fdeddfc@gmx.com>
 <20220929153135.vu43n5kgdj4a3at6@meerkat.local>
 <591ab7d4-b283-32bf-13d8-419a5b91c365@gmx.com>
To: "Artem S. Tashkinov" <aros@gmx.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - premium237.web-hosting.com
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - sladewatkins.net
X-Get-Message-Sender-Via: premium237.web-hosting.com: authenticated_id: srw@sladewatkins.net
X-Authenticated-Sender: premium237.web-hosting.com: srw@sladewatkins.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-From-Rewrite: unmodified, already matched

Hi,

> On Sep 29, 2022, at 12:06 PM, Artem S. Tashkinov <aros@gmx.com> wrote:
>=20
> On 9/29/22 15:31, Konstantin Ryabitsev wrote:
>>=20
>>=20
>> In fact, he probably did this by replying to emails, not via the web
>> interface.
>=20
> Nope, I CC'ed him.

I think you can still reply via email if you=E2=80=99re a Cc. Been a =
while though.=20

Regardless =E2=80=94 not the point of the thread so it=E2=80=99s not =
worth arguing about.

-srw


